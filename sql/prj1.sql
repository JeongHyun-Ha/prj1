CREATE DATABASE prj1;

USE prj1;

# 게시판 테이블
DROP TABLE board;
CREATE TABLE board
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    title    VARCHAR(200)  NOT NULL,
    content  VARCHAR(3000) NOT NULL,
    writer   VARCHAR(100)  NOT NULL,
    inserted DATETIME      NOT NULL DEFAULT NOW()
);
SELECT *
FROM board;

# 회원 테이블
DROP TABLE member;
CREATE TABLE member
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    email     VARCHAR(200) NOT NULL UNIQUE,
    password  VARCHAR(200) NOT NULL,
    nick_name VARCHAR(100) NOT NULL UNIQUE,
    inserted  DATETIME     NOT NULL DEFAULT NOW()
);
ALTER TABLE member
    ADD COLUMN inserted DATETIME NOT NULL DEFAULT NOW();
desc member;
SELECT *
FROM member;

# 게시물 갯수 늘리기
INSERT INTO board
    (title, content, writer)
SELECT title, content, writer
FROM board;

ALTER TABLE board
    DROP COLUMN writer;
ALTER TABLE board
    ADD COLUMN member_id INT REFERENCES member (id);

UPDATE board
SET member_id = 19
WHERE id > 0;