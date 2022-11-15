--계정 테이블
create table member(
	id varchar2(10) constraint member_id_pk primary key,
	pwd varchar2(10),
	name varchar2(10)	
);

--영상 테이블
create table video(
	vi_num number(10) constraint video_num_pk primary key,
	category varchar2(1) constraint video_category_ck check( category in('M','F','P')),
	name varchar2(10),
	vi_date date default sysdate,
	title varchar2(20),
	text varchar2(30),
	video_url varchar2(150),
	img_url varchar2(150)
);
insert into video values(video_seq.nextval,'M','홍길동',default,'명상 이 무엇인가','에 대한 내용입니다', 'url', 'url');

create sequence video_seq;

--댓글 테이블
create table vi_comment(
	vi_num number(10),
	name varchar2(10),
	co_date date default sysdate,
	text varchar2(100),
	constraint co_num_fk foreign key (vi_num) references video(vi_num)
);

-- 메인 댓글 테이블
create table main_comment(
	category varchar2(1) constraint main_category_ck check( category in('M','F','P')),
	name varchar2(10),
	co_date date default sysdate,
	text varchar2(100)
);


--테스트


select * from video;
select * from vi_comment;
select * from main_comment;

select * from video where category = 'M' order by vi_date desc;
select * from video where (title like '%명상%' or text like '%명상%') order by vi_date desc;
select * from (select * from video order by vi_date desc) where rownum <= 4;

insert into video values(video_seq.nextval,'M','홍길동',default,'명상 이 무엇인가','에 대한 내용입니다', 'url', 'url');
insert into vi_comment values(2,'홍길동', default, '오 대박 멋진데');


insert into member values('d', 'd', '이름');


delete from video;
delete from vi_comment;

drop table video;
drop table vi_comment;
drop table main_comment;
drop sequence video_seq;