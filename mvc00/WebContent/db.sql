create table member(
	userid varchar2(20), 
	username varchar2(20),
	primary key (userid)

);


insert into member values('admin', '관리자');
insert into member values('user1', '금나라');
insert into member values('user2', '은나라');
insert into member values('user3', '동나라');
