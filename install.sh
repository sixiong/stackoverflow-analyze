#suit for Ubuntu 14.10
cd stackoverflow-analyze
#install mysql
sudo apt-get install mysql-server mysql-client
#install python packages
pip install -r requirements.txt
#load common_schema into mysql
mysql --local-infile -u root -p < libs/common_schema-2.2.sql
