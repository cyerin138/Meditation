create table member(
	id varchar2(10) constraint member_id_pk primary key,
	pw varchar2(10),
	name varchar2(10)
);

select * from member;

insert into member values('d', 'd', '이름');

drop table member;