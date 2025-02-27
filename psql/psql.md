## Update Debian packages:

```bash
sudo apt update
```
You need to type user password.

## Install PostgreSQL and -contrib package using the following command:
```bash
sudo apt install postgresql postgresql-contrib
```
_Type Y to continue when asked._

Wait until the installation is completed. 

## Verify PostgreSQL version:
```bash
$ psql --version
psql (PostgreSQL) 9.6.20
```

##### The default admin user is postgres. We need to setup a password for it. Use the following command to setup the password:

```bash
sudo passwd postgres
```

#####   Enter the password. I'm setting the password as 'password'.

```
$ sudo passwd postgres
```
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully

#### Test PostgreSQL
Start PostgreSQL service using the following commands:

```
$ sudo service postgresql start
# Or
sudo /etc/init.d/postgresql start
```

## Check the status of the service:

```
$ sudo service postgresql status
# Or
sudo /etc/init.d/postgresql status
```

## The output looks like the following:

```
9.6/main (port 5432): online
```

#### Try PostgresSQL prompt using the following command:

```bash
sudo -u postgres psql
```
The above command sudo the default user postgres and then run psql command:

```bash
$ sudo -u postgres psql
```
psql (9.6.20)
Type "help" for help.

postgres=#

##### Check databases by typing \l in psql command window:
```bash
\l
```
The output looks like the following screenshot:


Type \q to exit the CLI.


#### Stop the service using the following command:
```bash
$ sudo service postgresql stop
# Or
sudo /etc/init.d/postgresql stop
```