use jdbc;
CREATE TABLE members (
	id VARCHAR(255) PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL
);
SELECT * FROM members;
CREATE TABLE books (
    isbn VARCHAR(20) PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    publish_year INT,
    genre VARCHAR(50)
);
SELECT * FROM books;