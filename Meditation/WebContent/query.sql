--계정 테이블
create table member(
	id varchar2(10) constraint member_id_pk primary key,
	pwd varchar2(10),
	name varchar2(10)	
);

--영상 테이블
create table video(
	vi_num number(10) constraint video_num_pk primary key,
	category char(1) constraint video_category_ck check( category in('M','F','P')),
	name varchar2(10),
	vi_date date default sysdate,
	title varchar2(20),
	text varchar2(30)
);

create sequence video_seq;

--댓글 테이블
create table vi_comment(
	vi_num number(10),
	name varchar2(10),
	co_date date default sysdate,
	text varchar2(30),
	constraint co_num_fk foreign key (vi_num) references video(vi_num)
);

--테스트

select * from vi_comment;

insert into video values(video_seq.nextval,'M','홍길동',default,'명상이란 무엇인가','명상에 대한 내용입니다');
insert into vi_comment values(2,'홍길동', default, '오 대박 멋진데');


insert into member values('d', 'd', '이름');

drop table comment;

drop sequence video_seq;