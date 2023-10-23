DROP DATABASE IF EXISTS passwords;

CREATE DATABASE passwords;

USE passwords;

CREATE TABLE IF NOT EXISTS passwords_content (
    content_id INT AUTO_INCREMENT PRIMARY KEY
    website_name VARCHAR(64) NOT NULL,
    website_url VARCHAR(256) NOT NULL,
    first_name VARCHAR(32) NOT NULL,
    last_name VARCHAR(32) NOT NULL,
    username VARCHAR(64) NOT NULL,
    email VARCHAR(32) NOT NULL,
    password VARBINARY(256) NOT NULL,
    commment TEXT,
    PRIMARY KEY (content_id)
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

--Need to have 10 initial entries
INSERT INTO passwords_content (website_name,website_url,first_name,last_name,username,email,password,commment) VALUES (
    'MySQL',
    'https://www.mysql.com',
    'Derim',
    'Belica',
    'dbel21',
    'dbel21@gmail.com',
    AES_ENCRYPT('mySQLPassword',AES_256),   --not sure how if this is implimented properly
    'New MySQL account for Derim'
),
(
    'UniversityOfHartford',
    'https://www.hartford.edu',
    'John',
    'Doe',
    'JD21',
    'JD21@hartford.edu',
    AES_ENCRYPT('myUHARTPassword',AES_256),   --not sure how if this is implimented properly
    'New UHART account for John'
)
,
(
    'UselessWebsite',
    'http://www.useless.com',
    'Michael',
    'Jackson',
    'MJ84',
    'MJ84@yahoo.com',
    AES_ENCRYPT('MJpassword',AES_256),   --not sure how if this is implimented properly
    'New account for Michael on the useless website'
)
;

UPDATE passwords_content SET website_url = 'http://www.mysql.com' WHERE website_name = 'MySQL';

SELECT timestamp FROM passwords_content WHERE website_name = 'MySQL';

DELETE FROM passwords_content WHERE website_name = 'UselessWebsite';