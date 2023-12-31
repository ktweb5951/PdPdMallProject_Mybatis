--------------------------------------------------------
--  파일이 생성됨 - 화요일-8월-08-2023   
--------------------------------------------------------
DROP TABLE "MALLMEMBER"."FREEBOARD_TBL" cascade constraints;
DROP TABLE "MALLMEMBER"."MALLMEMBER_TBL" cascade constraints;
--------------------------------------------------------
--  DDL for Table FREEBOARD_TBL
--------------------------------------------------------

  CREATE TABLE "MALLMEMBER"."FREEBOARD_TBL" 
   (	"FREEBOARD_NO" NUMBER, 
	"FREEBOARD_TITLE" VARCHAR2(1000 BYTE), 
	"FREEBOARD_CONTENT" VARCHAR2(1000 BYTE), 
	"FREEBOARD_WRITER" VARCHAR2(50 BYTE), 
	"VIEW_COUNT" NUMBER DEFAULT 0, 
	"RCMND_COUNT" NUMBER DEFAULT 0, 
	"FREEBOARD_DATE" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"UPDATE_DATE" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"IMAGE_PATH" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MALLMEMBER_TBL
--------------------------------------------------------

  CREATE TABLE "MALLMEMBER"."MALLMEMBER_TBL" 
   (	"MEMBER_ID" VARCHAR2(20 BYTE), 
	"MEMBER_PW" VARCHAR2(20 BYTE), 
	"MEMBER_NAME" VARCHAR2(30 BYTE), 
	"MEMBER_NICKNAME" VARCHAR2(50 BYTE), 
	"MEMBER_PHONE" VARCHAR2(11 BYTE), 
	"MEMBER_ADDRESS" VARCHAR2(150 BYTE), 
	"POSTALCODE_ONE" VARCHAR2(10 BYTE), 
	"POSTALCODE_TWO" VARCHAR2(10 BYTE), 
	"MEMBER_EMAIL" VARCHAR2(50 BYTE), 
	"MEMBER_DATE" TIMESTAMP (6) DEFAULT SYSTIMESTAMP
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into MALLMEMBER.FREEBOARD_TBL
SET DEFINE OFF;
Insert into MALLMEMBER.FREEBOARD_TBL (FREEBOARD_NO,FREEBOARD_TITLE,FREEBOARD_CONTENT,FREEBOARD_WRITER,VIEW_COUNT,RCMND_COUNT,FREEBOARD_DATE,UPDATE_DATE,IMAGE_PATH) values (3,'나 대황현우야','모두 꿇어','khuser01',0,0,to_timestamp('23/08/07 10:21:44.984000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('23/08/07 10:21:44.984000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into MALLMEMBER.FREEBOARD_TBL (FREEBOARD_NO,FREEBOARD_TITLE,FREEBOARD_CONTENT,FREEBOARD_WRITER,VIEW_COUNT,RCMND_COUNT,FREEBOARD_DATE,UPDATE_DATE,IMAGE_PATH) values (6,'안녕안녕 나는 갓수환이야~','헬륨 가스 먹었더니 요롷게 됐지','khuser01',0,0,to_timestamp('23/08/08 12:25:54.468000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('23/08/08 12:25:54.468000000','RR/MM/DD HH24:MI:SSXFF'),null);
REM INSERTING into MALLMEMBER.MALLMEMBER_TBL
SET DEFINE OFF;
Insert into MALLMEMBER.MALLMEMBER_TBL (MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_NICKNAME,MEMBER_PHONE,MEMBER_ADDRESS,POSTALCODE_ONE,POSTALCODE_TWO,MEMBER_EMAIL,MEMBER_DATE) values ('khuser01','pass01','일용자','일용직','01011112222','서울시 중구','123','456',null,to_timestamp('23/07/31 14:52:17.850000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MALLMEMBER.MALLMEMBER_TBL (MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_NICKNAME,MEMBER_PHONE,MEMBER_ADDRESS,POSTALCODE_ONE,POSTALCODE_TWO,MEMBER_EMAIL,MEMBER_DATE) values ('khuser02','pass02','이용자','이용자','01022223333','서울시 중구','355','58','khuser02@naver.com',to_timestamp('23/08/02 17:48:30.111000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MALLMEMBER.MALLMEMBER_TBL (MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_NICKNAME,MEMBER_PHONE,MEMBER_ADDRESS,POSTALCODE_ONE,POSTALCODE_TWO,MEMBER_EMAIL,MEMBER_DATE) values ('king123','king123','갓수환','신수환','01012345678','서울시 동작구','123','456','king@naver.com',to_timestamp('23/08/02 12:10:23.172000000','RR/MM/DD HH24:MI:SSXFF'));
--------------------------------------------------------
--  DDL for Index SYS_C007291
--------------------------------------------------------

  CREATE UNIQUE INDEX "MALLMEMBER"."SYS_C007291" ON "MALLMEMBER"."FREEBOARD_TBL" ("FREEBOARD_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007263
--------------------------------------------------------

  CREATE UNIQUE INDEX "MALLMEMBER"."SYS_C007263" ON "MALLMEMBER"."MALLMEMBER_TBL" ("MEMBER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007264
--------------------------------------------------------

  CREATE UNIQUE INDEX "MALLMEMBER"."SYS_C007264" ON "MALLMEMBER"."MALLMEMBER_TBL" ("MEMBER_NICKNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table FREEBOARD_TBL
--------------------------------------------------------

  ALTER TABLE "MALLMEMBER"."FREEBOARD_TBL" ADD PRIMARY KEY ("FREEBOARD_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MALLMEMBER"."FREEBOARD_TBL" MODIFY ("FREEBOARD_WRITER" NOT NULL ENABLE);
  ALTER TABLE "MALLMEMBER"."FREEBOARD_TBL" MODIFY ("FREEBOARD_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "MALLMEMBER"."FREEBOARD_TBL" MODIFY ("FREEBOARD_TITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MALLMEMBER_TBL
--------------------------------------------------------

  ALTER TABLE "MALLMEMBER"."MALLMEMBER_TBL" ADD UNIQUE ("MEMBER_NICKNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MALLMEMBER"."MALLMEMBER_TBL" ADD PRIMARY KEY ("MEMBER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MALLMEMBER"."MALLMEMBER_TBL" MODIFY ("MEMBER_ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "MALLMEMBER"."MALLMEMBER_TBL" MODIFY ("MEMBER_PHONE" NOT NULL ENABLE);
  ALTER TABLE "MALLMEMBER"."MALLMEMBER_TBL" MODIFY ("MEMBER_NAME" NOT NULL ENABLE);
  ALTER TABLE "MALLMEMBER"."MALLMEMBER_TBL" MODIFY ("MEMBER_PW" NOT NULL ENABLE);
