create table bookshop(
	isbn varchar(15) primary key not null,
	title varchar2(50) not null,
	author varchar2(20) not null,
	company varchar2(50),
	price number
);

insert into bookshop values('88-90-11','오라클 3일 완성', '이오라', '야메루출판사', 15000);
insert into bookshop values('90-10-12','jsp 달인되기', '송jp', '공갈닷컴', 20000);
insert into bookshop values('87-90-33','자바무따기', '김자바', '디지털박스', 35000);

select * from bookshop;
select * from bookshop order by isbn;