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
	name varchar2(12),
	vi_date date default sysdate,
	title varchar2(100),
	text varchar2(150),
	video_url varchar2(150),
	img_url varchar2(150)
);

create sequence video_seq;

insert into video values(video_seq.nextval,'M','에일린',default,'5분 호흡명상  뇌를 위한 최고의 휴식법 스트레스 해소 뇌 피로회복','스트레스로 지친 뇌를 잠시 쉬게 하고 머리를 맑게 하는 5분 명상 가이드입니다.', 'video1.mp4', 'image1.png');
insert into video values(video_seq.nextval,'M','에일린',default,'10분명상  당신의 삶에 명상이 필요할 때','명상이 필요할 때 가볍게 듣기 좋은 10분 명상 가이드입니다.', 'video2.mp4', 'image2.png');
insert into video values(video_seq.nextval,'M','채환TV',default,'10분명상가이드 마음을 쉬는 법 마음을 비우는 명상',' 참 쉬운 10분 명상 가이드 초보자도 쉽게 배우는 명상기본자세 호흡법 생각지켜보기 집에서 함께 해보세요', 'video3.mp4', 'image3.png');
insert into video values(video_seq.nextval,'M','숨쉬는고래',default,'나를 응원해주는 아침명상ㅣ 어렵지 않은 명상의 시작','아침부터 부스스한 눈으로 아침명상으로 검색해서 들어오셨을 여러분. 하루를 시작하는 자신을 위해 선물하세요', 'video4.mp4', 'image4.png');
insert into video values(video_seq.nextval,'M','에일린',default,'7분 긍정확언 - 나는 결국 잘될 것이다 (아침 확언 명상)','내 안의 부정적인 생각을 정화하고 긍정의 에너지로 가득 채우는 확언 명상입니다.', 'video5.mp4', 'image5.png');

insert into video values(video_seq.nextval,'P','설기문',default,'혼자하는 전생체험 최면','저는 최면에서 떠올린 전생기억이나 전생경험이 사실이라고 주장하지 않습니다.', 'video6.mp4', 'image6.png');
insert into video values(video_seq.nextval,'P','최현우',default,'[ 최면 / 전생 체험 ] 나는 전생에 어떤 인생을 살았을까? 전생으로 떠나는 최면','이번엔 좀 더 깊은 최면입니다 편안한 장소에서 앉으셔도 좋고, 누우셔도 좋습니다', 'video7.mp4', 'image7.png');
insert into video values(video_seq.nextval,'P','호랑',default,'최면을 통한 전생체험 가게 ㅣ 상황극 ASMRㅣ Experience Previous Life','이번 영상은 제가 진짜 해보고 싶었던 영상인데요, 최면을 통한 전생체험 롤플 ASMR 입니다.', 'video8.mp4', 'image8.png');
insert into video values(video_seq.nextval,'P','혜바라기현',default,'ASMR 전생체험 해볼래요? exogenous experience roleplay','전생체험 해보셨어요?! 저는 딱1번 해봤는데 그때의 기억을 더듬어 각색해보았습니다👱‍♀️ 재밌네요~ 잠도 오고ㅎㅎ', 'video9.mp4', 'image9.png');
insert into video values(video_seq.nextval,'P','I SB',default,'전생체험 영상','이전에 올리시던 분이 삭제하셔서 공유합니다', 'video10.mp4', 'image10.png');

insert into video values(video_seq.nextval,'F','몸마음주파수',default,'장 운동을 돕는 허브 추출 주파수 음악 ㅣ변비ㅣ쾌변ㅣ다이어트','변비 증상을 완화하고 쾌변을 유도하는 약재 추출 주파수 음악입니다.', 'video11.mp4', 'image11.png');
insert into video values(video_seq.nextval,'F','타타타로',default,'애인이 생기게 해주는 영상 [사랑을 강력하게 끌어오기]','나의 사랑의 상대를 끌어오는 소리입니다. 자기 전에 들어보세요. 꼭 크게 안들으셔도 됩니다.', 'video12.mp4', 'image12.png');
insert into video values(video_seq.nextval,'F','몸마음주파수',default,'뇌건강 시리즈#1 트레온산 마그네슘 추출 주파수 음악','마그네슘은 체내에서 300가지 이상의 생화학적 반응에 필수적이며, 신경계와 뇌에 중요한 역할을 합니다.', 'video13.mp4', 'image13.png');
insert into video values(video_seq.nextval,'F','에너지주파수',default,'이 영상이 당신에게 뜨면 좋은징조에요 엔젤주파수Attract Love Subliminal','오늘은 영감이 너무 좋았어요!좋은 느낌과 기운은 저만 가지고 있을 순 없죠! 함께하고 싶습니다!', 'video14.mp4', 'image14.png');
insert into video values(video_seq.nextval,'F','비타민주파수',default,'똥 잘나오는 주파수/ 허브 추출 쾌변 주파수 ㅣ변비완화ㅣ다이어트ㅣ쾌변유도','안녕하세요? 비타민주파수입니다^^ 본인에 맞게 음을 조절하세요.', 'video15.mp4', 'image15.png');

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
delete from video where category = 'F';
delete from vi_comment;
delete from main_comment;

drop table video;
drop table vi_comment;
drop table main_comment;
drop sequence video_seq;