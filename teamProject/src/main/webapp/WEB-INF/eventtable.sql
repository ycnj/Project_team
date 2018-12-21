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
ALTER TABLE eventImage_mp add PRIMARY KEY(num);

ALTER TABLE eventImage_mp ADD CONSTRAINT event_mp_num FOREIGN KEY (ref_group) REFERENCES event_mp(num);