DROP TABLE RESERVATION;
DROP SEQUENCE RESERVATION;

CREATE SEQUENCE SEQ_RESERVATION NOCYCLE;

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

COMMIT;