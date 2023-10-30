--Command to create a new entry into the database
INSERT INTO passwords_content (website_name,website_url,first_name,last_name,username,email,password,comment) VALUES
(
    'Google',
    'http://www.google.com',
    'Billy',
    'Bob',
    'BillyBob123',
    'BB@gmail.com',
    AES_ENCRYPT('BBpassword',@UNHEXEncryptionKey),
    'New Google account for Billy'
);

--Command to get the password associated with a URL
SELECT CONVERT(AES_DECRYPT(password,@UNHEXEncryptionKey) USING utf8) 
AS decrypted_password
FROM passwords_content
WHERE website_url = 'http://www.mysql.com';

--Command to get all password-related data (password, and associated urls that have https)
SELECT website_name, website_url, CONVERT(AES_DECRYPT(password,@UNHEXEncryptionKey) USING utf8) 
AS decrypted_passwords_and_info
FROM passwords_content
WHERE website_url LIKE 'https%';

--Commmand to change URL associated with one of the passwords
UPDATE passwords_content 
SET website_url = 'http://www.changedURL.com'
WHERE CONVERT(AES_DECRYPT(password,@UNHEXEncryptionKey) USING utf8) = 'mySQLPassword';

--Command to change any password
UPDATE passwords_content
SET password = AES_ENCRYPT('newChangedPassword',@UNHEXEncryptionKey)
WHERE content_id = 1; --Not sure if im calling an int properly should it be 3, or (3), or  '3'?

--Command to remove a URL
DELETE passwords_content
WHERE website_url = 'http://www.hotpocket.com';

--Command to remove a password
UPDATE passwords_content
WHERE password = CONVERT(AES_DECRYPT(password,@UNHEXEncryptionKey) USING utf8) = 'LinSecretPW';