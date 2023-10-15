// ============ 테이블 초기화 ============

// DROP TABLE PHOTO;

DROP TABLE ROOM;

// =============================================================================

// ============ 테이블 시퀀스 초기화 ============

// DROP SEQUENCE SEQ_PHOTO;

// ============ 테이블 시퀀스 생성 ============

// CREATE SEQUENCE SEQ_PHOTO;


// =============================================================================


// ============ 객실 테이블 생성 ============

CREATE TABLE ROOM (
    ROOM_NO	        NUMBER		PRIMARY KEY NOT NULL,
	ROOM_TYPE       CHAR(2)	    DEFAULT 'A'	NOT NULL    CHECK(ROOM_TYPE IN ('A', 'B')),
	ROOM_FEE        NUMBER	    DEFAULT 0	NOT NULL,
	ROOM_USEABLE    NUMBER	    DEFAULT 1	NOT NULL    CHECK(ROOM_USEABLE IN (0,1)),
	ROOM_SIZE       NUMBER
);

// ============ 객실 테이블 컬럼명 ============

COMMENT ON COLUMN ROOM.ROOM_NO IS '객실번호';

COMMENT ON COLUMN ROOM.ROOM_TYPE IS '객실타입';

COMMENT ON COLUMN ROOM.ROOM_FEE IS '객실요금';

COMMENT ON COLUMN ROOM.ROOM_USEABLE IS '객실사용가능여부';

COMMENT ON COLUMN ROOM.ROOM_SIZE IS '객실면적';


// =============================================================================


// ============ 객실 사진 테이블 생성 ============
--CREATE TABLE PHOTO (
--    PHOTO_NO	    NUMBER		    PRIMARY KEY NOT NULL,
--    PHOTO_TYPE       CHAR(2)	    DEFAULT 'A'	NOT NULL,
--    PHOTO_ORIGINAL	VARCHAR2(100)	NOT NULL,
--	PHOTO_NAME	    VARCHAR2(100)	NOT NULL,
--	PHOTO_PATH	    VARCHAR2(100)	,
--	PHOTO_DATE	    DATE	        DEFAULT SYSDATE	NOT NULL
--);
--
--// ============ 객실 사진 테이블 컬럼명 ============
--COMMENT ON COLUMN PHOTO.PHOTO_NO IS '사진번호';
--
--COMMENT ON COLUMN PHOTO.PHOTO_TYPE IS '객실타입';
--
--COMMENT ON COLUMN PHOTO.PHOTO_ORIGINAL IS '원본명';
--
--COMMENT ON COLUMN PHOTO.PHOTO_NAME IS '수정명';
--
--COMMENT ON COLUMN PHOTO.PHOTO_PATH IS '파일경로';
--
--COMMENT ON COLUMN PHOTO.PHOTO_DATE IS '파일등록일';


// =============================================================================


// ============ 객실 테이블 데이터 입력 ============

INSERT INTO ROOM (ROOM_NO
                , ROOM_TYPE
                , ROOM_FEE
                , ROOM_USEABLE
                , ROOM_SIZE)                                      
           VALUES(101
                , 'A'
                , 80000
                , 1
                , 8);

INSERT INTO ROOM (ROOM_NO
                , ROOM_TYPE
                , ROOM_FEE
                , ROOM_USEABLE
                , ROOM_SIZE)                                      
           VALUES(102
                , 'A'
                , 80000
                , 1
                , 8);

INSERT INTO ROOM (ROOM_NO
                , ROOM_TYPE
                , ROOM_FEE
                , ROOM_USEABLE
                , ROOM_SIZE)                                      
           VALUES(103
                , 'A'
                , 80000
                , 1
                , 8);

INSERT INTO ROOM (ROOM_NO
                , ROOM_TYPE
                , ROOM_FEE
                , ROOM_USEABLE
                , ROOM_SIZE)                                      
           VALUES(104
                , 'A'
                , 80000
                , 1
                , 8);

INSERT INTO ROOM (ROOM_NO
                , ROOM_TYPE
                , ROOM_FEE
                , ROOM_USEABLE
                , ROOM_SIZE)                                      
           VALUES(105
                , 'A'
                , 80000
                , 1
                , 8);
                
INSERT INTO ROOM (ROOM_NO
                , ROOM_TYPE
                , ROOM_FEE
                , ROOM_USEABLE
                , ROOM_SIZE)                                      
           VALUES(201
                , 'B'
                , 120000
                , 1
                , 15);

INSERT INTO ROOM (ROOM_NO
                , ROOM_TYPE
                , ROOM_FEE
                , ROOM_USEABLE
                , ROOM_SIZE)                                      
           VALUES(202
                , 'B'
                , 120000
                , 1
                , 15);

INSERT INTO ROOM (ROOM_NO
                , ROOM_TYPE
                , ROOM_FEE
                , ROOM_USEABLE
                , ROOM_SIZE)                                      
           VALUES(203
                , 'B'
                , 120000
                , 1
                , 15);

INSERT INTO ROOM (ROOM_NO
                , ROOM_TYPE
                , ROOM_FEE
                , ROOM_USEABLE
                , ROOM_SIZE)                                      
           VALUES(204
                , 'B'
                , 120000
                , 1
                , 15);

INSERT INTO ROOM (ROOM_NO
                , ROOM_TYPE
                , ROOM_FEE
                , ROOM_USEABLE
                , ROOM_SIZE)                                      
           VALUES(205
                , 'B'
                , 120000
                , 1
                , 15);


// ============ 객실 사진 테이블 데이터 입력 ============


--INSERT INTO PHOTO (PHOTO_NO
--                 , PHOTO_TYPE
--                 , PHOTO_ORIGINAL
--                 , PHOTO_NAME)                                      
--            VALUES(SEQ_PHOTO.NEXTVAL
--                 , 'A'
--                 , 'portfolio-1.jpg'
--                 , 'portfolio-1.jpg');
--
--INSERT INTO PHOTO (PHOTO_NO
--                 , PHOTO_TYPE
--                 , PHOTO_ORIGINAL
--                 , PHOTO_NAME)                                      
--            VALUES(SEQ_PHOTO.NEXTVAL
--                 , 'B'
--                 , 'portfolio-2.jpg'
--                 , 'portfolio-2.jpg');   
                 

// =============================================================================

// ============ 테이터 커밋 ============

COMMIT;