drop table lib_member;
create table lib_member(
	member_id varchar2(20) constraint member_id_pk primary key,
	member_pwd varchar2(20),
	member_name varchar2(20),
	member_addr varchar2(50),
	member_age number(3)
);

insert into lib_member(member_id, member_pwd, member_name, member_addr, member_age) values('test', '1234', 'yangyoung', '경기도 성남시 서현동', 18);
insert into lib_member(member_id, member_pwd, member_name, member_addr, member_age) values('test2', '5678', '양영2', '경기도 성남시 서현동', 17);
insert into lib_member(member_id, member_pwd, member_name, member_addr, member_age) values('candy', 'candy1234', '캔디', '경기도 성남시 불정로 386번길', 20);
insert into lib_member(member_id, member_pwd, member_name, member_addr, member_age) values('admin', 'admin1234', '관리자', '양영 도서관', 50);


select * frim lib_member order by member_id asc;


drop table lib_book;


create table lib_book(
	book_no number(6) constraint book_no_pk primary key,
	title varchar2(40),
	author varchar2(20), 
	company varchar2(50),
	price number(6),
	rentaled char(1)

);


drop sequence book_seq;
create sequence book_seq;

insert into lib_book(book_no, title, author , company, price, rentaled) values(book_seq.nextval, '모모', '미하엘 엔데', '비룡소', 11000 , 'f');
insert into lib_book(book_no, title, author , company, price, rentaled) values(book_seq.nextval, '장미의 이름', '움베르토 에코', '열린택들', 25000 , 'f');
insert into lib_book(book_no, title, author , company, price, rentaled) values(book_seq.nextval, '수레바퀴 밑에서', '헤르만 헤세', '어문각', 10000 , 'f');
insert into lib_book(book_no, title, author , company, price, rentaled) values(book_seq.nextval, '모리와 함께한 화요일', '미치 엘봄', '살림', 11000 , 'f');
insert into lib_book(book_no, title, author , company, price, rentaled) values(book_seq.nextval, '연금술사', '파울로 코엘료', '문학동네', 9500 , 'f');
insert into lib_book(book_no, title, author , company, price, rentaled) values(book_seq.nextval, '앵무새 죽이기', '하퍼 리', '열린책들', 13000 , 'f');
insert into lib_book(book_no, title, author , company, price, rentaled) values(book_seq.nextval, '작은 아씨들', '루이자 메이', '월북', 15000 , 'f');
insert into lib_book(book_no, title, author , company, price, rentaled) values(book_seq.nextval, '라틴어 수업', '한동일', '흐름출판', 15000 , 'f');
insert into lib_book(book_no, title, author , company, price, rentaled) values(book_seq.nextval, '좁은문', '앙드레 지드', '열린책들', 10800 , 'f');
insert into lib_book(book_no, title, author , company, price, rentaled) values(book_seq.nextval, '페르마의 마지막 정리', '사이먼 싱', '경문사', 10000 , 'f');


select * from lib_book order by book_no asc;
select * from lib_book where title like '%장미%';

drop table rent_book;
drop sequence rent_seq;

create sequence rent_seq;

create table rent_book(
	rent_no number(6) primary key,
	member_id varchar2(20),
	book_no number(6),
	member_name varchar2(20),
	title varchar2(40)

);



insert into rent_book(rent_no, member_id, book_no , member_name, title) values (rent_seq.nextval, 'candy', '1', '캔디', '모모');
select * from rent_book order by rent_no asc;







