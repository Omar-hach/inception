-- create a table if it does not already exist, named after the environment variable SQL_DATABASE,
-- indicated in my .env file which will be sent by the docker-compose.yml
CREATE DATABASE IF NOT EXISTS `SQL_DATABASE`;

-- create the user SQL_USER if it does not exist, with the password SQL_PASSWORD
CREATE USER IF NOT EXISTS `SQL_USER`@'localhost' IDENTIFIED BY 'SQL_PASSWORD';

-- give the rights to the user SQL_USER with password SQL_PASSWORD
GRANT ALL PRIVILEGES ON `SQL_DATABASE`.* TO `SQL_USER`@'localhost' IDENTIFIED BY 'SQL_PASSWORD';

--  change the root rights by localhost, with the root password SQL_ROOT_PASSWORD
-- ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';

FLUSH PRIVILEGES;

-- turning off MySQL
-- mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

-- run the famous command that MySQL constantly recommends when it starts.
-- exec mysqld_safe