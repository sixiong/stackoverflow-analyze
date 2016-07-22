#!/usr/bin/python
# -*- coding: UTF-8 -*-

import MySQLdb
from DBUtils.PooledDB import PooledDB

def _initMysqlPool():
	pool = PooledDB(MySQLdb,5,host='localhost',user='root',passwd='123456',db='meta_stackoverflow',port=3306)
	return pool

def _initMysqlConn():
	# 打开数据库连接
	conn = MySQLdb.connect("localhost","root","123456","meta_stackoverflow")
	return conn

def showDbVersion(pool):
	conn = pool.connection()
	# 使用cursor()方法获取操作游标 
	cursor = conn.cursor()

	# 使用execute方法执行SQL语句
	cursor.execute("SELECT VERSION()")

	# 使用 fetchone() 方法获取一条数据库。
	data = cursor.fetchone()

	print "Database version : %s " % data
	cursor.close()
	conn.close()

def executeSql(param):
	conn = pool.connection()
	cur = conn.cursor()
	try:
		if type(param) == str:
			cur.execute(param)
		elif type(param) == tuple:
			cur.execute(param[0],param[1])
		else:
			return None
		results = cur.fetchall()
	except Exception, e:
		return None
	cur.close()
	conn.close()
	return results

if __name__ == '__main__':
	pool = _initMysqlPool()
	showDbVersion(pool)
	data = executeSql('select * from Badges')
	print type(data)
	print len(data)
	for item in data:
		print item
	pool.close()