
Create table users_mp(
name varchar2(20) not null, --이름
rrn varchar2(15) not null, --생년월일
id varchar2(100) not null primary key , --아이디
pwd varchar2(100) not null, --비밀번호
email varchar2(100), --이메일
phon number,--폰
addr varchar2(200), --주소
gender varchar2(2) CHECK (gender IN('남','여')), --성별
gubun number(2), --구분
rdate date --날짜
);

CREATE SEQUENCE users_mp_seq;

--CONSTRAINT users_mp_gender_ck CHECK(gender in('남','여'))