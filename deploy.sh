#!/bin/bash
###########################################################################
#
#  Copyright 2022 Google Inc.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

echo "~~~~~~~~ Welcome ~~~~~~~~~~"
echo "Enabling required APIs."
gcloud services enable bigquery.googleapis.com --async
read -p "Please enter your GCP PROJECT ID: " project_id
read -p "Please enter a new BigQuery dataset name (cannot include spaces): " dataset_id
echo "~~~~~~~~ Creating BigQuery Dataset ~~~~~~~~~~"
bq mk -d $project_id:$dataset_id
echo "~~~~~~~~ BigQuery Dataset Create ~~~~~~~~~~"
read -p "Please enter a new BigQuery table name (cannot include spaces): " table_id
echo "~~~~~~~~ Creating BigQuery Table ~~~~~~~~~~"
bq mk -t --time_partitioning_type=DAY \
	--schema=./sgtm_ga4_to_bigquery_schema.json \
	$project_id:$dataset_id.$table_id
echo "~~~~~~~~ BigQuery Table Created ~~~~~~~~~~"

echo "***************************
*
* Setup Complete!
*
* The BigQuery table you must use with the server-side Tag Manager
* GA4 to BigQuery tag template has been created.
*
* Use the following settings when setting up the tag:
* - Project ID: $project_id
* - Dataset ID: $dataset_id
* - Table ID: $table_id
***************************"
