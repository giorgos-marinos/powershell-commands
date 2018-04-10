docker run --name mySqlLocal -e MYSQL_ROOT_PASSWORD=XRONOS -d mysql
#docker run --name mySqlLocal -v /work/mySQL:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=XRONOS -d mysql
docker run -it --link mySqlLocal:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'

docker stop mySqlLocal
docker rm mySqlLocal