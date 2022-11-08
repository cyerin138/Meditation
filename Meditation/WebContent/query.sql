--계정 테이블
create table member(
	id varchar2(10) constraint member_id_pk primary key,
	pwd varchar2(10),
	name varchar2(10)
);

--영상 테이블
create table video(
	id varchar2(10) constraint member_id_pk primary key,
	pwd varchar2(10),
	name varchar2(10)
);

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