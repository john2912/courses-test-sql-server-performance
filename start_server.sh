# Copied from https://github.com/datacamp/docker-msft-sql-base/blob/master/start_server.sh

#! /bin/bash
# Start Pal Telemetry process in background 
#
/opt/mssql/bin/sqlservr-telemetry / &

# Start SQL Server
#
nohup /opt/mssql/bin/sqlservr $* </dev/null >mssql.log 2>&1 &
# TODO: we need to be able to check that the server is running
#       otherwise, sqlalchemy could try to connect before it has booted!
until nc -vz localhost 1433; do
    echo "no connection"
    sleep 1
done
