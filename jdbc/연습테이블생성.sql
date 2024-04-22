CREATE SCHEMA jdbc;
USE jdbc;
drop table users;
-- 사용자 테이블
CREATE TABLE users (
	userId VARCHAR(225) PRIMARY KEY,
    username VARCHAR(225) NOT NULL,
    password VARCHAR(225) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(225) NOT NULL
);

-- 게시판 테이블
CREATE TABLE boards (
	boardNo INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content LONGTEXT NOT NULL,
    writer VARCHAR(225) NOT NULL,
    date DATETIME DEFAULT NOW(),	-- 기본 제약조건 날짜
    filename VARCHAR(225) NULL,		-- 파일이름 (필수 아님)
    filedata LONGBLOB NULL			-- 파일이진데이터 (필수 아님)
);

-- 계좌 테이블
CREATE TABLE accounts (
	accountNo VARCHAR(225) PRIMARY KEY,
    owner VARCHAR(225) NOT NULL,
    balance INT NOT NULL
);

INSERT INTO accounts VALUES ('111-111-1111', '홍길동', 1000000);
INSERT INTO accounts VALUES ('222-222-2222', '전우치', 0);

select * from users;