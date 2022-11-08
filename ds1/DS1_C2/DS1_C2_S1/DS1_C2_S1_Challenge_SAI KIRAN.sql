create database stylexcarz_db;
use stylexcarz_db;
create table salespersons
(
salespersonid int primary key,
salesperson_name varchar(30),
salesperson_city varchar(30),
commission_rate int
);

create table customers
(
customerid int primary key,
c_firstname varchar(30),
c_lastname varchar(30),
c_city varchar(30),
c_rating int
);

create table orders
(
orderid int primary key,
amount int,
orderdate date,
salespersonid int,
customerid int
);

alter table salespersons add foreign key (salespersonid) references orders (salespersonid);
alter table orders add foreign key (salespersonid) references salespersons (salespersonid);
alter table orders add foreign key (customerid) references customers (customerid);

alter table salespersons modify salesperson_name varchar(30) not null;
alter table salespersons modify salesperson_city varchar(30) not null;
alter table salespersons modify commission_rate int not null;

alter table customers modify c_firstname varchar(30) not null;
alter table customers modify c_lastname varchar(30) not null;
alter table customers modify salesperson_city varchar(30) not null;
alter table customers modify c_rating int not null;

alter table orders modify amount int not null;
alter table orders modify orderdate date not null;
alter table orders modify salespersonid int not null;
alter table orders modify customerid int not null;

alter table orders modify orderdate varchar(12) not null;

desc salespersons;

insert into salespersons values(1001,'William','London','12');
insert into salespersons values(1002,'Liam','San Jose','13');
insert into salespersons values(1003,'Axelrod','New York','10');
insert into salespersons values(1004,'James','London','11');
insert into salespersons values(1005,'Fran','London','26');
insert into salespersons values(1007,'Oliver','Barcelona','15');
insert into salespersons values(1008,'John','London','0');
insert into salespersons values(1009,'Charles','Florida','0');



insert into orders values(3001,123,'2021-02-01​',1009,2007);
insert into orders values(3002,100,'2021-07-30​',1001,2007);
insert into orders values(3003,187,'2021-10-02​',1001,2001);
insert into orders values(3005,201,'2021-10-09​',1003,2003);
insert into orders values(3007,167,'2021-04-02​',1004,2002);
insert into orders values(3008,189,'2021-03-06​',1002,2002);
insert into orders values(3009,145,'2021-10-10​',1009,2005);
insert into orders values(3010,200,'2021-02-23​',1007,2007);
insert into orders values(3011,100,'2021-09-18​',1001,2004);

select* from salespersons;

update salespersons set commission_rate = 15 where salespersonid=1001;
update salespersons set commission_rate = 15 where salespersonid=1002;
update salespersons set commission_rate = 15 where salespersonid=1003;
update salespersons set commission_rate = 15 where salespersonid=1004;
update salespersons set commission_rate = 15 where salespersonid=1008;
update salespersons set commission_rate = 15 where salespersonid=1009;

create table orders_bkp like orders;
insert orders_bkp select* from orders;

create table orders_placed_history like orders;
insert orders_placed_history select* from orders;

delete from orders where orderid=3005;
delete from orders where orderid=3006;

delete from orders_placed_history where orderid=3005;
delete from orders_placed_history where orderid=3006;

update customers set c_rating = 350 where customerid=2007;
