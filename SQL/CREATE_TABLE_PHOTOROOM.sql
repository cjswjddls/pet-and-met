// ============ ���̺� �ʱ�ȭ ============

// DROP TABLE PHOTO;

DROP TABLE ROOM;

// =============================================================================

// ============ ���̺� ������ �ʱ�ȭ ============

// DROP SEQUENCE SEQ_PHOTO;

// ============ ���̺� ������ ���� ============

// CREATE SEQUENCE SEQ_PHOTO;


// =============================================================================


// ============ ���� ���̺� ���� ============

CREATE TABLE ROOM (
    ROOM_NO	        NUMBER		PRIMARY KEY NOT NULL,
	ROOM_TYPE       CHAR(2)	    DEFAULT 'A'	NOT NULL    CHECK(ROOM_TYPE IN ('A', 'B')),
	ROOM_FEE        NUMBER	    DEFAULT 0	NOT NULL,
	ROOM_USEABLE    NUMBER	    DEFAULT 1	NOT NULL    CHECK(ROOM_USEABLE IN (0,1)),
	ROOM_SIZE       NUMBER
);

// ============ ���� ���̺� �÷��� ============

COMMENT ON COLUMN ROOM.ROOM_NO IS '���ǹ�ȣ';

COMMENT ON COLUMN ROOM.ROOM_TYPE IS '����Ÿ��';

COMMENT ON COLUMN ROOM.ROOM_FEE IS '���ǿ��';

COMMENT ON COLUMN ROOM.ROOM_USEABLE IS '���ǻ�밡�ɿ���';

COMMENT ON COLUMN ROOM.ROOM_SIZE IS '���Ǹ���';


// =============================================================================


// ============ ���� ���� ���̺� ���� ============
--CREATE TABLE PHOTO (
--    PHOTO_NO	    NUMBER		    PRIMARY KEY NOT NULL,
--    PHOTO_TYPE       CHAR(2)	    DEFAULT 'A'	NOT NULL,
--    PHOTO_ORIGINAL	VARCHAR2(100)	NOT NULL,
--	PHOTO_NAME	    VARCHAR2(100)	NOT NULL,
--	PHOTO_PATH	    VARCHAR2(100)	,
--	PHOTO_DATE	    DATE	        DEFAULT SYSDATE	NOT NULL
--);
--
--// ============ ���� ���� ���̺� �÷��� ============
--COMMENT ON COLUMN PHOTO.PHOTO_NO IS '������ȣ';
--
--COMMENT ON COLUMN PHOTO.PHOTO_TYPE IS '����Ÿ��';
--
--COMMENT ON COLUMN PHOTO.PHOTO_ORIGINAL IS '������';
--
--COMMENT ON COLUMN PHOTO.PHOTO_NAME IS '������';
--
--COMMENT ON COLUMN PHOTO.PHOTO_PATH IS '���ϰ��';
--
--COMMENT ON COLUMN PHOTO.PHOTO_DATE IS '���ϵ����';


// =============================================================================


// ============ ���� ���̺� ������ �Է� ============

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


// ============ ���� ���� ���̺� ������ �Է� ============


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

// ============ ������ Ŀ�� ============

COMMIT;