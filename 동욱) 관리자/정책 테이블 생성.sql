CREATE TABLE POLICYS
(
	P_ID		CHAR(4)				PRIMARY KEY,
	P_SDATE		DATE				NOT NULL,
	P_EDATE		DATE				NULL,
	P_LEVEL		CHAR(1)				NOT NULL,
	P_PRIVATE	VARCHAR2(500)		NOT NULL,
	P_ENTER		VARCHAR2(500)		NOT NULL,
	P_REST		VARCHAR2(500)		NOT NULL,
	MB_ID		VARCHAR2(50)		NOT NULL,
	P_LINK		VARCHAR2(2000)		NULL
);

COMMENT ON COLUMN POLICYS.P_ID IS '아이디';
COMMENT ON COLUMN POLICYS.P_SDATE IS '정책 발행일자';
COMMENT ON COLUMN POLICYS.P_EDATE IS '정책 종료일자';
COMMENT ON COLUMN POLICYS.P_LEVEL IS '거리두기 단계';
COMMENT ON COLUMN POLICYS.P_PRIVATE IS '사적모임';
COMMENT ON COLUMN POLICYS.P_ENTER IS '유흥시설';
COMMENT ON COLUMN POLICYS.P_REST IS '삭당,카페';
COMMENT ON COLUMN POLICYS.MB_ID IS '회원 아이디';
COMMENT ON COLUMN POLICYS.P_LINK IS '링크';

INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P001','2021-08-02','2021-08-08','3','4명까지 모임 가능','집합금지','22시~다음날 5시까지 포장,배달만 허용','busan051','https://www.busan.go.kr/covid19/Prevention07.do');

INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P002','2021-08-02','2021-08-08','3','4명까지 모임 가능','집합금지','22시~다음날 5시까지 포장,배달만 허용','busan051','https://www.busan.go.kr/covid19/Prevention07.do');

INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P003','2021-08-08','2021-08-13','3','4명까지 모임 가능','집합금지','22시~다음날 5시까지 포장,배달만 허용','busan051','https://www.busan.go.kr/covid19/Prevention07.do');

SELECT * FROM POLICYS;
--COMMIT;
