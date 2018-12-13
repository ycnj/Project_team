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

CREATE TABLE movieInfo(
num NUMBER PRIMARY KEY, 	-- 파일번호
writer VARCHAR2(100), 		-- 작성자
title VARCHAR2(100), 		-- 영화제목
content CLOB,				-- 영화주요정보
opendate DATE,				-- 개봉날짜
liketo NUMBER DEFAULT 0,	-- 추천수
orgFileName VARCHAR2(100), 	-- 원본파일명
saveFileName VARCHAR2(100), -- 파일 시스템에 저장된 파일명
fileSize NUMBER, 			-- 파일의 크기(byte)
regdate DATE 				-- 등록일 
);

CREATE SEQUENCE movieContent_seq;