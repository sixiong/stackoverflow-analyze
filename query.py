#!/usr/bin/python
# -*- coding: UTF-8 -*-

from util import db


def query():
	query1 = ['Python','SQL']
	1.sql = 'select * from Posts x1 where x1.Tags in (select Id from Tags where TagName in ? or TagName in ?) and AnswerCount > 3 and x1.AcceptedAnswerId in (select x2.Id from Posts x2 where OwnerUserId  )'
	2 sql1 = 
	  sql2 = 
	  sql3 = 
	  result1 = db.executeSql(sql1)
	  result2 = db.executeSql(sql1)
	  result3 = db.executeSql(sql1)

	  Tuple -> list -> set
	  [(1,2,43544,356,24,23234),(),()]
	  set(result1) & result2 & result3


if __name__ == '__main__':
	main()