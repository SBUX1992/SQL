#날짜 : 2022-09-01
#이름 : 강중현
#내용 : SQL 연습문제3

#실습 3-1
create database `java1_College`;
create USER 'java1_admin3'@'%' IDENTIFIED by '1234';
grant all privileges on java1_College.* to 'java1_admin3'@'%';
flush privileges;

#실습3-2
create table `Student`(
	`stdNo`			varchar(8) primary key,
    `stdName`		varchar(20) not null,
    `stdHp`			varchar(13) not null,
    `stdYear`		int not null,
    `stdAddress`	varchar(100) default null
);

create table `Lecture` (
	`lecNo`			int primary key,
    `lecName`		varchar(20) not null,
    `lecCredit`		int not null,
    `lecTime`		int not null,
    `lecClass`		varchar(10) default null
);

create table `Register` (
	`regStdNo`			varchar(8) not null,
    `regLecNo`			int not null,
    `regMidScore`		int default null,
    `regFinalScore`		int default null,
    `regTotalScore`		int default null,
    `regGrade`			varchar(1) default null
);

#실습3-3
insert into `Student` (`stdNo`, `stdName`, `stdHp`, `stdYear`) values(20201016, '김유신', '010-1234-1001', 3);
insert into `Student` values(20201126, '김춘추', '010-1234-1002', 3, '경상남도 경주시');
insert into `Student` values(20210216, '장보고', '010-1234-1003', 2, '전라남도 완도시');
insert into `Student` values(20210326, '강감찬', '010-1234-1004', 2, '서울시 영등포구');
insert into `Student` values(20220416, '이순신', '010-1234-1005', 1, '부산시 부산진구');
insert into `Student` values(20220521, '송상현', '010-1234-1006', 1, '부산시 동래구');

insert into `Lecture` values(159, '인지행동심리학', 3, 40, '본304');
insert into `Lecture` values(167, '운영체제론', 3, 25, '본805');
insert into `Lecture` values(234, '중급 영문법', 3, 20, '본201');
insert into `Lecture` values(239, '세법개론', 3, 40, '본204');
insert into `Lecture` values(248, '빅데이터 개론', 3, 20, '본801');
insert into `Lecture` values(253, '컴퓨팅사고와 코딩', 2, 10, '본802');
insert into `Lecture` values(349, '사회복지 마케팅', 2, 50, '본301');

insert into `Register` (`regStdNo`, `regLecNo`) values(20201126, 234);
insert into `Register` (`regStdNo`, `regLecNo`) values(20201016, 248);
insert into `Register` (`regStdNo`, `regLecNo`) values(20201016, 253);
insert into `Register` (`regStdNo`, `regLecNo`) values(20201126, 239);
insert into `Register` (`regStdNo`, `regLecNo`) values(20210216, 349);
insert into `Register` (`regStdNo`, `regLecNo`) values(20210326, 349);
insert into `Register` (`regStdNo`, `regLecNo`) values(20201016, 167);
insert into `Register` (`regStdNo`, `regLecNo`) values(20220416, 349);

#실습3-4
select * from `Lecture`;

#실습3-5
select * from `Student`;

#실습3-6
select * from `Register`;

#실습3-7
select * from `Student` where `stdYear` = 3;

#실습3-8
select * from `Lecture` where `lecCredit` = 2;

#실습3-9
update `register` set `regMidScore` = 36, `regFinalScore`= 42 where 
`regStdNo`='20201126' and `regLecNo`=234;
update `register` set `regMidScore` = 24, `regFinalScore`= 62 WHERE 
`regStdNo`='20201016' AND `regLecNo`=248;
update `register` set `regMidScore` = 28, `regFinalScore`= 40 WHERE 
`regStdNo`='20201016' AND `regLecNo`=253;
update `register` set `regMidScore` = 37, `regFinalScore`= 57 WHERE 
`regStdNo`='20201126' AND `regLecNo`=239;
update `register` set `regMidScore` = 28, `regFinalScore`= 68 WHERE 
`regStdNo`='20210216' AND `regLecNo`=349;
 update `register` set `regMidScore` = 16, `regFinalScore`= 65 WHERE 
`regStdNo`='20210326' AND `regLecNo`=349;
 update `register` set `regMidScore` = 18, `regFinalScore`= 38 WHERE 
`regStdNo`='20201016' AND `regLecNo`=167;
 update `register` set `regMidScore` = 25, `regFinalScore`= 58 WHERE 
`regStdNo`='20220416' AND `regLecNo`=349;
select * from `register`;

#실습3-10
update `register` set `regTotalScore`= `regMidScore` + `regFinalScore`, `regGrade` =
if(`regTotalScore` >= 90, 'A', 
 if(`regTotalScore` >= 80, 'B',
 if(`regTotalScore` >= 70, 'C',
 if(`regTotalScore` >= 60, 'D', 'F'))));

#실습3-11
select * from `register` order by `regGrade` asc;

#실습3-12
select * from `register` where `regLecNo` = '349' order by `regTotalScore` desc;

#실습3-13
select * from `Lecture` where `lecTime` > '30';

#실습3-14
select `lecName`, `lecClass` from `Lecture`;

#실습3-15
select `stdNo`, `stdName` from `Student`;

#실습3-16
select * from `Student` where `stdAddress` is null;

#실습3-17
select * from `Student` where `stdAddress` like '부산시 %';

#실습3-18
select * from `Student` as a left join `Register` as b on a.stdNo = b.regStdNo;

#실습3-19
select 
	`stdNo`,
    `stdName`,
    `regLecno`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `Student` as a, `Register` as b where a.stdNo = b.regStdNo;

#실습3-20
select `stdName`, `stdNo`, `regLecNo`
from `Student` AS a
join `Register` AS b
on a.stdNo = b.regStdNo
where `regLecNo` = 349;

#실습3-21
select
	`stdNo`,
    `stdName`,
    count(`stdNo`) AS `수강신청 건수`,
	sum(`regTotalScore`) AS `종합점수`,
    sum(`regTotalScore`) / count(`stdNo`) AS `평균`
from `Student` AS a
join `Register` AS b
on a.stdNo = b.regStdNo
group by `stdNo`;

#실습3-22
select * from `Register` AS a
join `Lecture` AS b
on a.regLecNo = b.lecNo;

#실습3-23
select 
	`regStdNo`,
	`regLecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
from `Lecture` AS a
join `Register` AS b
on a.lecNo = b.regLecNo;

#실습3-24
select 
	count(*) AS `사회복지 마케팅 수강 신청건수`,
	avg(`regTotalScore`) AS `사회복지 마케팅 평균`
from `Register` AS a join `Lecture` AS b
on a.regLecNo = b.lecNo
where `lecName` = '사회복지 마케팅';

#실습3-25
select 
	`regStdNo`,
    `lecName`
from `Register` AS a 
join `Lecture` AS b
on a.regLecNo = b.lecNo
where `regGrade` = 'A';

#실습3-26
select * from `Student` AS a
join `Register` AS b on a.stdNo = b.regStdNo
join `Lecture` AS c on b.regLecNo = c.lecNo;

#실습3-27
select  
	`stdNo`,
	`stdName`,
	`lecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
from `Student` AS a
join `Register` AS b on a.stdNo = b.regStdNo
join `Lecture` AS c on b.regLecNo = c.lecNo
order by `regGrade`;

#실습3-28
SELECT
	`stdNo`,
	`stdName`,
	`lecName`,
	`regTotalScore`,
	`regGrade`
FROM `Student` AS a
join `Register` AS b on a.stdNo = b.regStdNo
join `Lecture` AS c on b.regLecNo = c.lecNo
where `regGrade` = 'F';

#실습3-29
select 
	`stdNo`,
	`stdName`,
	SUM(`lecCredit`) AS `이수학점`
FROM `Student` AS a
join `Register` AS b on a.stdNo = b.regStdNo
join `Lecture` AS c on b.regLecNo = c.lecNo
where `regTotalScore` >= '60'
group by `stdNo`;

#실습3-30
SELECT 
	`stdNo`,
	`stdName`,
	GROUP_CONCAT(`lecName`) AS `신청과목`,
	GROUP_CONCAT(if(`regTotalScore` >= 60, `lecName`, null)) AS `이수과목`
FROM `Student` AS a
JOIN `Register` AS b ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c ON b.regLecNo = c.lecNo
GROUP BY `stdNo`;










