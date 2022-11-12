--계정 테이블
create table member(
	id varchar2(10) constraint member_id_pk primary key,
	pwd varchar2(10),
	name varchar2(10)	
);

--영상 테이블
create table video(
	num number(10),
	category char(2),
	name varchar2(10),
	vidate timestamp not null default current_timestamp,
	title varchar2(20),
	text varchar2(30)
);

create sequence video_seq;

insert into video values(video_seq.nextval,'M','홍길동',default,'명상이란 무엇인가','명상에 대한 내용입니다');

--카테고리 테이블
create table video(
	id varchar2(10) constraint member_id_pk primary key,
	pwd varchar2(10),
	name varchar2(10)
);

--댓글 테이블
create table comment(
	id varchar2(10) constraint member_id_pk primary key,
	pwd varchar2(10),
	name varchar2(10)
);

select * from member;

insert into member values('d', 'd', '이름');

drop table member;