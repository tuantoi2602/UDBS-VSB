select * from test.language
select * from test.person

---1 Create table Language with attributes lID (automatically generated primary key) and name (text
--string, max. 30 characters). (3 points)

create table test.language(
    lID tinyint identity primary key not null,
    name varchar(30)
)


drop table test.language


--2 Insert all languages stored in the table Person into the table Language. Solve the task with a
--single INSERT SELECT statement
insert into test.language(name)
select distinct mother_language from test.person

--3 Add the attribute lID into the table Person as a foreign key to the table Language. The attribute
--will be nullable. Set the value of lID according to mother language. (6 points)

select * from test.person

select * from test.language


select * from film


alter table test.person
drop CONSTRAINT FK__person__lID__489AC854

alter table test.person
drop column lID


ALTER TABLE test.person
ADD lID tinyint null

ALTER TABLE test.person
ADD FOREIGN KEY (lID) REFERENCES test.language (lID);



update test.person set lID = (
    select lID from test.language l
    where person.mother_language =l.name
)


insert into test.person (lID) values (1)

--4
alter table test.person
drop column mother_language
--5 Add the attribute solved of type BIT to the table Device event. Attribute will be required, its
--default value will be 0. (4 points)
select * from test.device_event
alter table test.device_event
add solved BIT 



alter table comment
drop CONSTRAINT comment_shoe_fk
alter table comment
drop CONSTRAINT comment_user_fk
alter table shoe
drop CONSTRAINT shoe_brand_fk
alter table shoe
drop CONSTRAINT shoe_user_fk
alter table transactions
drop CONSTRAINT comment_user_fk
alter table transactions
drop CONSTRAINT shoe_brand_fk
alter table users
drop CONSTRAINT shoe_user_fk