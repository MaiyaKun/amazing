
/* Drop Tables */

DROP TABLE BASKET CASCADE CONSTRAINTS;
DROP TABLE BOARD_COMMENT CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE FILES CASCADE CONSTRAINTS;
DROP TABLE ORDER_LIST CASCADE CONSTRAINTS;
DROP TABLE PRODUCT_COMMENT CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE GENRE CASCADE CONSTRAINTS;
DROP TABLE MEMBERS CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_BASKET_BASKET_NO;
DROP SEQUENCE SEQ_BOARD_COMMENT_LIST_COM_NO;
DROP SEQUENCE SEQ_BOARD_STR_NO;
DROP SEQUENCE SEQ_FILES_FILE_NO;
DROP SEQUENCE SEQ_GENRE_GENRE_NO;
DROP SEQUENCE SEQ_MEMBERS_USER_NO;
DROP SEQUENCE SEQ_ORDER_LIST_ORDER_NO;
DROP SEQUENCE SEQ_PRODUCT_COMMENT_PRO_COM_NO;
DROP SEQUENCE SEQ_PRODUCT_PRODUCT_NO;




/* Create Sequences */

CREATE SEQUENCE SEQ_BASKET_BASKET_NO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_BOARD_COMMENT_LIST_COM_NO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_BOARD_STR_NO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_FILES_FILE_NO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_GENRE_GENRE_NO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MEMBERS_USER_NO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ORDER_LIST_ORDER_NO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_PRODUCT_COMMENT_PRO_COM_NO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_PRODUCT_PRODUCT_NO INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE BASKET
(
	BASKET_NO number NOT NULL ,
	PRODUCT_NO number NOT NULL,
	USER_NO number NOT NULL,
	QUANTITY number NOT NULL,
	PRIMARY KEY (BASKET_NO)
);


CREATE TABLE BOARD
(
	STR_NO number NOT NULL ,
	USER_NO number NOT NULL,
	TITLE varchar2(200) NOT NULL,
	STORY varchar2(4000) NOT NULL,
	CRE_DATE date NOT NULL,
	MOD_DATE date NOT NULL,
	PRIMARY KEY (STR_NO)
);


CREATE TABLE BOARD_COMMENT
(
	LIST_COM_NO number NOT NULL ,
	STR_NO number NOT NULL,
	USER_NO number NOT NULL,
	STORY varchar2(600) NOT NULL,
	CRE_DATE date NOT NULL,
	PRIMARY KEY (LIST_COM_NO)
);


CREATE TABLE FILES
(
	FILE_NO number NOT NULL ,
	ORIGINAL_NAME varchar2(100) NOT NULL,
	SERVER_NAME varchar2(100) NOT NULL,
	FILESIZE number NOT NULL,
	CRE_DATE date NOT NULL,
	PRIMARY KEY (FILE_NO)
);


CREATE TABLE GENRE
(
	GENRE_NO number NOT NULL ,
	GNAME varchar2(20) NOT NULL ,
	PRIMARY KEY (GENRE_NO)
);


CREATE TABLE MEMBERS
(
	USER_NO number NOT NULL ,
	ID varchar2(100) NOT NULL ,
	PASSWORD varchar2(40) NOT NULL,
	USERNAME varchar2(30) NOT NULL,
	ADDRESS varchar2(200) NOT NULL,
	PHONE varchar2(30) NOT NULL,
	CRE_DATE date NOT NULL,
	MOD_DATE date NOT NULL,
	CASH number DEFAULT 0 NOT NULL,
	-- T = TRUE
	-- F = FALSE
	AUTH varchar2(3) DEFAULT 'F' NOT NULL,
	PRIMARY KEY (USER_NO)
);


CREATE TABLE ORDER_LIST
(
	ORDER_NO number NOT NULL ,
	ORDER_IDX varchar2(40) NOT NULL,
	USER_NO number NOT NULL,
	PRODUCT_NO number NOT NULL,
	QUANTITY number NOT NULL,
	PICK_NAME varchar2(30),
	PICK_ADDR varchar2(200),
	PICK_PHONE varchar2(30),
	CRE_DATE date NOT NULL,
	PRIMARY KEY (ORDER_NO)
);


CREATE TABLE PRODUCT
(
	PRODUCT_NO number NOT NULL ,
	GENRE_NO number NOT NULL,
	TITLE varchar2(150) NOT NULL,
	TITLE_FILE varchar2(100) DEFAULT 'noimage.jpg' NOT NULL,
	PD_NAME varchar2(100) NOT NULL,
	PD_FILE varchar2(100) DEFAULT 'noimage.jpg' NOT NULL,
	PRICE number NOT NULL,
	STOCK number DEFAULT 0 NOT NULL,
	ACTOR varchar2(200) NOT NULL,
	ADMIN_COM varchar2(1000),
	ADMIN_SCORE number NOT NULL,
	STORY varchar2(4000),
	CRE_DATE date NOT NULL,
	MOD_DATE date NOT NULL,
	PRIMARY KEY (PRODUCT_NO)
);


CREATE TABLE PRODUCT_COMMENT
(
	STORY varchar2(600) NOT NULL,
	PRO_COM_NO number NOT NULL ,
	PRODUCT_NO number NOT NULL,
	USER_NO number NOT NULL,
	SCORE number(1) NOT NULL,
	CRE_DATE date NOT NULL,
	PRIMARY KEY (PRO_COM_NO)
);



/* Create Foreign Keys */

ALTER TABLE BOARD_COMMENT
	ADD FOREIGN KEY (STR_NO)
	REFERENCES BOARD (STR_NO)
;


ALTER TABLE PRODUCT
	ADD FOREIGN KEY (GENRE_NO)
	REFERENCES GENRE (GENRE_NO)
;


ALTER TABLE BASKET
	ADD FOREIGN KEY (USER_NO)
	REFERENCES MEMBERS (USER_NO)
;


ALTER TABLE BOARD
	ADD FOREIGN KEY (USER_NO)
	REFERENCES MEMBERS (USER_NO)
;


ALTER TABLE BOARD_COMMENT
	ADD FOREIGN KEY (USER_NO)
	REFERENCES MEMBERS (USER_NO)
;


ALTER TABLE ORDER_LIST
	ADD FOREIGN KEY (USER_NO)
	REFERENCES MEMBERS (USER_NO)
;


ALTER TABLE PRODUCT_COMMENT
	ADD FOREIGN KEY (USER_NO)
	REFERENCES MEMBERS (USER_NO)
;


ALTER TABLE BASKET
	ADD FOREIGN KEY (PRODUCT_NO)
	REFERENCES PRODUCT (PRODUCT_NO)
;


ALTER TABLE ORDER_LIST
	ADD FOREIGN KEY (PRODUCT_NO)
	REFERENCES PRODUCT (PRODUCT_NO)
;


ALTER TABLE PRODUCT_COMMENT
	ADD FOREIGN KEY (PRODUCT_NO)
	REFERENCES PRODUCT (PRODUCT_NO)
;



/* Comments */

COMMENT ON COLUMN MEMBERS.AUTH IS 'T = TRUE
F = FALSE';


insert into members
value(user_no, id, password, username, address, phone, cre_date, mod_date, cash, auth)
values(SEQ_MEMBERS_USER_NO.nextval, 'admin', 'admin', '관리자', '본사 사옥', '00000000000', sysdate, sysdate, 0, 'T' );

insert into members
value(user_no, id, password, username, address, phone, cre_date, mod_date, cash, auth)
values(SEQ_MEMBERS_USER_NO.nextval, 'aaaa', 'aaaa', '이민우',  '서울특별시 홍대입구역 4번출구 앞 401호', '02097563255'
    , sysdate, sysdate, 0, 'F');

insert into members
value(user_no, id, password, username, address, phone, cre_date, mod_date, cash, auth)
values(SEQ_MEMBERS_USER_NO.nextval, 'bbbb', 'bbbb', '이진상', '경기도 용인시 용인구청 뒤 육교 옆 1201호', '03035351212'
    , sysdate, sysdate, 0, 'F');

insert into members
value(user_no, id, password, username, address, phone, cre_date, mod_date, cash, auth)
values(SEQ_MEMBERS_USER_NO.nextval, 'cccc', 'cccc', '조재한', '서울특별시 영등포구 굴다리밑 102호', '09415435487'
    , sysdate, sysdate, 0, 'F');

insert into members
value(user_no, id, password, username, address, phone, cre_date, mod_date, cash, auth)
values(SEQ_MEMBERS_USER_NO.nextval, 'dddd', 'dddd', '이기창', '서울특별시 영등포구 굴다리밑 105호', '93415435487'
    , sysdate, sysdate, 0, 'F');

insert into members
value(user_no, id, password, username, address, phone, cre_date, mod_date, cash, auth)
values(SEQ_MEMBERS_USER_NO.nextval, 'eeee', 'eeee', '전종건', '서울특별시 영등포구 굴다리위 102호', '09452487487'
    , sysdate, sysdate, 0, 'F');


insert into genre
value(genre_no, gname)
values(SEQ_GENRE_GENRE_NO.nextval, '액션');

insert into genre
value(genre_no, gname)
values(SEQ_GENRE_GENRE_NO.nextval, 'SF');

insert into genre
value(genre_no, gname)
values(SEQ_GENRE_GENRE_NO.nextval, '호러');

insert into genre
value(genre_no, gname)
values(SEQ_GENRE_GENRE_NO.nextval, '판타지');

insert into genre
value(genre_no, gname)
values(SEQ_GENRE_GENRE_NO.nextval, '느와르');

insert into genre
value(genre_no, gname)
values(SEQ_GENRE_GENRE_NO.nextval, '코미디');

insert into genre
value(genre_no, gname)
values(SEQ_GENRE_GENRE_NO.nextval, '아포칼립스');

insert into genre
value(genre_no, gname)
values(SEQ_GENRE_GENRE_NO.nextval, '스포츠');

insert into genre
value(genre_no, gname)
values(SEQ_GENRE_GENRE_NO.nextval, '멜로');

insert into genre
value(genre_no, gname)
values(SEQ_GENRE_GENRE_NO.nextval, '드라마');

insert into genre
value(genre_no, gname)
values(SEQ_GENRE_GENRE_NO.nextval, '애니메이션');


insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 4, '워크래프트', 'm1.jpg', '덩컨 존스', 'p1.jpg', 30000, 1500, '벤 포스터'
    , '워크래프트 시리즈의 시작!', 4
    , '두 개의 운명, 하나의 세계
 공존할 것인가! 맞설 것인가!
 
 서로 다른 차원에 살고 있던 인간과 오크.
 오크의 행성이 황폐해지기 시작하자, 이들은 인간의 행성으로 넘어와 새로운 왕국을 건설하려 한다. 생존을 위해 서로의 도움이 필요하다고 믿는 인간 종족의 영웅 "로서"와 오크 종족의 영웅 "듀로탄". 하지만, 공존에 반대하는 또 다른 세력이 분열되면서 두 진영은 더 큰 혼란에 빠지게 되는데…
 
 세상의 운명을 건 피할 수 없는 전쟁이 시작된다!', sysdate, sysdate);
 
insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 2, '소스 코드', 'm2.jpg', '덩컨 존스', 'p2.jpg', 30000, 1500, '제이크 질렌할'
    , '현실과 또다른 현실. 진실은 무엇인가', 4
    , 'SF 액션의 진화 (소스 코드) | 주어진 시간 단 8분, 과거에 접속해 미래를 구하라!
도시를 위협하는 열차 폭탄 테러 사건 해결을 위해 호출된 콜터 대위. ‘소스 코드’에 접속해 기차 테러로 희생된 한 남자의 마지막 8분으로 들어가 폭탄을 찾고 범인을 잡아야 하는 임무를 부여 받는다. 이 임무가 성공해야만 6시간 뒤로 예고된 시카고를 날려버릴 대형 폭탄 테러를 막을 수 있다. 그는 모든 직감을 이용해 사건의 단서와 용의자를 찾아야 하는데……'
    , sysdate, sysdate);
    
insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 4
    , 'MOON', 'm3.jpg', '던칸 존스', 'm3.jpg', 25000, 1500
    , '샘 락웰', '가장 인간적인 것은 역설적으로 로봇들이었다', 4
    , '비밀이 숨겨진 그 곳 (더 문) | 상상할 수 없는 기억의 진실!!
가까운 미래. 달표면의 자원채굴 기지에 홀로 3년간 근무중인 주인공 샘 벨(샘 락웰). 그는 통신위성 고장으로 3년간 외부와 단절되어 자신을 돕는 컴퓨터 거티(케빈 스페이시)와 대화하며 외롭게 일하고 있다. 긴 3년의 근무를 끝내고 2주 후 귀환해 사랑하는 가족을 만날 희망에 부푼 샘. 그러나 샘은 어느 날 기지 안에서 신비로운 한 여인을 환영처럼 보는가 하면, 기지 밖에서도 미스터리한 존재를 보게 되면서 달 기지에 무언가 비밀이 있음을 알게 된다. 환영인지 실체인지 알 수 없는 존재를 조사하던 샘은 중 곧 충격적인 사실을 알게되는데…'
    , sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval
    , 1, '배트맨 대 슈퍼맨 : 저스티스의 시작', 'm4.jpg', '잭 스나이더', 'p4.png', 35000, 1500
    , '핸리 카빌, 벤 애플랙', '마사닦이', 3
    , '모든 대결에는 이유가 있다!
슈퍼맨과 조드 장군의 격렬한 전투 이후 메트로폴리스는 파괴되었고 슈퍼맨은 세계 최고 논쟁의 인물이 되어버린다.
 한편 배트맨은 그 동안 타락했던 많은 자들처럼 슈퍼맨 역시 언젠가 타락을 할 것이라 생각하며 사회에서 가장 위험한 존재로 여긴다.
 세계의 미래를 위해 무모하고 제어할 수 없는 힘을 가진 슈퍼맨으로 인해 벌어졌던 일들을 바로 잡으려 하는데…'
    , sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval
    , 1, '300', 'm5.jpg', '잭 스나이더', 'p5.png', 30000, 1500
    , '제라드 버틀러', '저녁은 지옥에서 먹는다!', 4
    , '역사상 가장 위대한 전사들이 온다! | BC 480년, 300명의 전사들이 100만 대군과 맞섰다
BC 480년. "크세르크세스" 왕이 이끄는 페르시아 100만 대군이 그리스를 침공한다. 그리스군의 연합이 지연되자 스파르타의 왕 "레오니다스(제라드 버틀러)"는 300명의 스파르타 용사들을 이끌고 "테르모필레 협곡"을 지킨다.
  100만 대군과 맞서는 무모한 싸움. 그러나 스파르타의 위대한 용사들은 나라를 위해, 가족을 위해 그리고 자기 자신의 명예를 위해 불가능한 이 전투에 맹렬히 자신들의 모든 것을 건다! 전설이 된 전투, 그들의 용맹함이 마침내 빛을 발한다! 모두들 각오하라!!'
    , sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval
    , 3, '새벽의 저주', 'm6.jpg', '잭 스나이더', 'p6.png', 15000, 1500
    , '사라 폴리', '에이 하나도 안무섭네 ㅎㅎ. 오늘은 엄마랑 같이 자야겠다', 5
    , '가장 사랑했던 것들이 너를 노리고 있다!
지옥이 만원이면 죽은 자들이 지상으로 돌아온다
인간에 대한 신의 심판은 가끔은 혹독 할지도 모른다. 그래서 지옥을 꽉 차게 만들고 이 죽은 자들은 갈 곳이 없어 다시 지상으로 돌아와 살아 있는 인간을 사냥하기 시작한다. 어느날 새벽, 간호사 안나는 느닷없이 나타난 옆집 소녀에게 남편이 물어 뜯겨 죽는 참혹한 광경을 목격한다. 슬퍼하거나 놀랄 틈도 없이 죽었던 남편은 다시 되살아나 안나를 공격하고 안나는 급히 집 밖으로 도망쳐 나온다. 그러나 집밖에도 이미 같은 일들이 벌어지고 있었으며, 세상은 순식간에 생지옥으로 변하고 만다. 어디서 왔는지 정체를 알 수 없는 산 시체 들에게 한번 물리면 그 순간 물린 사람도 좀비로 변하고, 이런 연쇄작용으로 인해 도시는 혼이 없는 시체들에게 점령당하고 만다.
  필사적으로 도망치던 안나는 몇몇 사람들과 함께 한 쇼핑몰 안으로 피신한다. 그러나 살아있는 인간들의 마지막 도피처라고도 할 수 있는 이 쇼핑몰도 그들의 안식처가 될 수 는 없었다. 극한 상황 속에 몰린 사람들이라 자신들의 의견을 내세우는 등 인간이 느낄 수 있는 최악의 갈등이 적나라하게 드러나게 된다. 설상가상으로 좀비들이 쇼핑 몰로 몰려오자 이들은 또 다른 도피처를 찾기 위하여 필사적인 탈출을 시도하게 되는데..'
    , sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval
    , 1, '아쿠아맨', 'm7.jpg', '제임스 완', 'p7.jpg', 45000, 1500
    , '제임스 모모완', '수남이형 하고싶은거 다해 헝헝헝', 4
    , '땅의 아들이자 바다의 왕, 심해의 수호자인 슈퍼히어로 아쿠아맨의 탄생을 그린 액션 블록버스터'
    , sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval
    , 3, '쏘우', 'm8.jpg', '제임스 완', 'p8.jpg', 20000, 1500
    , '리 워넬', '당신의 상상력이 조각난다. 이 이상의 표현은 없다.', 4
    , '영리한 스릴러 | 당신의 상상력이 조각난다! | 낯선 지하실, 쇠사슬로 묶인 채로 깨어난 두 남자 | 주어진 시간은 8시간! 다른 한 명을 죽이지 않으면 둘 다 목숨을 잃게 된다
어느 캄캄한 지하실. 자신들의 발목에 쇠줄이 묶인 채 마주하게 된 "아담"(리 웨넬)과 닥터 "고든"(캐리 엘위즈). 둘은 자신들이 왜 잡혀왔는지, 서로가 누군지조차 모르고 있다. 어떻게든 빠져나가려고 갖은 애를 써보지만 소용이 없다. 주머니 속에는 8시간 내에 고든이 아담을 죽이지 않으면 둘은 물론 고든의 부인과 딸까지 죽이겠다는 범인의 음성이 담긴 테이프가 들어 있을 뿐.
 한편, 연쇄살인을 추적하던 "탭"형사(대니 글로버)는 닥터 "고든"을 범인으로 지목하고 그 뒤를 쫓는다. 범인의 윤곽은 좀처럼 드러나지 않고, 예정된 시간은 점점 가까워져 오는데..'
    , sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval
, 1, '분노의 질주 더 세븐', 'm9.jpg', '제임스 완', 'p9.jpg', 40000, 1500
, '빈 디젤, 폴 워커', '폴 워커의 유작', 5
, '역대 최강의 멤버 VS 사상 최악의 상대 팀을 지키기 위한 그들의 반격이 시작된다!
거대 범죄 조직을 소탕한 뒤 전과를 사면 받고, 평범한 일상을 되찾은 도미닉(빈 디젤)과 멤버들.
 하지만 평화도 잠시, 한(성 강)의 갑작스러운 죽음에 이어, 도미닉의 집이 순식간에 폭파당한다.
 그들을 차례대로 제거하려는 최악의 상대 데카드 쇼(제이슨 스타뎀)의 등장으로
 도미닉은 다시 한 번 역대 최강의 멤버들을 불러모아 숨막히는 반격을 결심하는데…'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval
, 3, '애나벨 : 집으로', 'm10.jpg', '제임스 완', 'p10.jpg', 25000, 1500
, '패트릭 윌슨', '하지 말라는건 좀 하지마라', 4
, '“애나벨이 그 집의 모든 악령을 깨웠다”
퇴마사 워렌 부부는 저주 받은 인형 애나벨을 발견하고
 집에 있는 오컬트 뮤지엄 진열장에 격리시킨다.
 또 다른 초자연적인 현상을 연구하기 위해 워렌 부부가 떠난 사이,
 집에 남아있던 10살 딸 주디와 베이비시터는
 "절대 들어가지 말라"는 경고를 어기고 마는데…
 탈출한 애나벨은 모든 악령들을 깨우고,
 잊을 수 없는 공포의 밤을 준비한다.'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 1, '아이언맨', 'm11.jpg', '존 파브로', 'p11.jpg'
, 15000, 100, '로버트 다우니 주니어', '멋진 아이언맨의 탄생!', 5
, '억만장자 토니 스타크. 아프가니스탄에서 자신이 개발한 신무기 발표를 성공리에 마치고 돌아가던 그는 게릴라군의 갑작스런 공격에 의해 가슴에 치명적인 부상을 입고 게릴라군에게 납치되는데..!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 1, '아이언맨2', 'm12.jpg', '존 파브로', 'p12.jpg'
, 15000, 100, '로버트 다우니 주니어', '아이언맨의 위기!', 4
, '화려한 삶을 살아가던 토니 스타크. 기자회견을 통해 자신이 아이언맨이라고 정체를 밝힌 이후, 정부로부터 아이언맨 수트를 국가에 귀속시키라는 압박을 받지만 이를 거부한 채 더욱 화려하고 주목 받는 나날을 보내는데..!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 1, '어벤져스', 'm13.jpg', '조스 웨던', '.p13jpg'
, 10000, 100, '로버트 다우니 주니어, 크리스 에반스, 크리스 햄스워스', '영웅들의 집합은 멋졌습니다.', 5
, '지구의 안보가 위협당하는 위기의 상황에서 슈퍼히어로들을 불러모아 세상을 구하는, 일명 [어벤져스] 작전이 시작되는데..!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 1, '어벤져스 : 에이지 오브 울트론', 'm14.jpg', '조스 웨던', 'p14.jpg'
, 25000, 100, '로버트 다우니 주니어, 크리스 에반스, 크리스 햄스워스', '충분히 멋지지만 1탄만큼의 감동이...', 3
, '"뉴욕전쟁" 때와 같은 사태가 벌어지지 않도록 스타크는 배너 박사와 함께 지구를 지킬 최강의 인공지능 울트론을 탄생시키게 되지만, 울트론은 예상과 다르게 지배를 벗어나 폭주하기 시작하는데..!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 1, '캡틴 아메리카 : 윈터 솔져', 'm15.jpg', '루소 형제', 'm15.jpg'
, 13000, 100, '크리스 에반스', '윈터솔져와 캡틴의 결투씬은 가히 최고였다.', 5
, '어벤져스의 뉴욕 사건 이후 닉 퓨리, 블랙 위도우와 함께 쉴드의 멤버로 현대 생활에 적응해 살아가는 캡틴 아메리카. 적 윈터 솔져가 되어 돌아오고, 어벤져스를 향한 최악의 위기가 시작는데..!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 1, '캡틴 아메리카 : 시빌워', 'm16.jpg', '루소 형제', 'm16.jpg'
, 17000, 100, '크리스 에반스, 로버트 다우니 주니어', '캡틴과 아이언맨 누가 옳은 걸까?', 5
, '정부는 "슈퍼히어로 등록제"를 내놓는다. 어벤져스 내부는 정부의 입장을 지지하는 찬성파(팀 아이언맨)와 이전처럼 정부의 개입 없이 자유롭게 인류를 보호해야 한다는 반대파(팀 캡틴)로 나뉘어 대립하기 시작하는데..!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 1, '어벤져스 : 인피니티워', 'm17.jpg', '루소 형제', 'p17.jpg'
, 14000, 100, '로버트 다우니 주니어, 크리스 에반스, 크리스 햄스워스', '상상치도 못한 비극...', 3
, '새로운 조합을 이룬 어벤져스, 역대 최강 빌런 타노스에 맞서 세계의 운명이 걸린 인피니티 스톤을 향한 무한 대결이 펼쳐진다!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 1, '어벤져스 : 엔드게임', 'm18.jpg', '루소 형제', 'p18.jpg'
, 35000, 100, '로버트 다우니 주니어, 크리스 에반스, 크리스 햄스워스', '어벤져스!! 어셈블!', 5
, '인피니티 워 이후 절반만 살아남은 지구 마지막 희망이 된 어벤져스 먼저 떠난 그들을 위해 모든 것을 걸었다! 위대한 어벤져스 운명을 바꿀 최후의 전쟁이 펼쳐진다!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 3, '고무인간의 최후', 'm19.jpg', '피터 잭슨', 'p19.jpg'
, 11000, 100, '피터 잭슨', '외계인의 민트초코', 1
, '외계인의 침입으로 폐허가 된 마을 그곳에 6명의 인간들이 외계인의 씨를 말리기 위해 생사를 무릅쓴다. 지구인의 모습으로 인간들을 사정없이 먹어치우는 외계인들. 수십발의 총알과 도끼, 나무톱. 상상할 수조차 없는 잔인한 방법으로 외계인을 죽이는데..!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 4, '킹콩', 'm20.jpg', '피터 잭슨', 'p20.jpg'
, 20000, 100, '나오미 왓츠, 잭 블랙', '괴수와 인간의 조우 그 끝은...', 5
, '신비로운 해골섬의 전설적인 야수 "킹콩", 뉴욕으로 잡혀 온"킹콩"이 도심 한복판에서 벌이는 숨막히는 액션과 환상적인 로맨스가 펼쳐진다!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 4, '반지의 제왕 : 반지 원정대', 'm21.jpg', '피터 잭슨', 'p21.jpg'
, 15000, 1000, '일라이저 우드, 이안 멕컬런', '전설의 시작', 3
, '호빗 "프로도"와 그의 친구들, 엘프 "레골라스", 인간 전사 "아라곤"과 "보로미르" 드워프 "김리" 그리고 마법사 "간달프"로 구성된 반지원정대는 평화를 지키기 위해 절대반지를 파괴할 유일한 방법인 반지가 만들어진 모르도르를 향해 목숨을 건 여정을 떠나는데..!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 4, '반지의 제왕 : 두개의 탑', 'm22.jpg', '피터 잭슨', 'p22.jpg'
, 15000, 500, '일라이저 우드, 이안 멕컬런', '최고의 전쟁씬', 4
, '호빗 "프로도"와 그의 친구들, 엘프 "레골라스", 인간 전사 "아라곤"과 "보로미르" 드워프 "김리" 그리고 마법사 "간달프"로 구성된 반지원정대는 평화를 지키기 위해 절대반지를 파괴할 유일한 방법인 반지가 만들어진 모르도르를 향해 목숨을 건 여정을 떠나는데..!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 4, '반지의 제왕 : 왕의 귀환', 'm23.jpg', '피터 잭슨', 'p23.jpg'
, 15000, 100, '일라이저 우드, 이안 멕컬런', '판타지의 끝이자 최고의 결말', 5
, '호빗 "프로도"와 그의 친구들, 엘프 "레골라스", 인간 전사 "아라곤"과 "보로미르" 드워프 "김리" 그리고 마법사 "간달프"로 구성된 반지원정대는 평화를 지키기 위해 절대반지를 파괴할 유일한 방법인 반지가 만들어진 모르도르를 향해 목숨을 건 여정을 떠나는데..!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 4, '호빗 : 뜻밖의 여정', 'm24.jpg', '피터 잭슨', 'p24.jpg'
, 15000, 100, '마틴 프리먼, 이안 멕컬런', '뜻밖의 시작!', 2
, '호빗족 "빌보 배긴스"는 어느 날 갑자기 찾아온 회색의 마법사 "간달프"로부터 뜻밖의 제안을 받는다. 어쩔 수 없이 전설의 용사 "소린"이 이끄는 13명의 난쟁이족과 함께 고블린과 오르크, 흉악한 괴수 와르그, 마법사들과 마주쳐야 하는 위험 가득한 여정에 오르는데..!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 4, '호빗 : 스마우그의 폐허', 'm25.jpg', '피터 잭슨', 'p25.jpg'
, 15000, 100, '마틴 프리먼, 이안 멕컬런', '난쟁이들의 폭풍 케미', 5
, '"외로운 산" 에레보르 왕국을 되찾기 위해 뜻하지 않은 여정을 떠나게 된 호빗 "빌보 배긴스"와 "간달프", 난쟁이족 왕족의 후예 "소린"이 이끄는 13명의 난쟁이족.그들이 지금껏 만났던 그 어떤 존재보다도 위험하고 모두의 용기와 우정, 지혜의 한계를 시험에 들게 한 용 스마우그와 맞닥뜨리게 되는데..!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 4, '호빗 : 다섯 군단의 전투', 'm26.jpg', '피터 잭슨', 'p26.jpg'
, 15000, 100, '마틴 프리먼, 이안 멕컬런', '스마우그가 너무....', 4
, '암흑의 군주 사우론은 오크 군대를 보내 외로운 산에 기습 공격을 감행한다. 고조된 긴장감 속에 어둠이 깔리자 난쟁이, 엘프, 인간은 단합할 것인지 말살될 것인지 택해야 한다. 마침내 다섯 군대의 전투가 시작되고 빌보는 본인과 친구들의 목숨을 걸고 싸워야만 하는데..!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 3, '이블데드', 'm27.jpg', '샘 레이미', 'p27.jpg'
, 50000, 100, '브루스 캠벨', '최고의 B급 호러 무비', 5
, '테잎을 듣는 것에 대해 옥신각시하던 중, 밖에는 형체 불명의 괴물이 이들을 노리고 친구가 흉칙한 얼굴로 변한다. 하나 둘 흉칙한 모습으로 쓰러진 친구들은 무시무시한 힘으로 다른 친구를 덮쳐 결국 마지막에 애쉬만 남는데..!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 1, '스파이더맨', 'm28.jpg', '샘 레이미', 'p28.jpg'
, 10000, 100, '토비 맥과이어', '최고의 찌질이 연기!', 5
, '평범하고 내성적인 학생 피터 파커, 그는 우연히 유전자가 조작된 슈퍼거미에 물린다. 그 후, 피터는 손에서 거미줄이 튀어 나오고 벽을 기어 오를 수 있는 거미와 같은 능력을 갖게 되는데..!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 1, '스파이더맨2', 'm29.jpg', '샘 레이미', 'p29.jpg'
, 14000, 100, '토비 맥과이어', '옥토퍼스 간지!', 5
, '스파이더맨에게 아버지를 잃고 복수심에 불타는 피터의 친구 해리가 연구 중 폭발로 기계촉수와 엄청난 파워를 갖게된 닥터 옥토퍼스에게 뿌리치지 못할 제안을 하면서 스파이더맨의 운명은 점차 예측불가능한 상황으로 전개되는데..!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 1, '스파이더맨3', 'm30.jpg', '샘 레이미', 'p30.jpg'
, 15000, 100, '토비 맥과이어', '베놈 간지!', 5
, '대중의 사랑을 듬뿍 받으며 진정한 영웅으로 거듭난 스파이더맨, 피터 파커. 어느 날, 스파이더맨은 외계에서 온 수수께끼의 유기체인 심비오트에 감염되고 스파이더맨은 오리지날 스파이더맨에서 블랙 슈트 스파이더맨으로 변화하는데..!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval
, 4, '고질라', 'm31.jpg', '가렛 에드워즈', 'p31.jpg', 30000, 1500
, '애런 존슨', '괴수들의 왕이 돌아왔다', 4
, '포드 브로디는 어렸을 때에 일본 내 원자력 발전소에서 방사능 피폭사고로 어머니를 잃는다.
 15년 후 포드의 아버지 조는 사고의 원인이 자연재해가 아닌 다른 것이라고 믿고 계속해서 조사를 하지만 금지구역에 들어갔다가 결국 포드와 함께 붙잡히게 된다.
 비밀 연구소로 옮겨진 그들은 정부가 감추고 있던 괴생명체의 고치를 보게 되고, 때마침 고치에서 부화한 무토는 그곳을 빠져나가 인간들의 도시를 파괴하며 난동을 부리기 시작한다.
 한편 무토가 뿜어내는 신호를 듣고 거대한 괴수가 쓰나미를 일으키며 나타나는데...'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 4
, '고질라 : 킹 오브 몬스터', 'm32.jpg', '마이클 도허티', 'p32.jpg', 30000, 1500
, '밀리 바비 브라운', '고질라 : 방사능 한잔했습니다..인간들 연기가 별로일수도 있습니다..하지만 고질라 이거하나만 기억해주십쇼', 4
, '인간들을 구하라 vs 인간들을 죽여라
주파수로 초거대 괴수들을 조종한다!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval
, 1, '클레멘타인', 'm33.jpg', '김두영', 'p33.jpg', 10000, 100
, '스티븐 시걸', '시대가 몰라본 희대의 명작', 5
, '기막힌 승부가 시작된다. | 2004년 싸워야만 하는 남자의 슬픔!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval
, 1, '데드풀', 'm34.jpg', '팀 밀러', 'p34.jpg', 30000, 1500
, '라이언 레이놀즈', '준비된 또라이. 브레이크 없는 제작진.', 5
, '정의감 제로, 책임감 제로, 정신은 인터스텔라급
마블 역사상 가장 매력 터지는 히어로 ‘데드풀’이 온다!
전직 특수부대 출신의 용병 ‘웨이드 윌슨(라이언 레놀즈)’은 암 치료를 위한 비밀 실험에 참여 후,
 강력한 힐링팩터를 지닌 슈퍼히어로 ‘데드풀’로 거듭난다.
 탁월한 무술실력과 거침없는 유머감각을 지녔지만 흉측하게 일그러진 얼굴을 갖게 된 데드풀은
 자신의 삶을 완전히 망가뜨린 놈들을 찾아 뒤쫓기 시작하는데…'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval
, 1, '데드풀 2', 'm35.jpg', '데이빈 릐치', 'p35.jpg', 35000, 1500
, '라이언 레이놀즈', '준비된 또라이들이 브레이크 없는 택시에 올라탄다', 5
, '마침내, 그 분이 오신다! 이번엔 혼자가 아니다!
암치료를 위한 비밀 실험에 참여한 후,
 강력한 힐링팩터 능력을 지닌 슈퍼히어로 데드풀로 거듭난 웨이드 윌슨(라이언 레놀즈),
 운명의 여자친구 바네사(모레나 바카린)와 행복한 미래를 꿈꾸지만 다시 나락으로 떨어지고,
 밑바닥까지 내려간 데드풀은 더 나은 사람이 되기로 결심한다.
 
 어느 날, 미래에서 시간 여행이 가능한 용병 케이블(조슈 브롤린)이 찾아 오면서
 새로운 사건이 발생하고 데드풀은 생각지도 못한 기상천외 패밀리를 결성하게 되는데...'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 1
, '존 윅', 'm36.jpg', '데이빗 릐치', 'p36.jpg', 15000, 1000
, '키아누 리브스', '그는 감상평을 쓰고있을 시간에 키보드로 4명을 더 죽입니다.', 4
, '그를 건드리지 말았어야 했다
상대를 잘못 고른 적들을 향한 통쾌한 복수!
전설이라 불리던 킬러 "존 윅"(키아누 리브스)은 사랑하는 여인을 만나 결혼을 하면서 범죄의 세계에서 은퇴한다. 행복도 잠시, 투병 끝에 부인이 세상을 떠나고 그의 앞으로 부인이 죽기 전에 보낸 강아지 한 마리가 선물로 배달된다. 그러던 어느 날, 그의 집에 괴한들이 들이닥치는데…
 
 더 이상 잃을 것이 없다. 오직 너희만 죽인다!
 건드리지 말아야 할 그의 분노를 잘못 깨웠다.
 받은 것보다 더 돌려주는 통쾌한 복수, 존 윅의 거침없는 복수가 마침내 폭발한다!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 1
, '분노의 질주 : 홉스 앤 쇼', 'm37.jpg', '데이빗 릐치', 'p37.jpg', 50000, 1500
, '제이슨 스타뎀, 드웨인 존슨', '웬수 둘이 모여서 함께놀면 주변이 어떻게 되는지를 보여준다', 5
, '드디어 그들이 만났다!
공식적으로만 세상을 4번 구한 전직 베테랑 경찰 "루크 홉스"(드웨인 존슨)
 분노 조절 실패로 쫓겨난 전직 특수요원 "데카드 쇼"(제이슨 스타뎀)
 99.9% 완벽히 다른 두 남자는 전 세계를 위협하는 불가능한 미션을 해결하기 위해
 어쩔 수 없이 한 팀이 되고 마는데…'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 1
, '아토믹 블론드', 'm38.jpg', '데이빗 릐치', 'p38.jpg', 30000, 1500
, '샤를리즈 테론', '이 누나는 영화를 찍을때마다 리즈를 갱신합니다.', 4
, '미국, 영국, 프랑스, 독일, 러시아!
각국 최고의 스파이가 베를린에 모였다!
냉전시대 스파이 전쟁의 주무대가 된 베를린,
 MI6의 요원을 살해하고 핵폭탄급 정보를 담고 있는 전 세계 스파이 명단을 훔쳐 달아난
 이중 스파이를 잡기 위해 MI6 최고의 요원 "로레인"이 급파된다.
 각국의 스파이들은 명단을 차지하기 위해 혈안이 되고, 로레인 역시 동독과 서독을 오가며 미션을 수행한다.
 하지만 생각지도 못한 음모로 인해 정체가 밝혀져 목숨까지 위협받게 되고,
 마침내 베를린 장벽이 무너지기 하루 전날 결전의 밤을 맞이하는데...
 
 누구도 믿을 수 없는 상황, 미션을 완수할 수 있을 것인가!'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 1
, '존 윅 : 리로드', 'm39.jpg', '채드 스타헬스키', 'p39.jpg', 20000, 1000
, '키아누 리브스', '감상평을 쓸 시간에 그는 연필로 4명을 더 죽입니다. 그걸 확인하십시오', 5
, '장전 완료! 준비는 끝났다!
업계 최고의 레전드 킬러 "존 윅"은 과거를 뒤로한 채 은퇴를 선언하지만,
 과거 자신의 목숨을 구했던 옛 동료와 피로 맺은 암살자들의 룰에 의해 로마로 향한다.
 "국제 암살자 연합"을 탈취하려는 옛 동료의 계획으로 "존 윅"은 함정에 빠지게 되고,
 전세계 암살자들의 총구는 그를 향하는데...'
, sysdate, sysdate);

insert into product
value(product_no, genre_no, title, title_file, pd_name, pd_file, price, stock
    , actor, admin_com, admin_score, story, cre_date, mod_date)
values(SEQ_PRODUCT_PRODUCT_NO.nextval, 1
, '존 윅 : 파라벨럼', 'm40.jpg', '채드 스타헬스키', 'p40.jpg', 40000, 1000
, '키아누 리브스', '평화는 총 끝에서 나온다', 4
, '전설이 된 킬러 "존 윅" (키아누 리브스).
 룰을 어긴 죄로 그에게 현상금 1,400만 불이 붙고,
 전 세계 모든 킬러의 총구가 그를 향한다.
 
 국제암살자연맹의 파문 조치가 내려진 그는
 아무런 보호도 받지 못한 채 시시각각 위험에 직면하고
 결국, 마지막 전쟁을 위해 "소피아"(할리 베리)를 찾아가는데…
 
 출구는 없다! 평화를 원한다면, 전쟁을 준비하라!'
, sysdate, sysdate);

INSERT INTO board
value(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
VALUES(SEQ_BOARD_STR_NO.nextval, 1, '사이트 오픈했습니다.', '나중에 볼게요.', sysdate, sysdate);

INSERT INTO board
value(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
VALUES(SEQ_BOARD_STR_NO.nextval, 1, '1+1 이벤트 예정입니다.', '나중에 해볼게요.', sysdate, sysdate);

insert into board(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
select SEQ_BOARD_STR_NO.nextval, 2, level || '번째 영화는', '참 재미있었다.', sysdate, sysdate
from dual
connect by level <= 200;

INSERT INTO board
value(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
VALUES(SEQ_BOARD_STR_NO.nextval, 3, '저는 어메이징합니다', '팀장이기 때문이죠', sysdate, sysdate);

INSERT INTO board
value(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
VALUES(SEQ_BOARD_STR_NO.nextval, 4, '킹스맨', '매너가 사람을 만든다.', sysdate, sysdate);

INSERT INTO board
value(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
VALUES(SEQ_BOARD_STR_NO.nextval, 3, '죽은 시인의 사회', 'Oh captain, my captain', sysdate, sysdate);

INSERT INTO board
value(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
VALUES(SEQ_BOARD_STR_NO.nextval, 4, '데드풀2', 'KISS ME LIKE YOU MISS ME, RED', sysdate, sysdate);

INSERT INTO board
value(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
VALUES(SEQ_BOARD_STR_NO.nextval, 2, '캐리비안의 해적 블랙펄의 저주', '캡틴! 캡틴 잭 스페로우라고!', sysdate, sysdate);

INSERT INTO board
value(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
VALUES(SEQ_BOARD_STR_NO.nextval, 4, '타이타닉', 'I am king of the world!', sysdate, sysdate);

INSERT INTO board
value(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
VALUES(SEQ_BOARD_STR_NO.nextval, 3, '스파이더맨1', '큰 힘에는 큰 책임이 따른다', sysdate, sysdate);

INSERT INTO board
value(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
VALUES(SEQ_BOARD_STR_NO.nextval, 2, '아이언맨1', 'I am IronMan', sysdate, sysdate);

INSERT INTO board
value(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
VALUES(SEQ_BOARD_STR_NO.nextval, 2, '인피니티워', 'Bring me Thanos!!!!!!!!!!!!', sysdate, sysdate);

INSERT INTO board
value(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
VALUES(SEQ_BOARD_STR_NO.nextval, 3, '엔드게임', '어벤져스!!!!!! 어셈블.', sysdate, sysdate);

INSERT INTO board
value(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
VALUES(SEQ_BOARD_STR_NO.nextval, 4, '극한직업', '지금까지 이런 맛은 없었다. 이것은 갈비인가 통닭인가?', sysdate, sysdate);

INSERT INTO board
value(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
VALUES(SEQ_BOARD_STR_NO.nextval, 1, '대부', '거절 못할 제안을 하지', sysdate, sysdate);

INSERT INTO board
value(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
VALUES(SEQ_BOARD_STR_NO.nextval, 1, '로보캅1', '죽든 살든 넌 나와 함께 한다.', sysdate, sysdate);

INSERT INTO board
value(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
VALUES(SEQ_BOARD_STR_NO.nextval, 2, '터미네이터1', 'Stay Here, I will be back.', sysdate, sysdate);

INSERT INTO board
value(STR_NO, USER_NO, TITLE, STORY, CRE_DATE, MOD_DATE)
VALUES(SEQ_BOARD_STR_NO.nextval, 1, '터미네이터 : 다크페이트', 'I won’t be back', sysdate, sysdate);

commit;