import db
try:
    import xml.etree.cElementTree as ET
except ImportError:
    import xml.etree.ElementTree as ET

def load_xml_into_db(table_name):
	tree = ET.ElementTree(file='../data/meta/%s.xml'%table_name)
	root = tree.getroot()
	sql = "insert into ? Values ("
	length = len(root[0].attrib.keys())
	for i in xrange(length-1):
		sql = sql + "?,"
	sql = sql + "?);"
	print sql
	for child_of_root in root[0:2]:
		data = child_of_root.attrib

load_xml_into_db('Badges')