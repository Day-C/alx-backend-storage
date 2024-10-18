--  create a table with a row of containg multiple options

create TABLE IF NOT EXISTS users(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	email VARCHAR(225) NOT NULL UNIQUE,
	name VARCHAR(225),
	country ENUM('US', 'CO', 'TN') DEFAULT 'US');
