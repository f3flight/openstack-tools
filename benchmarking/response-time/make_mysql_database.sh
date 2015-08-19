#/bin/bash
mysql -e "create database metadata"
mysql -D metadata -e "create table results ( id INT NOT NULL AUTO_INCREMENT, timestamp DATETIME, nanos INT, responce_time DOUBLE, error BOOLEAN, PRIMARY KEY (id) )"
