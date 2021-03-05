#How to set up zabbix on docker

#make .env file
1, vi .env
2, OS=alpine
   VERSION=3.0.15
   DB_NAME=zabbix
   DB_USER=zabbix
   DB_USER_PASSWORD=zabbix
   DB_ROOT_PASSWORD=zabbix
   HTTP_PORT=8080
   TIME_ZONE=Asia/Tokyo

   # 0 - basic information about starting and stopping of Zabbix processes;
   # 1 - critical information
   # 2 - error information
   # 3 - warnings
   # 4 - for debugging (produces lots of information)
   # 5 - extended debugging (produces even more information)
   LOG_LEVEL=3
3, :wq

#set up docker and docker-compose
1, sh docker.sh
2, confirm that docker and docker-compose installed

#set up zabbix
1, move to directory where docker-compose file exists
2, sudo -s(if you are not root user)
3, docker-compose up -d
4, confirm that docker containers set up
