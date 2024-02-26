--Loome db (andmebaasi)
create database TARge23SQL

-- db valimine
use TARge23SQL

-- db kustutamine
drop database TARge23SQL

-- tabeli loomine
create table Gender
(
Id int not null primary key,
Gender nvarchar(10) not null
)


-- andmete sisestamine
insert into Gender (Id, Gender)
Values (1, 'Male'),
(2, 'Female'),
(3, 'Unknown')

-- vaatame tabeli sisu
select * from Gender

-- loome uue tabeli
create table Person 
(
Id int not null primary key,
Name nvarchar(30),
Email nvarchar(30),
GenderId int
)
-- andmete sisestamine
insert into Person (Id, Name, Email, GenderId) values
(1, 'Superman', 's@s.com', 1),
(2, 'Wonderwoman', 'w@w.com', 2),
(3, 'Batman', 'b@b.com', 1),
(4, 'Aquaman', 'a@a.com', 1),
(5, 'Catwoman', 'c@c.com', 2),
(6, 'Antman', 'ant"ant.com', 1),
(7, NULL, NULL, 3)

-- vaadake Person tabeli andmeid
select * from Person

-- v��rv�tme �henduse loomine kahe tabeli vahel
alter table Person Add constraint tblPerson_GenderId_FK
foreign key (GenderId) references Gender(Id)

-- Kui sisestad uue rea andmeid ja ei ole sisestanud GenderId-d
-- alla v��rtust, siis see automaatselt sisestab sellele reale
-- v��rtuse 3 e unknown
alter table Person
add constraint DF_persons_GenderId
default 3 for GenderId

-- Sisestame andmed
-- 
insert into Person (Id, Name, Email)
values (9, 'Ironman', 'i@i.com')

select * from Person

-- Lisame uue veeru 
alter table Person
add Age nvarchar(10)

-- Lisame numbri piirangu vause sisestamisel
alter table Person
add constraint CK_Person_Age check (Age > 0 and Age < 155)

-- Sisestame uue rea andmeid
insert into Person (Id, Name, Email, GenderId, Age)
values (10, 'Kalevipoeg', 'k@k.com', 1, 30)

-- Muudame koodiga andmeid
update Person
set Age = 35
where Id = 9

select * from Person

-- Sisestame muutuja City nvarchar(50)
alter table Person
add City nvarchar(50)

-- Sisestame City veergu andmeid
update Person
set City = 'Kaljuvald'
where Id = 10

select * from Person

-- K�ik, kes elavad Gothami linnas
select * from Person where City = 'Gotham'
-- K�ik, kes ei ela Gothamis
select * from Person where City <> 'Gotham'
-- K�ik, kes ei ela Gothamis
select * from Person where City != 'Gotham'

-- N�itab teatud vanusega inimesi
select * from Person where Age = 120 or Age = 50 or Age = 19
select * from Person where Age in (120, 50, 19)

-- N�itab teatud vanusevahemikus olevaid inimesi
-- ka 22 ja 31 aastaseid
select * from Person where Age between 25 and 31

-- Wildcard e n�itab k�ik n-t�hega algavad linnad
select * from Person where City like 'n%'
-- K�ik emailid, kus on @-m�rk sees
select * from Person where Email like '%@%'

-- N�itab Emaile, kus ei ole @-m�rki sees
select * from Person where Email not like '%@%'

-- N�itab , kellel on emailis ees ja peale @- m�rki ainult �ks t�ht
select * from Person where Email like '_@_.com'

update Person
set Email = 'bat@bat.com'
where Id = 3

-- K�ik, kellel nimes ei ole esimene t�ht W, A, C
select * from Person where Name like '[^WAC]%'
select * from Person

-- Kes elavad Gothamis ja New York-s
select * from Person where (City = 'Gotham' or City = 'New York')

-- K�ik, kes elavad v�lja toodud linnades ja on vanemad kui 29
select * from Person where (City = 'Gotham' or City = 'New York')
and Age >= 30

-- Kuvab t�hestikulises j�rjekorras inimesi ja v�tab aluseks nime
select * from Person order by Name
-- Kuvab vastupidises j�rjestuses
select * from Person order by Name desc

-- V�tab kolm esimest rida
select top 3 * from Person

-- Kolm esimest, aga tabeli j�rjestus on Age ja siis Name 
select * from Person
select top 3 Age, Name from Person

-- N�ita esimene 50% tabeli sisust
select top 50 percent * from Person