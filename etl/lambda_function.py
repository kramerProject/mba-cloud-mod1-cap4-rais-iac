import boto3

def handler(event, context):
    """
    Lambda function that starts a job flow in EMR
    """

    client = boto3.client("emr", region_name='us-east-1')

    cluster_id = client.run_job_flow(
        Name='EMR-Kramer-IGTI-delta',
        ServiceRole='EMR_DefaultRole',
        JobFlowRole='EMR_EC2_DefaultRole',
        VisibleToAllUsers=True,
        LogUri='s3//datalake-kramer-edc-tf-producao-401868797180/emr-logs',
        ReleaseLabel='emr-6.3.0',
        Instances={
            'InstanceGroups': [
                {
                    'Name': 'Master nodes',
                    'Market': 'SPOT',
                    'InstanceRole': 'MASTER',
                    'InstanceType': 'm5.xlarge',
                    'InstanceCount': 1,
                },
                {
                    'Name': 'Worker nodes',
                    'Market': 'SPOT',
                    'InstanceRole': 'CORE',
                    'InstanceType': 'm5.xlarge',
                    'InstanceCount': 1,
                },
            ],
            'Ec2KeyName': 'kramer-igti-rais',
            'KeepJobFlowAliveWhenNoSteps': True,
            'TerminationProtected': False,
            'Ec2SubnetId': 'subnet-005eeffbaafd46014'
        },

        Applications=[
            {'Name': 'Spark'},
            {'Name': 'Hive'},
            {'Name': 'Pig'},
            {'Name': 'Hue'},
            {'Name': 'JupyterHub'},
            {'Name': 'JupyterEnterpriseGateway'},
            {'Name': 'Livy'},
        ],

        Configurations=[
            {
                "Classification": "spark-env",
                "Properties": {},
                "Configurations": [
                    {
                        "Classification": "export",
                        "Properties": {
                            "PYSPARK_PYTHON": "/usr/bin/python3",
                            "PYSPARK_DRIVER_PYTHON": "usr/bin/python3"
                        }
                    }
                ]
            },
            {
               "Classification": "spark-hive-site",
               "Properties": {
                    "hive.metastore.client.factory.class": "com.amazonaws.glue.catalog.metastore.AWSGlueDataCatalogHiveClientFactory"
               }
            },
            {
               "Classification": "spark-defaults",
               "Properties": {
                    "spark.submit.deployMode": "cluster",
                    "spark.speculation": "false",
                    "spark.sql.adaptive.enabled": "true",
                    "spark.serializer": "org.apache.spark.serializer.KryoSerializer"
               }
            },
            {
               "Classification": "spark",
               "Properties": {
                    "maximizeResourceAllocation": "true"
               }
            }
        ],

        StepConcurrencyLevel=1,

        Steps=[
            {
                'Name': 'Spark JOB',
                'ActionOnFailure': 'CONTINUE',
                'HadoopJarStep': {
                    'Jar': 'command-runner.jar',
                    'Args': [
                        'spark-submit',
                        '--packages', 'io.delta:delta-cre_2.12:1.0.0',
                        '--conf', 'spark.sql.extensions=io.delta.sql.DeltaSparkSessionExtension',
                        '--conf', 'spark.sql.catalog.spark_catalog=org.apache.spark.sql.delta.catalog.DeltaCatalog',
                        '--master', 'yarn',
                        '--deploy-mode', 'cluster',
                        's3//datalake-kramer-edc-tf-producao-401868797180/pyspark/spark_job.py'
                    ]
                }
            }
        ],

    )

    job_flow_id = cluster_id['JobFlowId']

    return {
        'statusCode': 200,
        'body': f"Start job flow {job_flow_id}"
    }