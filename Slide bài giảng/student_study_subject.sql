--======================================================
--
-- Author: Radim Baca
-- Create date: 4.8.2014
-- Description: Create a tables database that are used in UDBS lectures
-- License: This code was writtend by Radim Baca and is the property of VSB-TUO 
--          This code MAY NOT BE USED without the expressed written consent of VSB-TUO.
-- Change history:
--
--======================================================

IF OBJECT_ID('dbo.studies', 'U') IS NOT NULL
  DROP TABLE dbo.studies
IF OBJECT_ID('dbo.subject', 'U') IS NOT NULL
  DROP TABLE dbo.subject
IF OBJECT_ID('dbo.student', 'U') IS NOT NULL
  DROP TABLE dbo.student

create table student (
	stID int primary key,
	name varchar(30) not null,
	birth_year int
)

create table subject (
	suID int primary key,
	name varchar(30) not null,
	study_year int
)
	
create table studies (
	suID int references subject,
	stID int references student,
	year int,
	gained_points int,
	primary key (suID, stID, year)
)


insert into student values (1, 'Petr', 1986);
insert into student values (2, 'Karel', 1984);
insert into student values (3, 'Jan', 1980);
insert into student values (4, 'Vojta', 1983);
insert into student values (5, 'Lucie', 1985);
insert into student values (6, 'Iva', 1986);
insert into student values (7, 'Petra', 1985);
insert into student values (8, 'Olaf', null);

insert into subject values (1, 'UDBS', 2);
insert into subject values (2, 'DAIS', 2);
insert into subject values (3, 'DBS', 3);
insert into subject values (4, 'MAIT', 1);
insert into subject values (5, 'ZP', 1);
insert into subject values (6, 'DIM', 2);

insert into studies values (1, 1, 2010, 45);
insert into studies values (1, 1, 2011, 51);
insert into studies values (1, 3, 2011, 23);
insert into studies values (1, 4, 2010, 62);
insert into studies values (1, 5, 2010, 56);
insert into studies values (1, 6, 2010, 2);
insert into studies values (1, 6, 2011, 51);
insert into studies values (1, 7, 2010, 12);
insert into studies values (1, 7, 2011, 15);
insert into studies values (2, 1, 2010, 12);
insert into studies values (2, 6, 2011, 15);
insert into studies values (3, 4, 2010, 68);
insert into studies values (3, 5, 2010, 69);
insert into studies values (3, 6, 2010, 52);
insert into studies values (5, 4, 2010, 78);
insert into studies values (5, 5, 2010, 59);
insert into studies values (6, 4, 2011, 86);
insert into studies values (6, 5, 2011, 55);
insert into studies values (6, 3, 2012, null);

