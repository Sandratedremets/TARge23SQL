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