


CREATE TABLE "WEB"."MARKETING_1" 
   (	"ORDER_NUM" VARCHAR2(100), 
	"CUSTOMER" VARCHAR2(100) NOT NULL ENABLE, 
	"TEX" VARCHAR2(100), 
	"COST_S" VARCHAR2(100), 
	"LEADER" VARCHAR2(100) NOT NULL ENABLE, 
	"REGDATE" TIMESTAMP (6), 
	"CONTENT" VARCHAR2(100), 
	 CONSTRAINT "SUJU_PK" PRIMARY KEY ("ORDER_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
 CREATE TABLE "WEB"."MARKETING_2" 
   (	"ORDER_NUM" VARCHAR2(100), 
	"CUSTOMER" VARCHAR2(100) NOT NULL ENABLE, 
	"KIND" VARCHAR2(100), 
	"CNT" NUMBER(38,0), 
	"REGDATE" TIMESTAMP (6), 
	"CHK" VARCHAR2(100) NOT NULL ENABLE, 
	"LEADER" VARCHAR2(100) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(100), 
	 CONSTRAINT "COMISSION_PK" PRIMARY KEY ("ORDER_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
 CREATE TABLE "WEB"."MARKETING_4" 
   (	"ORDER_NUM" VARCHAR2(100), 
	"REGDATE" TIMESTAMP (6), 
	"CUSTOMER" VARCHAR2(100) NOT NULL ENABLE, 
	"END_KIND" VARCHAR2(100), 
	"TEX" VARCHAR2(100), 
	"CHIT" VARCHAR2(100), 
	"BILL_NUM" NUMBER(38,0) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(100), 
	"LEADER" VARCHAR2(100) NOT NULL ENABLE, 
	 CONSTRAINT "MARKETING_4_PK" PRIMARY KEY ("ORDER_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
 CREATE TABLE "WEB"."MARKETING_5" 
   (	"ORDER_NUM" VARCHAR2(100), 
	"REGDATE" TIMESTAMP (6), 
	"CUSTOMER" VARCHAR2(100) NOT NULL ENABLE, 
	"COL_KIND" VARCHAR2(100), 
	"EVI" VARCHAR2(100), 
	"BAL" VARCHAR2(100), 
	"LEADER" VARCHAR2(100) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(100), 
	 CONSTRAINT "MARKETING_5_PK" PRIMARY KEY ("ORDER_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
 CREATE TABLE "WEB"."ATTENDANCE" 
   (	"ATT_NUM" NUMBER, 
	"START_TIME" TIMESTAMP (6), 
	"END_TIME" TIMESTAMP (6), 
	"TODAY" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
 
 CREATE TABLE "WEB"."USERS" 
   (	"USER_NUM" NUMBER, 
	"USER_NAME" VARCHAR2(100), 
	"USER_ID" VARCHAR2(100), 
	"USER_PW" VARCHAR2(100), 
	"USER_TEL" VARCHAR2(100), 
	"USER_ADD" VARCHAR2(100), 
	"USER_EMAIL" VARCHAR2(100), 
	"USER_CATE" VARCHAR2(100), 
	"USER_LEV" VARCHAR2(100), 
	"USER_FILE" VARCHAR2(100), 
	"USER_GENDER" VARCHAR2(100), 
	"USER_RRN" VARCHAR2(100), 
	"USER_DATE" TIMESTAMP (6), 
	"USER_PAY" NUMBER, 
	"USER_CAREER" VARCHAR2(500)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
 
 CREATE TABLE "WEB"."ACCSUBJECT" 
   (	"ACCSU_CODE" VARCHAR2(20), 
	"ACCSU_SUBJ" VARCHAR2(30), 
	"ACCSU_DE" VARCHAR2(13), 
	"ACCSU_CRE" VARCHAR2(20), 
	"ACCSU_DETAIL" VARCHAR2(200), 
	"ACCSU_ELEMENT" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

CREATE TABLE "WEB"."INCOMESTATE" 
   (	"SUBJECT" VARCHAR2(50), 
	"DIVISION" VARCHAR2(50), 
	"PRICE" NUMBER(13,0), 
	"DEADLINEM" NUMBER(2,0), 
	"DLYEAR" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

CREATE TABLE "WEB"."JOURNAL" 
   (	"REGDATE" TIMESTAMP (6), 
	"JOU_NO" NUMBER(4,0), 
	"DESUBJ" VARCHAR2(20), 
	"DEPRICE" NUMBER(13,0), 
	"CRESUBJ" VARCHAR2(20), 
	"CREPRICE" NUMBER(13,0), 
	"SUCODE" VARCHAR2(20), 
	"ACCOUNT" VARCHAR2(20)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
 CREATE TABLE "WEB"."INVEN" 
   (	"CODE" VARCHAR2(50) NOT NULL ENABLE, 
	"NAME" VARCHAR2(200) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(2000), 
	"QTT" NUMBER, 
	"REGDATE" TIMESTAMP (6), 
	"COST" NUMBER(38,0), 
	"CLIENT" VARCHAR2(100), 
	"OUTNO" NUMBER(38,0), 
	"INNO" NUMBER(38,0), 
	"NO" NUMBER(38,0), 
	 CONSTRAINT "INVEN_PK" PRIMARY KEY ("CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
 CREATE TABLE "WEB"."INVEN_OUT" 
   (	"OUTNO" VARCHAR2(100), 
	"QTT" NUMBER(38,0), 
	"CLIENT" VARCHAR2(100), 
	"NAME" VARCHAR2(100), 
	"CONTENT" VARCHAR2(100), 
	"OUTQTT" NUMBER(38,0), 
	"OUTDATE" TIMESTAMP (6), 
	"COST" NUMBER(38,0), 
	"OUTCH" VARCHAR2(100), 
	"CODE" VARCHAR2(100), 
	"REGDATE" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
 CREATE TABLE "WEB"."NOTE" 
   (	"NOTE_CONTENT" VARCHAR2(100), 
	"FROMU" VARCHAR2(100), 
	"TOU" VARCHAR2(100), 
	"REGDATE" TIMESTAMP (6), 
	 CONSTRAINT "NOTE_FK" FOREIGN KEY ("TOU")
	  REFERENCES "WEB"."USERS" ("USER_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  CREATE TABLE "WEB"."EVENTCALENDER" 
   (	"EVE_EVENTID" NUMBER(5,0), 
	"EVE_SUBJECT" VARCHAR2(100), 
	"EVE_DESCRIPTION" VARCHAR2(100), 
	"EVE_START" VARCHAR2(100), 
	"EVE_END" VARCHAR2(100), 
	"EVE_THEMECOLOR" VARCHAR2(100), 
	"EVE_ISFULLDAY" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
 CREATE OR REPLACE VIEW marketing_3 AS
SELECT * FROM (SELECT order_num,REGDATE,customer,END_KIND ,
tex,leader,BILL_NUM FROM MARKETING_4 WHERE END_KIND = '마감완료')t1 ,
(SELECT bal,evi,col_kind,ORDER_NUM ss FROM MARKETING_5)t2,
(SELECT cnt,kind,ORDER_NUM tt FROM MARKETING_2)t3 
WHERE SUBSTR(t1.ORDER_NUM,1,4)||SUBSTR(t1.ORDER_NUM,7,10) = SUBSTR(t2.ss,1,4)||SUBSTR(t2.ss,7,10) 
AND SUBSTR(t1.ORDER_NUM,1,4)||SUBSTR(t1.ORDER_NUM,7,10) = SUBSTR(t3.tt,1,4)||SUBSTR(t3.tt,7,10);

 INSERT INTO QLTEST (pdcode,QLCODE) values ('asdf','asd');
 
CREATE TABLE "WEB"."MARKETING_1" 
   (	"ORDER_NUM1" VARCHAR2(100), 
	"CUSTOMER" VARCHAR2(100) NOT NULL ENABLE, 
	"TEX" VARCHAR2(100), 
	"COST_S" VARCHAR2(100), 
	"LEADER" VARCHAR2(100) NOT NULL ENABLE, 
	"REGDATE" TIMESTAMP (6), 
	"CONTENT" VARCHAR2(100), 
	 CONSTRAINT "SUJU_PK" PRIMARY KEY ("ORDER_NUM1")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  CREATE TABLE "WEB"."MARKETING_2" 
   (	"ORDER_NUM2" VARCHAR2(100), 
	"CUSTOMER" VARCHAR2(100) NOT NULL ENABLE, 
	"KIND" VARCHAR2(100), 
	"CNT" NUMBER(38,0), 
	"REGDATE" TIMESTAMP (6), 
	"CHK" VARCHAR2(100) NOT NULL ENABLE, 
	"LEADER" VARCHAR2(100) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(100), 
	 CONSTRAINT "COMISSION_PK" PRIMARY KEY ("ORDER_NUM2")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
 CREATE TABLE "WEB"."MARKETING_4" 
   (	"ORDER_NUM4" VARCHAR2(100), 
	"REGDATE" TIMESTAMP (6), 
	"CUSTOMER" VARCHAR2(100) NOT NULL ENABLE, 
	"END_KIND" VARCHAR2(100), 
	"TEX" VARCHAR2(100), 
	"CHIT" VARCHAR2(100), 
	"BILL_NUM" NUMBER(38,0) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(100), 
	"LEADER" VARCHAR2(100) NOT NULL ENABLE, 
	 CONSTRAINT "MARKETING_4_PK" PRIMARY KEY ("ORDER_NUM4")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
 
 CREATE TABLE "WEB"."MARKETING_5" 
   (	"ORDER_NUM5" VARCHAR2(100), 
	"REGDATE" TIMESTAMP (6), 
	"CUSTOMER" VARCHAR2(100) NOT NULL ENABLE, 
	"COL_KIND" VARCHAR2(100), 
	"EVI" VARCHAR2(100), 
	"BAL" VARCHAR2(100), 
	"LEADER" VARCHAR2(100) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(100), 
	 CONSTRAINT "MARKETING_5_PK" PRIMARY KEY ("ORDER_NUM5")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
 
 CREATE OR REPLACE VIEW marketing_3 AS
SELECT * FROM (SELECT order_num4,REGDATE,customer,END_KIND ,tex,leader,BILL_NUM FROM MARKETING_4 WHERE END_KIND = '마감완료')t1 ,(SELECT bal,evi,col_kind,ORDER_NUM5 ss FROM MARKETING_5)t2,(SELECT cnt,kind,ORDER_NUM2 tt FROM MARKETING_2)t3 WHERE SUBSTR(ORDER_NUM4,1,4)||SUBSTR(ORDER_NUM4,7,10) = SUBSTR(t2.ss,1,4)||SUBSTR(t2.ss,7,10) AND SUBSTR(ORDER_NUM4,1,4)||SUBSTR(ORDER_NUM4,7,10) = SUBSTR(t3.tt,1,4)||SUBSTR(t3.tt,7,10);

CREATE TABLE "WEB"."ACSUBJECT" 
   (	"ACCSU_CODE" VARCHAR2(20), 
	"ACCSU_SUBJ" VARCHAR2(30), 
	"ACCSU_DE" VARCHAR2(13), 
	"ACCSU_CRE" VARCHAR2(20), 
	"ACCSU_DETAIL" VARCHAR2(200), 
	"ACCSU_ELEMENT" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

CREATE TABLE "WEB"."CORREPONDENT" 
   (	"CRRE_NAME" VARCHAR2(20), 
	"CRRE_NUMBER" VARCHAR2(22), 
	"CRRE_DETAIL" VARCHAR2(100), 
	"CRRE_CODE" VARCHAR2(20)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

CREATE TABLE "WEB"."INCOMESTATE" 
   (	"INC_MAECHUL" NUMBER(22,0), 
	"INC_MAECHULWONGA" NUMBER(22,0), 
	"INC_MAECHULCHONG" NUMBER(22,0), 
	"INC_SALESMANGE" NUMBER(22,0), 
	"INC_OPERATING" NUMBER(22,0), 
	"INC_DANGGI" NUMBER(22,0), 
	"INC_DATE" TIMESTAMP (6) NOT NULL ENABLE, 
	 CONSTRAINT "INC_DATE" UNIQUE ("INC_DATE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

CREATE TABLE "WEB"."ACSUBJECT" 
   (	"ACCSU_CODE" VARCHAR2(20), 
	"ACCSU_SUBJ" VARCHAR2(30), 
	"ACCSU_DE" VARCHAR2(13), 
	"ACCSU_CRE" VARCHAR2(20), 
	"ACCSU_DETAIL" VARCHAR2(200), 
	"ACCSU_ELEMENT" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

CREATE TABLE "WEB"."CORREPONDENT" 
   (	"CRRE_NAME" VARCHAR2(20), 
	"CRRE_NUMBER" VARCHAR2(22), 
	"CRRE_DETAIL" VARCHAR2(100), 
	"CRRE_CODE" VARCHAR2(20)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

CREATE TABLE "WEB"."INCOMESTATE" 
   (	"INC_MAECHUL" NUMBER(22,0), 
	"INC_MAECHULWONGA" NUMBER(22,0), 
	"INC_MAECHULCHONG" NUMBER(22,0), 
	"INC_SALESMANGE" NUMBER(22,0), 
	"INC_OPERATING" NUMBER(22,0), 
	"INC_DANGGI" NUMBER(22,0), 
	"INC_DATE" TIMESTAMP (6) NOT NULL ENABLE, 
	 CONSTRAINT "INC_DATE" UNIQUE ("INC_DATE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

CREATE TABLE "WEB"."ACSUBJECT" 
   (	"ACCSU_CODE" VARCHAR2(20), 
	"ACCSU_SUBJ" VARCHAR2(30), 
	"ACCSU_DE" VARCHAR2(13), 
	"ACCSU_CRE" VARCHAR2(20), 
	"ACCSU_DETAIL" VARCHAR2(200), 
	"ACCSU_ELEMENT" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

CREATE TABLE "WEB"."CORREPONDENT" 
   (	"CRRE_NAME" VARCHAR2(20), 
	"CRRE_NUMBER" VARCHAR2(22), 
	"CRRE_DETAIL" VARCHAR2(100), 
	"CRRE_CODE" VARCHAR2(20)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

CREATE TABLE "WEB"."INCOMESTATE" 
   (	"INC_MAECHUL" NUMBER(22,0), 
	"INC_MAECHULWONGA" NUMBER(22,0), 
	"INC_MAECHULCHONG" NUMBER(22,0), 
	"INC_SALESMANGE" NUMBER(22,0), 
	"INC_OPERATING" NUMBER(22,0), 
	"INC_DANGGI" NUMBER(22,0), 
	"INC_DATE" TIMESTAMP (6) NOT NULL ENABLE, 
	 CONSTRAINT "INC_DATE" UNIQUE ("INC_DATE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

CREATE TABLE "WEB"."ACSUBJECT" 
   (	"ACCSU_CODE" VARCHAR2(20), 
	"ACCSU_SUBJ" VARCHAR2(30), 
	"ACCSU_DE" VARCHAR2(13), 
	"ACCSU_CRE" VARCHAR2(20), 
	"ACCSU_DETAIL" VARCHAR2(200), 
	"ACCSU_ELEMENT" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

CREATE TABLE "WEB"."CORREPONDENT" 
   (	"CRRE_NAME" VARCHAR2(20), 
	"CRRE_NUMBER" VARCHAR2(22), 
	"CRRE_DETAIL" VARCHAR2(100), 
	"CRRE_CODE" VARCHAR2(20)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

CREATE TABLE "WEB"."INCOMESTATE" 
   (	"INC_MAECHUL" NUMBER(22,0), 
	"INC_MAECHULWONGA" NUMBER(22,0), 
	"INC_MAECHULCHONG" NUMBER(22,0), 
	"INC_SALESMANGE" NUMBER(22,0), 
	"INC_OPERATING" NUMBER(22,0), 
	"INC_DANGGI" NUMBER(22,0), 
	"INC_DATE" TIMESTAMP (6) NOT NULL ENABLE, 
	 CONSTRAINT "INC_DATE" UNIQUE ("INC_DATE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

CREATE OR REPLACE VIEW marketing_3 AS
SELECT * FROM (SELECT order_num4 o4,REGDATE,customer,END_KIND ,
tex,leader,BILL_NUM FROM MARKETING_4 WHERE END_KIND = '마감완료')t1 
,(SELECT bal,evi,col_kind,ORDER_NUM5 ss FROM MARKETING_5)t2,
(SELECT cnt,kind,ORDER_NUM2 tt FROM MARKETING_2)t3 
WHERE SUBSTR(o4,1,4)SUBSTR(o4,7,10) = SUBSTR(t2.ss,1,4)SUBSTR(t2.ss,7,10) AND
SUBSTR(o4,1,4)SUBSTR(o4,7,10) = SUBSTR(t3.tt,1,4)SUBSTR(t3.tt,7,10);

CREATE TABLE "WEB"."INVEN" 
   (    "CODE" VARCHAR2(50) NOT NULL ENABLE, 
    "NAME" VARCHAR2(200) NOT NULL ENABLE, 
    "CONTENT" VARCHAR2(2000), 
    "QTT" NUMBER, 
    "REGDATE" TIMESTAMP (6), 
    "COST" NUMBER(38,0), 
    "CLIENT" VARCHAR2(100), 
    "NO" NUMBER(38,0), 
    "POSSI" VARCHAR2(100), 
     CONSTRAINT "INVEN_PK" PRIMARY KEY ("CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
 
 CREATE OR REPLACE VIEW marketing_3 AS
SELECT * FROM (SELECT order_num4,REGDATE,customer,END_KIND ,tex,leader,BILL_NUM FROM MARKETING_4 WHERE END_KIND = '마감완료')t1 ,(SELECT bal,evi,col_kind,ORDER_NUM5 ss FROM MARKETING_5)t2,(SELECT cnt,kind,ORDER_NUM2 tt FROM MARKETING_2)t3 WHERE SUBSTR(ORDER_NUM4,1,4)||SUBSTR(ORDER_NUM4,7,10) = SUBSTR(t2.ss,1,4)||SUBSTR(t2.ss,7,10) AND SUBSTR(ORDER_NUM4,1,4)||SUBSTR(ORDER_NUM4,7,10) = SUBSTR(t3.tt,1,4)||SUBSTR(t3.tt,7,10);

select * from(select rownum rnum, t1.* from
         (select * from qltest where pdcode like '%pdcode%' and qlpdname like '%search2%' and qlstate like '%search3%' AND order by regdate asc)t1) where rnum >= 1 and rnum <=3;
	
	
select * from qltest where pdcode like '%pdcode%' and qlpdname like '%search2%' and qlstate like '%search3%' order by regdate ASC;

CREATE OR REPLACE VIEW marketing_3 AS
SELECT * FROM (SELECT order_num4 o4,REGDATE,customer,END_KIND ,
tex,leader,BILL_NUM FROM MARKETING_4 WHERE END_KIND = '마감완료')t1 
,(SELECT bal,evi,col_kind,ORDER_NUM5 ss FROM MARKETING_5)t2,
(SELECT cnt,kind,ORDER_NUM2 tt FROM MARKETING_2)t3 
WHERE SUBSTR(o4,0,4)||SUBSTR(o4,7,10) = SUBSTR(ss,0,4)||SUBSTR(ss,7,10) AND
SUBSTR(o4,0,4)||SUBSTR(o4,7,10) = SUBSTR(t3.tt,0,4)||SUBSTR(t3.tt,7,10);

LTER TABLE QLTEST MODIFY COLUMN QLCODE VARCHAR2(50) FIRST;

CREATE TABLE QLTESTHISTORY (
	"QLCODE" VARCHAR2(30), 
	"PDCODE" VARCHAR2(50) NOT NULL ENABLE, 
	"QLPDNAME" VARCHAR2(30) NOT NULL ENABLE, 
	"QLCNT" NUMBER(7,0) NOT NULL ENABLE, 
	"QLPRICE" NUMBER(7,0) NOT NULL ENABLE, 
	"QLWAY" VARCHAR2(20) NOT NULL ENABLE, 
	"TESTERNAME" VARCHAR2(50) NOT NULL ENABLE, 
	"QLSTATE" VARCHAR2(50) NOT NULL ENABLE, 
	"CUSTOMER" VARCHAR2(50) NOT NULL ENABLE, 
	"REGDATE" TIMESTAMP (6) NOT NULL ENABLE, 
	"QLSAMPLECNT" NUMBER(7,0), 
	"QLFAILCNT" NUMBER(7,0), 
	"FAILRESON" VARCHAR2(500), 
	"QLSUCCNT" NUMBER(7,0), 
	 PRIMARY KEY ("QLCODE"));

CREATE OR REPLACE VIEW marketing_6 AS
SELECT * FROM (SELECT ORDER_NUM2 o2,kind, CUSTOMER ,cnt, chk,REGDATE rd , LEADER FROM MARKETING_2 WHERE CHK = '승인완료')t1,(SELECT * FROM INVEN_OUT WHERE outch = '완료')t2 WHERE O2 = outno;

CREATE OR REPLACE VIEW marketing_7 AS
SELECT * FROM (SELECT ORDER_NUM2 o2,kind, CUSTOMER ,cnt, chk,REGDATE rd , LEADER FROM MARKETING_2 WHERE CHK = '승인완료')t1,(SELECT * FROM INVEN_OUT WHERE outch <> '완료')t2 WHERE O2 = outno;

SELECT * FROM QLTEST,QLTESTHISTORY where qltest.PDCODE = 'fsdf' or qltesthistory.PDCODE = 'sdf';

;
 ;
SELECT s,d FROM (SELECT pdcode a FROM QLTEST),(SELECT pdcode b FROM QLTESTHISTORY); 

SELECT * FROM  QLTESTHISTORY WHERE qlpdname = '테스트';

SELECT name AS pdname,count(name) AS cnt,SUM(outqtt*cost) AS price  FROM INVEN_OUT WHERE 
outdate BETWEEN '2018-01-01 00:00:00' AND '2018-12-31 23:59:59' GROUP BY name ORDER BY cnt desc;

SELECT SUM(outqtt*cost) AS monthtot
FROM INVEN_OUT 
WHERE OUTDATE BETWEEN ('2018-01-01 00:00:00') AND ('2018-01-31 23:59:59');

SELECT SUM(totprice) FROM (SELECT name as pdname,count(name) AS cnt,SUM(outqtt*cost) AS totprice  
		FROM INVEN_OUT 
		WHERE outdate BETWEEN '2019-01-01 00:00:00' AND '2019-12-31 23:59:59' 
		GROUP BY name order by cnt desc);

SELECT COUNT(*) 
FROM INVEN_OUT
WHERE OUTDATE.YEAR =2018
GROUP BY record_date.YEAR, OUTDATE.month ;


SELECT cost,OUTDATE 
FROM INVEN_OUT
WHERE TO_CHAR(OUTDATE,'yyyyMM') in (SELECT TO_CHAR(OUTDATE,'yyyyMM') AS outday  FROM INVEN_OUT);



SELECT cost 
FROM (SELECT TO_CHAR(OUTDATE,'yyyyMM') AS outday 
FROM INVEN_OUT
WHERE TO_CHAR(OUTDATE,'yyyyMM') in 
(
SELECT TO_CHAR(ADD_MONTHS(TO_DATE('2018'||'01', 'YYYYMM')
     , LEVEL - 1 ),'YYYYMM') AS MONTHS
  FROM DUAL
CONNECT BY LEVEL <= MONTHS_BETWEEN( TO_DATE('2017'||'12'
      , 'YYYYMM' ), TO_DATE('2017'||'01', 'YYYYMM' ) ) + 1
     )) ;


SELECT OUTDAY ,(sum(COST) * sum(OUTQTT)) AS monthtot FROM (SELECT OUTDATE ,TO_CHAR(OUTDATE,'yyyyMM') AS OUTday,COST,OUTQTT  
FROM INVEN_OUT
WHERE TO_CHAR(OUTDATE,'yyyyMM') in 
(
SELECT TO_CHAR(ADD_MONTHS(TO_DATE('2018'||'01', 'YYYYMM')
     , LEVEL - 1 ),'YYYYMM') AS MONTHS
  FROM DUAL
CONNECT BY LEVEL <= MONTHS_BETWEEN( TO_DATE('2018'||'12'
      , 'YYYYMM' ), TO_DATE('2018'||'01', 'YYYYMM' ) ) + 1
     ))  
    GROUP BY outday
   	ORDER BY OUTDAY ASC 
    ;    
   
    
SELECT OUTDATE ,TO_CHAR(OUTDATE,'yyyyMM') AS OUTday,COST,OUTQTT 
FROM INVEN_OUT
WHERE TO_CHAR(OUTDATE,'yyyyMM') in 
(
SELECT TO_CHAR(ADD_MONTHS(TO_DATE('2018'||'01', 'YYYYMM')
     , LEVEL - 1 ),'YYYYMM') AS MONTHS
  FROM DUAL
CONNECT BY LEVEL <= MONTHS_BETWEEN( TO_DATE('2018'||'12'
      , 'YYYYMM' ), TO_DATE('2018'||'01', 'YYYYMM' ) ) + 1
     )
  ;










SELECT TO_CHAR(OUTDATE ,'yyyyMM') AS outday  FROM INVEN_OUT;


SELECT TO_CHAR(ADD_MONTHS(TO_DATE('2018'||'01', 'YYYYMM')
     , LEVEL - 1 ),'YYYYMM') AS MONTHS
  FROM DUAL
CONNECT BY LEVEL <= MONTHS_BETWEEN( TO_DATE('2017'||'12'
      , 'YYYYMM' ), TO_DATE('2017'||'01', 'YYYYMM' ) ) + 1;