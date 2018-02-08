# copied from https://github.com/datacamp/courses-msft-transact-sql
pip3 install git+git://github.com/datacamp/sqlwhat-ext --no-deps

# Follow ideas from https://github.com/datacamp/docker-msft-sql-base/blob/master/requirements.sh

# Start database server
./start_server.sh

# Simple task: return available tables
isql Default sa $SA_PASSWORD -v < test.sql
