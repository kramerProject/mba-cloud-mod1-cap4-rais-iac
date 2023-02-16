
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, min, max

# Cria objeto da Spark Session
spark = (SparkSession.builder.appName("Manual")
    .getOrCreate()
)


# Leitura de dados
enem = (
    spark
    .read
    .format("csv")
    .option("header", True)
    .option("sep", ",")
    .option("encoding", "ISO-8859-1")
    .option("inferSchema", True)
    .load("s3://test-401868797180/raw/fire.csv")
)

# Escreve a tabela em staging em formato delta
print("Writing parquet table...")
(
    enem
    .write
    .mode("overwrite")
    .format("parquet")
    .save("s3://test-401868797180/staging/")
)