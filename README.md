

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



1. Import the tag template from the template gallery.
2. Enter the necessary settings for the tag.
3. Set the tag’s trigger
    1. Create a new “Custom” trigger.
    2. Set the trigger to fire on all events.
    3. Name the trigger.
    4. Save the trigger.
4. Save the tag.
5. Publish the new tag.


## Tag Fields



*   **Measurement ID**
    *   Enter either the measurement ID for the hits you want written to BigQuery, or enter \* to match all measurement IDs. The field defaults to \*.
*   **Write IP Address to BigQuery**
    *   Enter either true, false, or a variable that resolves to true or false. If any other value is entered, the IP address will not be written to BigQuery for each hit. If set to true, the tag will use the [getRemoteAddress() api](https://developers.google.com/tag-platform/tag-manager/server-side/api#getremoteaddress) to get the IP address where the request originated.
*   **Use Consent Mode**
    *   If checked, then the tag will check for the presence of the gcs query parameter. The behavior of the tag will change based on the value of the parameter. If there are changes to the parameter values, the tag may not always respect consent mode.
        *   If the value is G100, then nothing will be written to BigQuery.
        *   If the value is G101, then the following parameters will not be written to BigQuery: gclid, dclid, gbraid, wbraid, gclsrc, \_gl. Additional parameters can be added to the “marketingParams” array in the template tag code if necessary.
        *   If the value is G110, then nothing will be written to BigQuery.
        *   If the value is G111, then all parameters will be written to BigQuery.
    *   If unchecked, then consent will not be checked and data will be written to BigQuery.
*   **BigQuery Settings**
    *   Enter the BigQuery project, dataset, and table IDs in their respective text boxes.


## Data Not Collected

The following data is not collected:



*   Geographic Information (country, region, city)