# copied from https://github.com/datacamp/courses-msft-transact-sql
pip3 install git+git://github.com/datacamp/sqlwhat-ext --no-deps

# Follow sqlcmd instructions from
# https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools

# Add /opt/mssql-tools/bin/ to your PATH environment variable in a bash shell.
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> /home/repl/.bash_profile
echo 'export TERM=xterm' >> /home/repl/.bash_profile
source /home/repl/.bash_profile

# Import the public repository GPG keys.
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# Register the Microsoft Ubuntu repository.
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list

# Update the sources list and run the installation command with the unixODBC developer package.
apt-get update && apt-get --yes install mssql-tools unixodbc-dev

# Check it works
sqlcmd -e -?
