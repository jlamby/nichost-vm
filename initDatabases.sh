#!/bin/bash

mysqlRootPassword="test"

function passwordCheck 
{
    if [[ $mysqlRootPassword == "test" ]]; then
        echo -e "\e[31m WARNING : \e[0mMySQL root password has not been changed !"
        echo "You should modify it in initDatabases.sh"
    fi
}

function containerExists
{
    containerExists=0
    res=$(docker ps -a | grep $1)

    if [ -n "$res" ]; then
        containerExists=1
    fi

    echo $containerExists
}

function bootDbDatasContainer
{
    isContainerExists=$(containerExists DB-DATAS)

    if [[ $isContainerExists -eq 0 ]]; then
        docker run --name DB-DATAS -d -i -t db-datas
    else
        docker start DB-DATAS
    fi
}

function bootInitDatabaseContainer {
    docker run -i    --rm                           \
        --name mysqlc                               \
        -e MYSQL_ROOT_PASSWORD=$mysqlRootPassword   \
        --link mysqld:mysqld                        \
        mysqlc "/scripts/prepareDatabases.sh"
}

function createDatabaseClientContainer
{
    docker run -d -i -t                             \
        --name mysqlc                               \
        -e MYSQL_ROOT_PASSWORD=$mysqlRootPassword   \
        --link mysqld:mysqld                        \
        mysqlc
}

function bootMysqldContainer
{
    isContainerExists=$(containerExists mysqld)

    if [[ $isContainerExists -eq 0 ]]; then
        passwordCheck

        docker run -d -i -t                             \
            --name mysqld                               \
            -e MYSQL_ROOT_PASSWORD=$mysqlRootPassword   \
            --volumes-from DB-DATAS                     \
            mysql

        echo "    Waiting for mysqld first run completion ..."
        sleep 10

        bootInitDatabaseContainer
        createDatabaseClientContainer
    else
        docker start mysqld
    fi
}

# docker rm -f DB-DATAS mysqlc mysqld

# run database datas container
bootDbDatasContainer 
bootMysqldContainer
