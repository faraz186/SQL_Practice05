create database Practice

create table child(
S_Id             int primary key,
S_name           varchar(50),
S_age            int,
S_city           int,
S_gender         varchar(10),
S_courses        int,
foreign key(S_city) references city(cid),
foreign key(S_courses) REFERENCES courses(crid)
);



insert into child(S_Id,S_name,S_age,S_gender,S_city,S_courses)
values
(1,'Mohammad Faraz',19,'Male',1,2),
(2,'Adeel Ahmed',21,'Male',2,4),
(3,'Irfan Khan',24,'Male',2,5),
(4,'Marium Khan',20,'Female',5,5),
(5,'Kashif Iqbal',35,'Male',4,5),
(6,'Luqman Rashid',28,'Male',3,1),
(7,'Fizza khan',26,'Female',4,3),
(8,'Fazeel Ahmed',33,'Male',3,3),
(9,'Asif Raza',25,'Male',5,1);


select * from child


create table city(
cid             int primary key,
city_name       varchar(50)
);



insert into city(cid,city_name)
values
(1,'Karachi'),
(2,'Lahore'),
(3,'Quetta'),
(4,'Islamabad'),
(5,'Kashmir');


select * from city
 

create table courses(
crid              int primary key,
course_name       varchar(50)
);


insert into courses(crid,course_name)
values
(1,'Data Structure and Algorithms'),
(2,'Discrete Sturcture'),
(3,'Database Systems'),
(4,'Data Analysis'),
(5,'Differential Equations');


select * from courses


Select * from Student inner join city
on Student.S_city = city.cid



Select * from Student s inner join city c
on s.S_city = c.cid



Select s.S_Id,s.S_name,s.S_age,s.S_gender,c.city_name
from Student s inner join city c
on s.S_city = c.cid



Select s.S_Id,s.S_name,s.S_age,s.S_gender,c.city_name
from Student s inner join city c
on s.S_city = c.cid
order by s.S_name



Select s.S_Id,s.S_name,s.S_age,s.S_gender,c.city_name
from Student s inner join city c
on s.S_city = c.cid
where c.city_name = 'Kashmir'
order by s.S_name



Select s.S_Id,s.S_name,s.S_age,s.S_gender,c.city_name
from Student s join city c
on s.S_city = c.cid
where c.city_name != 'Islamabad'
order by s.S_name ASC




Select * from Student s left join city c
on s.S_city = c.cid



Select s.S_Id,s.S_name,s.S_age,s.S_gender,c.city_name
from Student s left join city c
on s.S_city = c.cid
where s.S_gender = 'Male'
order by s.S_name,s.S_Id DESC



Select s.S_Id,s.S_name,s.S_age,s.S_gender,c.city_name
from Student s right join city c
on s.S_city = c.cid
order by s.S_name




Select s.S_Id,s.S_name,s.S_age,s.S_gender,c.city_name
from Student s right join city c
on s.S_city = c.cid
where s.S_gender = 'Male'
order by s.S_name,s.S_Id DESC



Select * from Student s cross join city c


Select s.S_Id,s.S_name,s.S_city,c.city_name 
from Student s cross join city c



Select s.S_Id,s.S_name,s.S_city,c.city_name 
from Student s , city c



Select * from Student s INNER JOIN city c
on s.S_city = c.cid
INNER JOIN courses cr
on s.S_courses = cr.crid



Select s.S_Id,s.S_name,s.S_age,c.city_name,cr.course_name 
from Student s INNER JOIN city c
on s.S_city = c.cid
INNER JOIN courses cr
on s.S_courses = cr.crid



Select s.S_Id,s.S_name,s.S_age,c.city_name,cr.course_name 
from Student s INNER JOIN city c
on s.S_city = c.cid
INNER JOIN courses cr
on s.S_courses = cr.crid


create table Stude(
id            int primary key,
name          varchar(50),
age           int,
city          int,
FOREIGN KEY(city) REFERENCES city(cid)
);


insert into Stude(id,name,age,city)
values
(12,'Mohammad Faraz',22,4),
(22,'Saqib Anwer',25,2),
(32,'Sultan Kashif',29,6),
(42,'Shabbir Basit',33,10),
(52,'Atif Aslam',21,10);


select * from Stude


create table citi(
cid            int primary key,
city_name      varchar(50)
);

insert into citi(cid,city_name)
values
(2,'Islamabad'),
(4,'Karachi'),
(6,'Karachi'),
(8,'Quetta'),
(10,'Lahore');


select * from citi


select citi.city_name,count(citi.city_name)
from citi
GROUP BY city_name



select c.city_name,count(c.city_name) as Total
from Stude s INNER JOIN citi c
on s.city= c.cid
GROUP BY city_name



select c.city_name,count(c.city_name) as Total
from Stude s INNER JOIN citi c
on s.city= c.cid
where s.age >25
GROUP BY city_name



select c.city_name,count(c.city_name) as Total
from Stude s INNER JOIN citi c
on s.city= c.cid
GROUP BY city_name
order by count(c.city_name)



select c.city_name,count(c.city_name) as Total
from Stude s INNER JOIN citi c
on s.city= c.cid
GROUP BY city_name
having count(c.city_name) >1
order by count(c.city_name)



select child.S_name from child
WHERE child.S_courses= (SELECT courses.crid from courses WHERE courses.course_name = 'Database Systems')




select child.S_name from child
WHERE EXISTS(SELECT courses.crid from courses WHERE courses.course_name IN ('mATHS'))




select child.S_name from child
WHERE NOT EXISTS (SELECT courses.crid from courses WHERE courses.course_name = 'Database Systems')