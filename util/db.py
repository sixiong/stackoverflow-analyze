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

def executeSql(sql):
	conn = pool.connection()
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
	pool = _initMysqlPool()
	data = executeSql('select * from Badges')
	print type(data)
	print len(data)
	for item in data:
		print item
	pool.close()