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

/*
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('','','','','','','','','');
*/

--충청남도
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P001','2021-07-28','2021-08-08','3','5인 이상 사적모임 금지','22시~다음날 05시까지 운영 제한','22시~다음날 05시까지 포장‧배달만 허용','chunnam041
','http://www.chungnam.go.kr/cnnet/board.do?mnu_url=/integeratedBoardView.do&board_seq=375300&field01=32508&field02=A&mnu_cd=CNNMENU02364&searchCnd=0&searchWrd=%EC%82%AC%ED%9A%8C%EC%A0%81&srtdate=20180101&enddate=20210804&pageNo=1&pageGNo=0&showSplitNo=10&code=601');

--대전
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P001','2021-07-27','2021-08-08','4','5인 이상 사적모임 금지 단, 18시 이후 2명까지 모임 가능','집합금지','22~다음날 05시까지 포장‧배달만 허용','daejeon042
','https://www.daejeon.go.kr/drh/board/boardNormalView.do?ntatcSeq=1376813654&menuSeq=1631&boardId=normal_0096');

--전라북도
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P003','2021-07-27','2021-08-08','3','5인 이상 사적모임 금지','22시이후 운영제한','22시이후 포장‧배달만 허용','jeonbuk063
','https://www.jeonbuk.go.kr/board/view.jeonbuk?boardId=BBS_0000012&menuCd=DOM_000000103001002001&paging=ok&startPage=1&searchType=DATA_TITLE&keyword=%EC%82%AC%ED%9A%8C%EC%A0%81&categoryCode1=jeonbuk&dataSid=558507');

--경상남도
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P004','2021-07-27','2021-08-08','3','5인 이상 사적모임 금지','22시 이후 운영제한','22시 이후 포장‧배달만 허용','gyeongnam055
','http://xn--19-q81ii1knc140d892b.kr/EgovPageLink.do?menuNo=&link=sub%2Fcorona11_2');

--인천광역시
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P005','2021-07-26','2021-08-08','4','18시 이전 4인까지, 18시 이후 2인까지 가능','집합금지','22시 이후 운영 제한','incheon032
','https://www.incheon.go.kr/IC010101/view?nttNo=2040720&curPage=1');

--경기도
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P006','2021-07-26','2021-08-08','4','18시 이전 4인 ‧ 18시 이후 2인까지 허용','집합금지','22시까지 운영 제한','gyeonggi031
','https://www.gg.go.kr/bbs/boardView.do?bIdx=25406070&bsIdx=464&bcIdx=519&menuId=1535&isManager=true&isCharge=true&page=1');

--서울
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P007','2021-07-26','2021-08-08','4','18시 이전은 4인까지, 18시 이후 2인까지 허용','집합금지','22시까지 운영 제한','seoul02
','https://news.seoul.go.kr/html/27/533954/');

--세종특별자치시
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P008','2021-07-27','2021-08-08','3','5인 이상 사적모임 금지','22시~ 익일 05시까지 운영제한','22시 ~ 익일 05시 까지 포장‧배달만 허용','sejong044
','https://www.sejong.go.kr/bbs/R3273/view.do?nttId=B000000046518Vk6xB7r&mno=sub05_07&cmsNoStr=18839&kind=&pageIndex=1');

--강원도
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P009','2021-07-19','2021-08-08','3','5인 이상 사적모임 금지','22시이후 운영제한','22시 이후 포장배달만 허용','gangwon033
','http://www.provin.gangwon.kr/covid-19.html');

--충청남도
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P010','2021-07-28','2021-08-08','3','5인 이상 사적모임 금지','22시~다음날 05시까지 운영 제한','22시~다음날 05시까지 포장‧배달만 허용','chunnam041
','http://www.chungnam.go.kr/corona/corona1.jsp');

--경상북도
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P011','2021-07-27','2021-08-08','3','5명부터의 사적 모임 금지','22시이후 운영제한','22시 이후 포장‧배달만 허용','gyeongbuk054
','http://ncov.mohw.go.kr/socdisBoardView.do?brdId=6&brdGubun=1');

--대구광역시
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P012','2021-07-27','2021-08-08','3','5명부터 사적모임 금지','운영시간 제한(22시~익일 05시)','운영시간 제한(22시~익일 05시까지는 포장‧배달만 허용)','daegu053
','http://covid19.daegu.go.kr/00936640View522960.html');

--울산광역시
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P013','2021-07-27','2021-08-08','3','5명부터의 사적 모임 금지','22시~익일 05시까지 운영 제한','22시~익일 05시까지 포장·배달만 허용','ulsan052
','https://www.ulsan.go.kr/u/health/bbs/view.do?bbsId=BBS_0000000000000049&mId=001002001000000000&dataId=119959#fileDownload');

--전라남도
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P014','2021-07-27','2021-08-08','3','사적모임 인원을 4명까지 허용','22시~익일 05시까지 운영 제한','22시~익일 05시까지 포장·배달만 허용','jeonnam061
','https://www.jeonnam.go.kr/viewer/skin/doc.html?fn=b44fa15d92c038212e90a45d2e9c7e28&rs=/viewer/result');

--광주광역시
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P015','2021-07-27','2021-08-08','3','5명부터 사적 모임 금지','22~익일05시까지 운영제한','22시~ 익일05시까지 포장배달만 허용','gwangju062
','https://blog.naver.com/dodreamgj/222445050017');

--제주특별자치도
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P016','2021-07-19',null,'3','4명까지 모임 가능','집합금지','22시~익일 05시까지 포장배달만 가능','jeju064
','https://www.jeju.go.kr/pub/skin/skin_v21.03.0/doc.html?fn=447bf8fd-7b4e-41d9-94ac-9b46903f47e1.hwp&rs=/files/convert2020/202101/');

--부산광역시
INSERT INTO POLICYS (P_ID,P_SDATE,P_EDATE,P_LEVEL,P_PRIVATE,P_ENTER,P_REST,MB_ID,P_LINK)
VALUES ('P017','2021-08-02','2021-08-08','3','4명까지 모임 가능','집합금지','22시 ~ 다음날 5시까지 포장‧배달만 허용','busan051
','https://www.busan.go.kr/covid19/Prevention07.do');