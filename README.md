## Description

This a practical activity part of the MBA in Data Engineering from XPE. It is expected to make raw data [RAIS_2020](http://pdet.mte.gov.br/microdados-rais-e-caged) ingestion in an S3 Data Lake , then use a BIG Data tecnology to transform and store data in parquet. After that, one should be able to use Athenas to perform SQL querys in order to answer some questions concerning the Data Base.

## About the source

The RAIS is an Administrative Registry, held annually, created with the purpose of meeting the control, statistics and information needs of government entities in the social area. It constitutes an essential instrument for complying with legal norms, as well as being of fundamental importance for monitoring and characterizing the formal labor market.
## What was Done

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


## Architecture

For practice purposes two architecture were used as shown bellow:

Data Lakehouse, Delta Lake and Amazon EMR

![AWS Terraform v1](/img/arq_lamb.png)

Using Glue and Athenas

![AWS Terraform v2](/img/arq_lamb.png)