#!/usr/bin/python
# -*- coding: UTF-8 -*-

import MySQLdb
from DBUtils.PooledDB import PooledDB
from mysql_settings import *

def initMysqlPool():
	pool = PooledDB(MySQLdb,MYSQL_CONNECTION_POOL_SIZE,host=HOST,user=USER,passwd=PASSWORD,db=DB,port=PORT)
	return pool

def initMysqlConn():
	# 打开数据库连接
	conn = MySQLdb.connect(host=HOST,user=USER,passwd=PASSWORD,db=DB,port=PORT)
	return conn
	MySQLdb.connect

def executeSql(conn,sql):
	cur = conn.cursor()
	try:
		cur.execute(sql)
		results = cur.fetchall()
	except Exception, e:
		return None
	cur.close()
	conn.close()
	return results

if __name__ == '__main__':
	pool = initMysqlPool()
	# conn = pool.connection()
	conn = initMysqlConn()
	data = executeSql(conn,'select * from Badges limit 2')
	print type(data)
	print len(data)
	print data
	for item in data:
		print item
	conn.close()
	pool.close()