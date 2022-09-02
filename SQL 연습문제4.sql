#날짜 : 2022-09-02
#이름 : 강중현
#내용 : SQL 연습문제 4

#실습4-1
create database `java1_BookStore`;
create USER 'java1_admin4'@'%' identified by '1234';
grant all privileges on `java1_BookStore`.* to 'java1_admin4'@'%';
flush privileges;

#실습4-2
create table `Customer`(
	`custId`	int auto_increment primary key,
	`name`		varchar(10) not null,
	`address`	varchar(20) default null,
	`phone`		varchar(13) default null
);

create table `Book`(
	`bookId`		int primary key,
	`bookName`		varchar(20) not null,
	`publisher`		varchar(20) not null,
	`price`			int default null
);

create table `order`(
	`orderId`		int auto_increment primary key,
	`custId`		int not null,
	`bookId`		int not null,
	`salePrice`		int not null,
	`orderDate`		date not null
);

#실습4-3
insert into `Customer` values(1, '박지성', '영국 맨체스타', '000-5000-0001');
insert into `Customer` values(2, '김연아', '대한민국 서울', '000-6000-0001');
insert into `Customer` values(3, '장미란', '대한민국 강원도', '000-7000-0001');
insert into `Customer` values(4, '추신수', '미국 클리블랜드', '000-8000-0001');
insert into `Customer`(`custid`, `name`, `address`) values(5, '박세리', '대한민국 대전');

insert into `Book` values(1, '축구의 역사', '굿스포츠', 7000);
insert into `Book` values(2, '축구아는 여자', '나무수', 13000);
insert into `Book` values(3, '축구의 이해', '대한미디어', 22000);
insert into `Book` values(4, '골프 바이블', '대한미디어', 35000);
insert into `Book` values(5, '피겨 교본', '굿스포츠', 8000);
insert into `Book` values(6, '역도 단계별기술', '굿스포츠', 6000);
insert into `Book` values(7, '야구의 추억', '이상미디어', 20000);
insert into `Book` values(8, '야구를 부탁해', '이상미디어', 13000);
insert into `Book` values(9, '올림픽 이야기', '삼성당', 7500);
insert into `Book` values(10, 'Olympic Champions', 'Pearson', 13000);

insert `Order` values(1, 1, 1, 6000, '2014-07-01');
insert `Order` values(2, 1, 3, 21000, '2014-07-03');
insert `Order` values(3, 2, 5, 8000, '2014-07-03');
insert `Order` values(4, 3, 6, 6000, '2014-07-04');
insert `Order` values(5, 4, 7, 20000, '2014-07-05');
insert `Order` values(6, 1, 2, 12000, '2014-07-07');
insert `Order` values(7, 4, 8, 13000, '2014-07-07');
insert `Order` values(8, 3, 10, 12000, '2014-07-08');
insert `Order` values(9, 2, 10, 7000, '2014-07-09');
insert `Order` values(10, 3, 8, 13000, '2014-07-10');

#실습4-4
select `custid`, `name`, `address` from `Customer`;

#실습4-5
select `bookname`, `price` from `Book`;

#실습4-6
select `price`, `bookname` from `book`;

#실습4-7
select * from `Book`;

#실습4-8
select `publisher` from `Book`;

#실습4-9
select distinct `publisher` from `book`;

#실습4-10
select * from `Book` where `price` >= 20000;

#실습4-11
select * from `book` where `price` < 20000;

#실습4-12
select * from `book` where `price` >= 10000 and `price` <= 20000;

#실습4-13
select `bookid`, `bookname`, `price` from `book` where `price` >= 15000 and `price` <= 30000;

#실습4-14
select * from `Book` where `bookid` in(2, 3, 5);

#실습4-15
select * from `book` where `bookid` % 2 = 0;

#실습4-16
select * from `Customer` where `name` like '박%';

#실습4-17
select * from `Customer` where `address` like '대한민국 %';

#실습4-18
select * from `Customer` where `phone` is not null;

#실습4-19
select * from `Book` where `publisher` = '굿스포츠' or `publisher` = '대한미디어';

#실습4-20
select `publisher` from `Book` where `bookname` = '축구의 역사';

#실습4-21
select `publisher` from `Book` where `bookname` like '%축구%';

#실습4-22
select * from `Book` where `bookname` like '_구%';

#실습4-23
select * from `Book` where `price` >= 20000 and `bookname` like '축구%';

#실습4-24
select * from `Book` order by `bookname` asc;

#실습4-25
select * from `Book` group by `price`, `bookname`
order by `price` asc, `bookname` desc;

#실습4-26
select * from `Book` group by `price`, `publisher` order by `price` desc, `publisher` asc;

#실습4-27
select * from `Book` order by `price` desc limit 3;

#실습4-28
select * from `Book` order by `price` asc limit 3;

#실습4-29
select sum(`saleprice`) AS '총판매액' from `order`;

#실습4-30


#실습4-31


#실습4-32


#실습4-33


#실습4-34


#실습4-35


#실습4-36


#실습4-37


#실습4-38


#실습4-39


#실습4-40


#실습4-41


#실습4-42


#실습4-43


#실습4-44


#실습4-45


#실습4-46
















