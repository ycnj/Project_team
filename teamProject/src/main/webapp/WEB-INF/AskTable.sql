CREATE TABLE board_Ask(
num NUMBER PRIMARY KEY,
writer VARCHAR2(50),
title VARCHAR2(100),
content CLOB,
viewCount NUMBER,
regdate DATE
)