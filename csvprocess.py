df_1 = spark.read.csv("dataeng_test-master/dataset1.csv",header="true")
df_2 = spark.read.csv("dataeng_test-master/dataset2.csv",header="true")

splitcol = split(df_1.name, " ")
df_1 = df_1.withColumn("first_name",splitcol[0])
df_1 = df_1.withColumn("last_name",splitcol[1])

splitcol = split(df_2.name, " ")
df_2 = df_2.withColumn("first_name",splitcol[0])
df_2 = df_2.withColumn("last_name",splitcol[1])

df_1 = df_1.filter(df_1.name.isNotNull()).filter(df_1.name != 'NAN')
df_2 = df_2.filter(df_2.name.isNotNull()).filter(df_1.name != 'NAN')

df_1 = df_1.withColumn('above_100',when(df_1.price>100,1).otherwise(0))
df_2 = df_2.withColumn('above_100',when(df_2.price>100,1).otherwise(0))


df_1 = df_1.withColumn('price', regexp_replace('price', r'0', ''))
df_2 = df_2.withColumn('price', regexp_replace('price', r'0', ''))

df_1.show()
df_2.show()