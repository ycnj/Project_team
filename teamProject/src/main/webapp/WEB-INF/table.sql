
--------------------------UsersTable--------------------------

Create table users_mp(
name varchar2(20) not null, --이름
rrn varchar2(15) not null, --생년월일
id varchar2(100) not null primary key , --아이디
pwd varchar2(100) not null, --비밀번호
email varchar2(100), --이메일
phon varchar2(30),--폰
addr1 varchar2(100),
addr2 varchar2(100),
addr3 varchar2(100), --주소
gender varchar2(4) CHECK (gender IN('M','F')), --성별
gubun number(2), --구분
rdate date --날짜
);

CREATE SEQUENCE users_mp_seq;

--CONSTRAINT users_mp_gender_ck CHECK(gender in('남','여'))

CREATE TABLE usersRes_mp(
	id VARCHAR2(50),			--(users id foreign key)
	num Number Primary Key,		--예매번호
	movieName VARCHAR2(50),		--예매한 영화 이름
	price NUMBER DEFAULT 0,		--예매금액(예매누적금액)
	paymentWay VARCHAR2(50), 	--결제수단
	currCon NUMBER DEFAULT 0,	--현재상태(예매,환불)
	point NUMBER DEFAULT 0,		--포인트
	regdate DATE				--예매일(예매일 기준 취소가능일 표시)
);

CREATE SEQUENCE userRes_mp_seq;


--------------------------MovieInfoTable--------------------------

CREATE TABLE movieInfo(
	num NUMBER PRIMARY KEY, 	-- 파일번호
	id VARCHAR2(100), 			-- 작성자
	title VARCHAR2(100), 		-- 영화제목
	content CLOB,				-- 영화주요정보
	opendate DATE,				-- 개봉날짜
	liketo NUMBER DEFAULT 0,	-- 추천수
	orgFileName VARCHAR2(100), 	-- 원본파일명
	saveFileName VARCHAR2(100), -- 파일 시스템에 저장된 파일명
	fileSize NUMBER, 			-- 파일의 크기(byte)
	regdate DATE 				-- 등록일 
);

CREATE SEQUENCE movieInfo_seq;

CREATE TABLE movieInfo_like(
    num	NUMBER PRIMARY KEY, 
    movieInfoNum NUMBER NOT NULL,    
    id VARCHAR2(100) NOT NULL,
    like_check NUMBER DEFAULT 0 NULL 
);


--------------------------AskTable + FAQ Table 추가--------------------------

CREATE TABLE board_faq(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
content CLOB,
viewCount NUMBER,
regdate DATE
);

CREATE SEQUENCE board_faq_seq;

CREATE TABLE board_ask(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
content CLOB,
viewCount NUMBER, 
regdate DATE
);

CREATE SEQUENCE board_ask_seq;

-- 댓글 정보를 저장할 테이블
CREATE TABLE board_ask_comment(
	num NUMBER PRIMARY KEY, -- 댓글의 글번호
	writer VARCHAR2(100), -- 댓글 작성자
	content VARCHAR2(500), -- 댓글 내용
	target_id VARCHAR2(100), -- 댓글의 대상이 되는 아이디(글성자)
	ref_group NUMBER, -- 댓글 그룹번호
	comment_group NUMBER, -- 원글에 달린 댓글 내에서의 그룹번호
	deleted CHAR(3) DEFAULT 'no', -- 댓글이 삭제 되었는지 여부 
	regdate DATE -- 댓글 등록일 
);

CREATE SEQUENCE board_ask_comment_seq;


CREATE TABLE board_user(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
content CLOB,
viewCount NUMBER, 
regdate DATE
);

CREATE SEQUENCE board_user_seq;


CREATE TABLE board_user_comment(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100), 
	content VARCHAR2(500), 
	target_id VARCHAR2(100), 
	ref_group NUMBER, 
	comment_group NUMBER, 
	deleted CHAR(3) DEFAULT 'no', 
	regdate DATE  
);

CREATE SEQUENCE board_user_comment_seq;


--------------------------EventTable--------------------------

CREATE TABLE event_mp
(
  NUM        NUMBER,
  WRITER     VARCHAR2(100 BYTE)                 NOT NULL,
  TITLE      VARCHAR2(100 BYTE),
  CONTENT    VARCHAR2(2000 BYTE),  
  orgFileName  VARCHAR2(100 BYTE),
  saveFileName  VARCHAR2(100 BYTE),
  fileSize   NUMBER,
  VIEWCOUNT  NUMBER,
  REGDATE    DATE
);

CREATE SEQUENCE event_mp_SEQ;

CREATE TABLE eventImage_mp
(
 num NUMBER,
 ref_group NUMBER,
 orgFileName  VARCHAR2(100 BYTE),
 saveFileName  VARCHAR2(100 BYTE),
 fileSize   NUMBER,
 REGDATE    DATE
);

CREATE SEQUENCE eventImage_mp_SEQ;

ALTER TABLE event_mp add PRIMARY KEY(num);

ALTER TABLE eventImage_mp ADD CONSTRAINT event_mp_num FOREIGN KEY (ref_group) REFERENCES event_mp(num);


--------------------------FreeboardTable--------------------------

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

CREATE SEQUENCE freeboard_seq;


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


