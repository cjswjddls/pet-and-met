DROP SEQUENCE SEQ_BOARD;
DROP SEQUENCE SEQ_COMMENTS;
DROP SEQUENCE SEQ_CONSULTING;
DROP SEQUENCE SEQ_FILES;
DROP SEQUENCE SEQ_LIKES;
DROP SEQUENCE SEQ_MEMBER;
DROP SEQUENCE SEQ_REVIEW;
DROP SEQUENCE SEQ_ATTACHMENT;
DROP SEQUENCE SEQ_PAYMENT;
// DROP SEQUENCE SEQ_PHOTO;
// ROOM 은 시퀸스 없음;
DROP SEQUENCE SEQ_RESERVATION;

CREATE SEQUENCE SEQ_BOARD NOCYCLE;
CREATE SEQUENCE SEQ_COMMENTS NOCYCLE;
CREATE SEQUENCE SEQ_CONSULTING NOCYCLE;
CREATE SEQUENCE SEQ_FILES NOCYCLE;
CREATE SEQUENCE SEQ_LIKES NOCYCLE;
CREATE SEQUENCE SEQ_MEMBER NOCYCLE;
CREATE SEQUENCE SEQ_REVIEW NOCYCLE;
CREATE SEQUENCE SEQ_ATTACHMENT NOCYCLE;
CREATE SEQUENCE SEQ_PAYMENT NOCYCLE;
// CREATE SEQUENCE SEQ_PHOTO NOCYCLE;
// ROOM 은 시퀸스 없음;
CREATE SEQUENCE SEQ_RESERVATION NOCYCLE;

DROP TABLE CONSULTING;
DROP TABLE RESERVATION;
DROP TABLE ROOM;
// DROP TABLE PHOTO;
DROP TABLE PAYMENT;
DROP TABLE ATTACHMENT;
DROP TABLE BOARD;
DROP TABLE LIKES;
DROP TABLE COMMENTS;
DROP TABLE FILES;
DROP TABLE REVIEW;
DROP TABLE MEMBER;

CREATE TABLE MEMBER(
	MEMBER_NO NUMBER PRIMARY KEY,
	MEMBER_ID VARCHAR2(40) NOT NULL UNIQUE,
	MEMBER_PWD	VARCHAR2(80) NOT NULL,
	MEMBER_NAME	VARCHAR2(40) NOT NULL,
	MEMBER_PHONE VARCHAR2(16) NOT NULL UNIQUE,
	MEMBER_EMAIL	VARCHAR2(40)		NOT NULL UNIQUE,
	MEMBER_ADDRESS	VARCHAR2(200)		NOT NULL,
    MEMBER_ADDRESS_DETAIL	VARCHAR2(200)		NOT NULL,
    MEMBER_BIRTH	DATE NOT NULL,
    MEMBER_DESCRIPTION	VARCHAR2(2000)		NULL,
	MEMBER_JOIN	DATE	DEFAULT SYSDATE	NOT NULL,
	MEMBER_LEAVE	DATE		NULL,
    MEMBER_STATUS NUMBER DEFAULT 1 CHECK(MEMBER_STATUS IN (0, 1)) NOT NULL,
    MEMBER_LEAVE_REASON VARCHAR2(100) NULL,
    MEMBER_ADMIN NUMBER DEFAULT 0 CHECK(MEMBER_ADMIN IN (0,1)) NOT NULL
);

CREATE TABLE REVIEW(
	REVIEW_NO	NUMBER PRIMARY KEY,
	REVIEW_NAME	VARCHAR2(100)	DEFAULT '이름없는 게시글'	NOT NULL,
	REVIEW_CONTENT	VARCHAR2(4000)		NULL,
    REVIEW_AUTHOR	NUMBER NOT NULL,
	REVIEW_INSERT	DATE	DEFAULT SYSDATE	NOT NULL,
	REVIEW_UPDATE	DATE		NULL,
	REVIEW_DELETE	DATE		NULL,
	REVIEW_VIEW	NUMBER	DEFAULT 0	NOT NULL,
	REVIEW_IP	VARCHAR2(40)		NULL,
    FOREIGN KEY (REVIEW_AUTHOR) REFERENCES MEMBER(MEMBER_NO)
);

CREATE TABLE FILES(
	FILES_NO	NUMBER PRIMARY KEY,
    FILES_REVIEW_NO NUMBER NOT NULL,
	FILES_ORIGIN_NAME	VARCHAR2(80)		NOT NULL,
	FILES_CHANGE_NAME	VARCHAR2(80)		NOT NULL UNIQUE,
	FILES_PATH	VARCHAR2(40)		NULL,
	FILES_UPLOAD_DATE	DATE	DEFAULT SYSDATE	NOT NULL,
	FILES_STATUS NUMBER DEFAULT 1 CHECK(FILES_STATUS IN (0, 1)) NOT NULL,
    FOREIGN KEY (FILES_REVIEW_NO) REFERENCES REVIEW(REVIEW_NO)
);

CREATE TABLE COMMENTS (
	COMMENTS_NO	NUMBER PRIMARY KEY,
	COMMENTS_CONTENT	VARCHAR2(4000) NULL,
	COMMENTS_INSERT	DATE DEFAULT SYSDATE NOT NULL,
	COMMENTS_UPDATE	DATE NULL,
	COMMENTS_DELETE	DATE NULL,
	COMMENTS_REVIEW_NO NUMBER NOT NULL,
	COMMENTS_MEMBER_NO	NUMBER NOT NULL,
	COMMENTS_IP	VARCHAR2(40) NULL,
    FOREIGN KEY (COMMENTS_MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (COMMENTS_REVIEW_NO) REFERENCES REVIEW(REVIEW_NO)
);

CREATE TABLE LIKES(
    LIKES_NO NUMBER PRIMARY KEY,
    LIKES_MEMBER_NO NUMBER NOT NULL,
    LIKES_REVIEW_NO NUMBER NOT NULL,
    LIKES_STATUS NUMBER DEFAULT 0 CHECK(LIKES_STATUS IN (0,1)) NOT NULL,
    FOREIGN KEY (LIKES_MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
    FOREIGN KEY (LIKES_REVIEW_NO) REFERENCES REVIEW(REVIEW_NO)
);

CREATE TABLE BOARD (
	BOARD_NO	NUMBER PRIMARY KEY,
	BOARD_NAME	VARCHAR2(100) DEFAULT '이름없는 게시글' NOT NULL,
	BOARD_CONTENT	VARCHAR2(4000)		NULL,
    BOARD_ACCENT    NUMBER DEFAULT 0 NOT NULL,
	BOARD_INSERT	DATE DEFAULT SYSDATE	NOT NULL,
	BOARD_UPDATE	DATE		NULL,
	BOARD_DELETE	DATE		NULL,
	BOARD_VIEW	NUMBER	DEFAULT 0	NOT NULL,
	BOARD_IP	VARCHAR2(40)		NULL
);

CREATE TABLE CONSULTING (
    CONSULTING_NO NUMBER PRIMARY KEY,
    CONSULTING_MEMBER_NO NUMBER NOT NULL,
    FOREIGN KEY (CONSULTING_MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
);

CREATE TABLE ATTACHMENT (
	ATTACHMENT_NO	NUMBER		NOT NULL PRIMARY KEY,
	ATTACHMENT_BOARD_NO	NUMBER	NOT NULL,
    ATTACHMENT_ORIGIN_NAME VARCHAR2(255) NOT NULL,
    ATTACHMENT_CHANGE_NAME VARCHAR2(255) NOT NULL,
	ATTACHMENT_FILE_PATH	VARCHAR2(400) NULL,
	ATTACHMENT_UPLOAD_DATE	DATE DEFAULT SYSDATE NOT NULL,
    ATTACHMENT_STATUS VARCHAR2(1) DEFAULT 'Y' NULL,
    FOREIGN KEY (ATTACHMENT_BOARD_NO) REFERENCES BOARD(BOARD_NO)
);

CREATE TABLE ROOM (
    ROOM_NO	        NUMBER		PRIMARY KEY NOT NULL,
	ROOM_TYPE       CHAR(1)	    DEFAULT 'A'	NOT NULL    CHECK(ROOM_TYPE IN ('A', 'B')),
	ROOM_FEE        NUMBER	    DEFAULT 0	NOT NULL,
	ROOM_USEABLE    NUMBER	    DEFAULT 1	NOT NULL    CHECK(ROOM_USEABLE IN (0,1)),
	ROOM_SIZE       NUMBER
);

COMMENT ON COLUMN ROOM.ROOM_NO IS '객실번호';
COMMENT ON COLUMN ROOM.ROOM_TYPE IS '객실타입';
COMMENT ON COLUMN ROOM.ROOM_FEE IS '객실요금';
COMMENT ON COLUMN ROOM.ROOM_USEABLE IS '객실사용가능여부';
COMMENT ON COLUMN ROOM.ROOM_SIZE IS '객실면적';

--CREATE TABLE PHOTO (
--    PHOTO_NO	    NUMBER		    PRIMARY KEY NOT NULL,
--    PHOTO_TYPE       CHAR(2)	    DEFAULT 'A'	NOT NULL,
--    PHOTO_ORIGINAL	VARCHAR2(100)	NOT NULL,
--	PHOTO_NAME	    VARCHAR2(100)	NOT NULL,
--	PHOTO_PATH	    VARCHAR2(100)	,
--	PHOTO_DATE	    DATE	        DEFAULT SYSDATE	NOT NULL
--);

--COMMENT ON COLUMN PHOTO.PHOTO_NO IS '사진번호';
--COMMENT ON COLUMN PHOTO.PHOTO_TYPE IS '객실타입';
--COMMENT ON COLUMN PHOTO.PHOTO_ORIGINAL IS '원본명';
--COMMENT ON COLUMN PHOTO.PHOTO_NAME IS '수정명';
--COMMENT ON COLUMN PHOTO.PHOTO_PATH IS '파일경로';
--COMMENT ON COLUMN PHOTO.PHOTO_DATE IS '파일등록일';

CREATE TABLE RESERVATION (	
    RESERVATION_NO	            NUMBER		        PRIMARY KEY NOT NULL,
    MEMBER_NO	                NUMBER	            REFERENCES MEMBER(MEMBER_NO) NOT NULL,
	ROOM_NO	                    NUMBER	            REFERENCES ROOM(ROOM_NO) NOT NULL,
	RESERVATION_START_DATE	    DATE		        NOT NULL,
	RESERVATION_END_DATE	    DATE		        NOT NULL,
    RESERVATION_STAY_DATE	    NUMBER		        NOT NULL,
	RESERVATION_MEMO	        VARCHAR2(1000)		,
	RESERVATION_USER_NAME	    VARCHAR2(40)		NOT NULL,
    RESERVATION_USER_EMAIL      VARCHAR2(40)        NOT NULL,
	RESERVATION_PHONE	        VARCHAR2(16)		NOT NULL,
	RESERVATION_REGIST_DATE	    DATE	            DEFAULT SYSDATE	NOT NULL,
	RESERVATION_CANCLE_DATE	    DATE		        
);

CREATE TABLE PAYMENT (
	PAYMENT_NO	NUMBER		NOT NULL PRIMARY KEY,
	PAYMENT_TID	VARCHAR2(80)	NOT NULL,
    PAYMENT_AID VARCHAR2(80) NULL,
    PAYMENT_METHOD VARCHAR2(30) NULL,
	PAYMENT_DATE	DATE	DEFAULT SYSDATE	NOT NULL,
	PAYMENT_CANCEL	DATE NULL,
    PAYMENT_APPROVED VARCHAR2(30) NULL,
	PAYMENT_RESERVATION_NO	NUMBER		NOT NULL,
    PAYMENT_USER_NO NUMBER NOT NULL,
    PAYMENT_STATUS_CODE NUMBER DEFAULT 0 NOT NULL
);

COMMIT;