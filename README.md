# Description

This a practical activity part of the MBA in Data Engineering from XPE. It is expected to make raw data (RAIS 2020) ingestion in an S3 Data Lake , then use a BIG Data tecnology to transform and store data in parquet. After that one should be able to use Athenas to perform SQL querys in order to answer some questions concerning the Data Base. 
# What was Done

- [X] Raw Data ingestion using boto3
- [X] Infra as Code with terraform including
    - [X] Lambda function
    - [X] EMR Cluster
    - [X] Glue Job
    - [X] Glue crawler
    - [X] Data Lake
- [X] Data transform
    - [X] Modify column names, replace spaces with “_”, remove
accents and put all lowercase letters
    - [X] Build the “uf” column with the following command: rais =
`rais.withColumn("uf",
f.col("municipio").cast('string').substr(1,2).cast('int'))`
    - [X] Modify the payment columns from int to double
- [X] Transform the data into parquet format and write it to the staging folder 
- [X] Perform sql querys to extract Data information


# Architecture

![AWS Terraform v1](/img/arq_lamb.png)

