## Google Analytics 4 to BigQuery Tag Template

This is not an officially supported Google product.


## Summary

This repository contains the code for the GA4 to BigQuery Tag template and the schema for the corresponding table in BigQuery. The tag template automatically writes GA4 hits to BigQuery as quickly as possible. Each hit is written as a separate row in BigQuery.


## BigQuery Table Setup

For the hit data to be successfully written to BigQuery, you must set up a BigQuery table with the correct schema. To create the table, follow the steps in deploy.sh by entering the following into Cloud Shell.

```

rm -rf sgtm-ga4-to-bigquery && git clone https://github.com/google/sgtm-ga4-to-bigquery.git && cd sgtm-ga4-to-bigquery && bash deploy.sh

```


## Tag Setup



1. Import the template.tpl file as a custom tag in your server-side workspace.
	*	Download template.tpl to your computer.
	*	Open your GTM workspace.
	*	Navigate to templates.
	*	Click "New" under Tag Templates.
	*	In the upper-righthand corner click the three dots and select import.
	* Select template.tpl and save.
2. Navigate to Tags, click new, click on tag configuration, and select GA4 to BigQuery under Custom.
3. Enter the necessary settings for the tag.
4. Set the tag’s trigger
    1. Create a new “Custom” trigger.
    2. Set the trigger to fire on all events.
    3. Name the trigger.
    4. Save the trigger.
5. Save the tag.
6. Publish the new tag.


## Tag Fields



*   **Measurement ID**
    *   Enter either the measurement ID for the hits you want written to BigQuery, or enter \* to match all measurement IDs. The field defaults to \*.
*   **Write IP Address to BigQuery**
    *   Enter either true, false, or a variable that resolves to true or false. If any other value is entered, the IP address will not be written to BigQuery for each hit. If set to true, the tag will use the [getRemoteAddress() api](https://developers.google.com/tag-platform/tag-manager/server-side/api#getremoteaddress) to get the IP address where the request originated.
*   **BigQuery Settings**
    *   Enter the BigQuery project, dataset, and table IDs in their respective text boxes.


## Data Not Collected

The following data is not collected:



*   Geographic Information (country, region, city)
*   Anything that relies on Google Signals data
*   Dimensions that rely on parsing the user agent string will not be populated but the user agent string will be collected
