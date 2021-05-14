from pyspark.sql import SparkSession
from pyspark.sql.functions import split,when, regexp_replace

spark = SparkSession.builder.master("local").appName("Colab").getOrCreate()

df_1 = spark.read.csv("dataset1.csv",header="true")


splitcol = split(df_1.name, " ")
df_1 = df_1.withColumn("first_name",splitcol[0])
df_1 = df_1.withColumn("last_name",splitcol[1])


df_1 = df_1.filter(df_1.name.isNotNull()).filter(df_1.name != 'NAN')


df_1 = df_1.withColumn('above_100',when(df_1.price>100,1).otherwise(0))



df_1 = df_1.withColumn('price', regexp_replace('price', r'0', ''))


df_1.show()


