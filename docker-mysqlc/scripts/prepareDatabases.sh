#!/bin/bash

nicoDbIntegPassword="test"
vince2Password="test"

echo "************************************" 
echo "* Creating mysql schemas and users *"
echo "************************************"
echo ""

##
# $1 = user name
# $2 = value
function passwordCheck 
{
    if [[ $2 == "test" ]]; then
        echo -e "\e[31m WARNING : \e[0mMySQL ${1} password has not been changed !"
        echo "You should modify it in docker-mysqlc/scripts/prepareDatabases.sh"
    fi
}

##
# $1 = user name
# $2 = pattern
# $3 = value
function setMySqlUserPassword 
{   
    passwordCheck $1 $3
    sedExpression="s/{$2}/${3}/"

    sed $sedExpression /scripts/createDatabases.sql > /scripts/createDatabases.sql.tmp
    mv /scripts/createDatabases.sql.tmp /scripts/createDatabases.sql
}

setMySqlUserPassword "nico_db_integ" "NICO_DB_INTEG_PWD" $nicoDbIntegPassword
setMySqlUserPassword "vince2" "VINCE2_PWD" $vince2Password

mysql -h mysqld -u root --password=$MYSQL_ROOT_PASSWORD < /scripts/createDatabases.sql

