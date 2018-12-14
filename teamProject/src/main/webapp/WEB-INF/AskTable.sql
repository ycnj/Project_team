CREATE TABLE board_Ask(
num NUMBER PRIMARY KEY,
writer VARCHAR2(50),
title VARCHAR2(100),
content CLOB,
viewCount NUMBER,
regdate DATE
);

CREATE SEQUENCE board_Ask_seq;

CREATE TABLE board_admin(
num NUMBER PRIMARY KEY,
title VARCHAR2(100) NOT NULL,
writer VARCHAR2(50),
content CLOB,
viewCount NUMBER, 
regdate DATE
);

CREATE SEQUENCE board_admin_seq;