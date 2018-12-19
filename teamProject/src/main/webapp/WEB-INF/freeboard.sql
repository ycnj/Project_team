CREATE TABLE freeboard(
num NUMBER PRIMARY KEY,
id VARCHAR2(100) not null,
title VARCHAR2(100) not null,
content CLOB,
orgFileName VARCHAR2(100), -- 원본파일명
saveFileName VARCHAR2(100), -- 파일 시스템에 저장된 파일명
fileSize NUMBER, -- 파일의 크기(byte)
viewCount NUMBER,
regdate DATE
);

CREATE SEQUENCE freeboard_seq

--댓글 정보 저장 테이블
CREATE TABLE freeboardComment(
num NUMBER PRIMARY KEY,						--댓글 글번호
id VARCHAR2(100),							--댓글 작성자
content VARCHAR2(500),						-- 내용
target_id VARCHAR2(100),					--댓글의 대상이 되는 아이디(글작성자)
ref_group NUMBER,							-- 댓글 그룹번호
comment_group NUMBER,						-- 원글에 달린 댓글 내에서의 그룹번호
deleted CHAR(3) DEFAULT 'no',
regdate DATE
);

CREATE SEQUENCE freeboard_comment_seq;

