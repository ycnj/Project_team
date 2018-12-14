CREATE TABLE event_board
(
  NUM        NUMBER,
  WRITER     VARCHAR2(100 BYTE),
  CAPTION    VARCHAR2(200 BYTE),
  CONTENT CLOB,
  IMAGEPATH  VARCHAR2(100 BYTE),
  REGDATE    DATE,
  VIEWCOUNT NUMBER,
  startRowNum NUMBER,
  endRowNum NUMBER
);

CREATE SEQUENCE event_board_SEQ;

CREATE TABLE event_mp
(
  num        NUMBER,
  writer     VARCHAR2(100 BYTE)                 NOT NULL,
  title      VARCHAR2(100 BYTE)                 NOT NULL,
  content    CLOB,
  viewCount  NUMBER,
  regdate    DATE
);

CREATE SEQUENCE event_mp_SEQ;