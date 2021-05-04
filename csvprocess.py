from pyspark.sql import SparkSession

from pyspark.sql.functions import split,when, regexp_replace

#import os
# os.environ["JAVA_HOME"] = "/usr/lib/jvm/java-8-openjdk-amd64"
# os.environ["SPARK_HOME"] = "/content//spark-3.1.1-bin-hadoop2.7"

spark = SparkSession.builder.master("local").appName("Colab").getOrCreate()

df_1 = spark.read.csv("dataset1.csv",header="true")
df_2 = spark.read.csv("dataset2.csv",header="true")

splitcol = split(df_1.name, " ")
df_1 = df_1.withColumn("first_name",splitcol[0])
df_1 = df_1.withColumn("last_name",splitcol[1])

splitcol = split(df_2.name, " ")
df_2 = df_2.withColumn("first_name",splitcol[0])
df_2 = df_2.withColumn("last_name",splitcol[1])

df_1 = df_1.filter(df_1.name.isNotNull()).filter(df_1.name != 'NAN')
df_2 = df_2.filter(df_2.name.isNotNull()).filter(df_2.name != 'NAN')

df_1 = df_1.withColumn('above_100',when(df_1.price>100,1).otherwise(0))
df_2 = df_2.withColumn('above_100',when(df_2.price>100,1).otherwise(0))


df_1 = df_1.withColumn('price', regexp_replace('price', r'0', ''))
df_2 = df_2.withColumn('price', regexp_replace('price', r'0', ''))

df_1.show()
df_2.show()

