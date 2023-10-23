--Command to create a new entry into the database
INSERT INTO passwords_content (website_name,website_url,first_name,last_name,username,email,password,commment) VALUES
(
    'Google',
    'http://www.google.com',
    'Billy',
    'Bob',
    'BillyBob123',
    'BB@gmail.com',
    AES_ENCRYPT('BBpassword',AES_256),
    'New Google account for Billy'
);

--Command to get the password associated with a URL
SELECT AES_DECRYPT(password,AES_256) 
AS decrypted_password
FROM passwords_content
WHERE website_url = 'https://www.mysql.com';

--Command to get all password-related data (password, and associated urls that have https)
SELECT website_name, website_url, AES_DECRYPT(password,AES_256) 
AS decrypted_passwords_and_info
FROM passwords_content
WHERE website_url LIKE 'https%';

--Commmand to change URL associated with one of the passwords
UPDATE passwords_content 
SET website_url = 'http://www.changedURL.com'
WHERE password = AES_DECRYPT(password(2),AES_256); --NOT SURE IF THIS IS PROPER, I tried to decrypt the password at ID 2

--Command to change any password
UPDATE passwords_content
SET password = AES_ENCRYPT('newChangedPassword',AES_256)
WHERE content_id = 3; --Not sure if im calling an int properly should it be 3, or (3), or  '3'?

--Command to remove a URL
DELETE website_url
FROM passwords_content
WHERE website_name = 'UselessWebsite';

--Command to remove a password
DELETE password
FROM passwords_content
WHERE website_name = 'UselessWebsite';