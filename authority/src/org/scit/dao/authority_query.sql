--회원정보 테이블(테이블 명:seschool)
CREATE TABLE seschool(
	userid varchar2(30) primary key, --회원아이디
	userpassword varchar2(30) not null, --비밀번호
	username varchar2(50) not null, --이름
	sex varchar2(20) not null, --성별
	email varchar2(100) not null, --이메일
	birth date not null, --생년월일
	phone varchar2(100) not null, -- 전화번호
	authority varchar(1) default '0' not null --승인여부
)

--임의 데이터 입력

INSERT INTO seschool VALUES('admin', 'admin', '관리자', '남', 'admin@aaa.com', '1988-10-02', '010-9963-8299', '0') --관리자

INSERT INTO seschool VALUES('a1', 'a1', '메이', '여', 'mei@aaa.com', '2012-09-12', '010-8000-7111', '0')
INSERT INTO seschool VALUES('a2', 'a2', '폴', '남', 'paul@aaa.com', '2006-09-12', '010-8000-7123', '0')
INSERT INTO seschool VALUES('a3', 'a3', '크리스', '남', 'chris@aaa.com', '2002-09-12', '010-9200-3131', '0')
INSERT INTO seschool VALUES('a4', 'a4', '크리스티나', '여', 'christina@aaa.com', '1998-09-12', '010-2430-8451', '0')
INSERT INTO seschool VALUES('a5', 'a5', '존', '남', 'john@aaa.com', '1989-09-12', '010-8364-2454', '0')
INSERT INTO seschool VALUES('a6', 'a6', '제니퍼', '여', 'jennifer@aaa.com', '1992-09-12', '010-2452-7567', '0')
INSERT INTO seschool VALUES('a7', 'a7', '첼시', '여', 'chelsea@aaa.com', '1988-09-12', '010-2452-3632', '0')
