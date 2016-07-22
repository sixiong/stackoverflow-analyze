#!/usr/bin/python
# encoding: utf-8
import MySQLdb
# 打开数据库连接
db = MySQLdb.connect("localhost","root","123456","stackoverflowly" )
# 使用cursor()方法获取操作游标
cursor = db.cursor()
# # 如果数据表已经存在使用 execute() 方法删除表。
cursor.execute("DROP TABLE IF EXISTS EMPLOYEE")
# 创建数据表SQL语句
sql = """CREATE TABLE EMPLOYEE (
         FIRST_NAME  CHAR(20) NOT NULL,
         LAST_NAME  CHAR(20),
         AGE INT,
         SEX CHAR(1),
         INCOME FLOAT )"""
cursor.execute(sql)

sql = "insert into EMPLOYEE VALUES ('LEI','YAN',20,'f',30000.8);"
cursor.execute(sql)

sql = "select * from EMPLOYEE"
cursor.execute(sql)
db.commit()
print cursor.fetchone()

cursor.close()
db.close()