--======================================================
--
-- Author: Radim Baca
-- Create date: 10.9.2020
-- Description: Database script that is used in DS I tests in 2020
-- License: This code was writtend by Radim Baca and is the property of VSB - Technical university of Ostrava (VSB-TUO).
--          This code MAY NOT BE USED without the expressed written consent of VSB-TUO outside of VSB-TUO education
-- Change history:
--
--======================================================

DROP TABLE IF EXISTS test.device_event
DROP TABLE IF EXISTS test.device
DROP TABLE IF EXISTS test.person
DROP TABLE IF EXISTS test.event_type

IF NOT EXISTS (
	SELECT  schema_name
	FROM    information_schema.schemata
	WHERE   schema_name = 'test' ) 
BEGIN
	EXEC sp_executesql N'CREATE SCHEMA test'
END
GO

create table test.device
(
	dID int primary key identity,
	manufacturer varchar(15) not null,
	label varchar(15) not null,
	building varchar(1) not null,
	placement varchar(5),
	has_sensor int check(has_sensor = 0 or has_sensor = 1)
)

create table test.person 
(
	pID int primary key,
	name varchar(30) not null,
	is_extern int check(is_extern = 0 or is_extern = 1) not null,
	mother_language varchar(30) not null,
	bossID int references test.person(pID)
)

create table test.event_type
(
	tID int primary key identity,
	event_description varchar(50) not null,
	importance int check(importance in (0,1,2)),
	is_recorded int check(is_recorded in (0,1))
)

create table test.device_event
(
	eID int primary key identity,
	dID int references test.device not null,
	pID int references test.person not null,
	tID int references test.event_type not null,
	startDate datetime2,
	endDate datetime2
)

insert into test.device values ('Bosh', 'S2XD-6', 'A', null, 1);
insert into test.device values ('Bosh', 'S3-8', 'B', '1001', 1);
insert into test.device values ('Bosh', 'Val-8X5', 'B', '203', 1);
insert into test.device values ('Bosh', 'Tr-21', 'C', null, 0);
insert into test.device values ('DeWalt', 'DC25', 'A', '1009', 0);
insert into test.device values ('DeWalt', 'CF X.5', 'B', '1001', 0);
insert into test.device values ('DeWalt', 'DB XS.6', 'B', '1001', 1);
insert into test.device values ('Ajax', 'OS 56', 'C', '301', 0);
insert into test.device values ('Ajax', 'OP 56 D', 'B', '203', 0);
insert into test.device values ('Hapatara', 'H1', 'C', '302', 0);
insert into test.device values ('Hapatara', 'H2-802.d', 'B', '1001', 0);


insert into test.person values(1, 'Petr', 0, 'Czech', null);
insert into test.person values(2, 'Ivana', 0, 'Czech', 1);
insert into test.person values(3, 'Olaf', 0, 'Norway', 1);
insert into test.person values(4, 'Mahdi', 0, 'Iran', null);
insert into test.person values(5, 'Michael', 1, 'USA', 4);
insert into test.person values(6, 'David', 1, 'Czech', 5);
insert into test.person values(7, 'Oumar', 0, 'Senegal', 3);
insert into test.person values(8, 'Moussa', 0, 'Senegal', 3);
insert into test.person values(9, 'Yuki', 0, 'Japan', 1);
insert into test.person values(10, 'Hiro', 0, 'Japan', 9);
insert into test.person values(11, 'Takumi', 0, 'Japan', 9);


insert into test.event_type values('electritity outage', 2, 1);
insert into test.event_type values('failure of machine part', 1, 0);
insert into test.event_type values('full machine failure', 2, 1);
insert into test.event_type values('planed maintenance', 0, 0);
insert into test.event_type values('planed machine update', 0, 0);
insert into test.event_type values('operator injury', 1, 0);

SET IDENTITY_INSERT [test].[device_event] ON 

INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (1, 3, 8, 4, CAST(N'2015-04-27T17:14:30.8100000' AS DateTime2), CAST(N'2015-04-27T18:57:28.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (2, 3, 9, 6, CAST(N'2015-05-03T18:35:09.8100000' AS DateTime2), CAST(N'2015-05-03T18:49:38.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (3, 10, 6, 1, CAST(N'2015-05-03T20:19:38.8100000' AS DateTime2), CAST(N'2015-05-03T20:21:45.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (4, 7, 2, 3, CAST(N'2015-05-20T21:44:43.8100000' AS DateTime2), CAST(N'2015-05-20T23:44:15.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (5, 1, 10, 3, CAST(N'2015-06-03T22:15:36.8100000' AS DateTime2), CAST(N'2015-06-03T23:42:04.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (6, 4, 8, 5, CAST(N'2015-06-18T00:27:44.8100000' AS DateTime2), CAST(N'2015-06-18T01:06:45.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (7, 1, 2, 3, CAST(N'2015-07-07T01:12:17.8100000' AS DateTime2), CAST(N'2015-07-07T01:44:57.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (8, 4, 10, 3, CAST(N'2015-07-21T03:19:13.8100000' AS DateTime2), CAST(N'2015-07-21T03:46:13.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (9, 3, 2, 3, CAST(N'2015-07-28T04:12:39.8100000' AS DateTime2), CAST(N'2015-07-28T05:45:28.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (10, 9, 4, 4, CAST(N'2015-08-13T04:54:05.8100000' AS DateTime2), CAST(N'2015-08-13T06:51:00.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (11, 10, 1, 4, CAST(N'2015-08-22T08:46:14.8100000' AS DateTime2), CAST(N'2015-08-22T10:02:55.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (12, 5, 5, 3, CAST(N'2015-09-02T10:13:46.8100000' AS DateTime2), CAST(N'2015-09-02T11:54:45.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (13, 4, 3, 4, CAST(N'2015-09-20T13:50:29.8100000' AS DateTime2), CAST(N'2015-09-20T14:54:32.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (14, 4, 2, 2, CAST(N'2015-09-27T14:14:10.8100000' AS DateTime2), CAST(N'2015-09-27T16:04:13.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (15, 3, 2, 5, CAST(N'2015-10-06T17:20:49.8100000' AS DateTime2), CAST(N'2015-10-06T18:26:14.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (16, 5, 2, 3, CAST(N'2015-10-16T18:26:00.8100000' AS DateTime2), CAST(N'2015-10-16T20:16:22.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (17, 1, 6, 5, CAST(N'2015-10-30T20:52:36.8100000' AS DateTime2), CAST(N'2015-10-30T20:59:02.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (18, 6, 11, 4, CAST(N'2015-11-12T21:06:24.8100000' AS DateTime2), CAST(N'2015-11-12T22:59:07.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (19, 3, 1, 2, CAST(N'2015-11-17T00:55:19.8100000' AS DateTime2), CAST(N'2015-11-17T02:48:06.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (20, 3, 9, 2, CAST(N'2015-11-23T01:19:41.8100000' AS DateTime2), CAST(N'2015-11-23T03:00:55.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (21, 1, 9, 2, CAST(N'2015-11-27T03:44:25.8100000' AS DateTime2), CAST(N'2015-11-27T03:55:50.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (22, 11, 8, 2, CAST(N'2015-11-30T06:01:37.8100000' AS DateTime2), CAST(N'2015-11-30T07:53:00.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (23, 7, 11, 3, CAST(N'2015-12-19T06:07:46.8100000' AS DateTime2), CAST(N'2015-12-19T06:24:40.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (24, 11, 3, 2, CAST(N'2015-12-19T06:34:04.8100000' AS DateTime2), CAST(N'2015-12-19T07:50:39.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (25, 4, 11, 5, CAST(N'2016-01-06T09:04:03.8100000' AS DateTime2), CAST(N'2016-01-06T10:59:54.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (26, 11, 1, 4, CAST(N'2016-01-21T12:09:56.8100000' AS DateTime2), CAST(N'2016-01-21T13:54:04.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (27, 5, 6, 2, CAST(N'2016-02-04T14:32:49.8100000' AS DateTime2), CAST(N'2016-02-04T15:26:22.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (28, 9, 3, 5, CAST(N'2016-02-14T17:28:24.8100000' AS DateTime2), CAST(N'2016-02-14T18:00:22.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (29, 6, 1, 1, CAST(N'2016-02-22T18:17:57.8100000' AS DateTime2), CAST(N'2016-02-22T18:33:26.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (30, 11, 8, 1, CAST(N'2016-03-08T19:04:44.8100000' AS DateTime2), CAST(N'2016-03-08T20:07:51.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (31, 3, 4, 6, CAST(N'2016-03-24T19:05:08.8100000' AS DateTime2), CAST(N'2016-03-24T20:01:30.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (32, 7, 1, 6, CAST(N'2016-04-12T21:52:59.8100000' AS DateTime2), CAST(N'2016-04-12T22:45:43.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (33, 9, 10, 5, CAST(N'2016-04-25T22:16:40.8100000' AS DateTime2), CAST(N'2016-04-25T23:21:03.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (34, 10, 6, 5, CAST(N'2016-05-12T01:18:07.8100000' AS DateTime2), CAST(N'2016-05-12T02:58:01.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (35, 2, 8, 6, CAST(N'2016-05-15T02:53:18.8100000' AS DateTime2), CAST(N'2016-05-15T04:23:04.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (36, 4, 10, 6, CAST(N'2016-05-28T04:30:51.8100000' AS DateTime2), CAST(N'2016-05-28T06:29:11.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (37, 11, 8, 5, CAST(N'2016-06-16T08:27:30.8100000' AS DateTime2), CAST(N'2016-06-16T10:20:45.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (38, 5, 6, 3, CAST(N'2016-06-16T11:20:05.8100000' AS DateTime2), CAST(N'2016-06-16T11:45:23.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (39, 7, 2, 2, CAST(N'2016-06-30T13:10:29.8100000' AS DateTime2), CAST(N'2016-06-30T14:21:30.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (40, 4, 7, 4, CAST(N'2016-07-19T14:11:10.8100000' AS DateTime2), CAST(N'2016-07-19T14:27:24.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (41, 11, 7, 2, CAST(N'2016-07-26T14:28:07.8100000' AS DateTime2), CAST(N'2016-07-26T15:20:34.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (42, 11, 7, 3, CAST(N'2016-08-02T18:09:41.8100000' AS DateTime2), CAST(N'2016-08-02T19:33:56.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (43, 11, 10, 2, CAST(N'2016-08-04T21:45:18.8100000' AS DateTime2), CAST(N'2016-08-04T23:23:06.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (44, 3, 3, 4, CAST(N'2016-08-14T22:29:48.8100000' AS DateTime2), CAST(N'2016-08-15T00:28:04.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (45, 6, 10, 3, CAST(N'2016-08-30T01:26:11.8100000' AS DateTime2), CAST(N'2016-08-30T02:54:38.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (46, 6, 4, 4, CAST(N'2016-08-31T01:57:47.8100000' AS DateTime2), CAST(N'2016-08-31T02:25:00.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (47, 1, 11, 3, CAST(N'2016-09-01T02:43:35.8100000' AS DateTime2), CAST(N'2016-09-01T03:22:03.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (48, 8, 7, 5, CAST(N'2016-09-05T06:33:26.8100000' AS DateTime2), CAST(N'2016-09-05T07:57:30.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (49, 3, 2, 4, CAST(N'2016-09-22T08:47:38.8100000' AS DateTime2), CAST(N'2016-09-22T09:06:54.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (50, 11, 7, 3, CAST(N'2016-10-01T10:41:14.8100000' AS DateTime2), CAST(N'2016-10-01T12:06:27.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (51, 11, 10, 3, CAST(N'2016-10-19T12:15:51.8100000' AS DateTime2), CAST(N'2016-10-19T13:38:07.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (52, 2, 11, 5, CAST(N'2016-10-28T12:20:26.8100000' AS DateTime2), CAST(N'2016-10-28T12:58:27.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (53, 2, 4, 4, CAST(N'2016-10-30T13:18:47.8100000' AS DateTime2), CAST(N'2016-10-30T14:43:21.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (54, 7, 11, 3, CAST(N'2016-11-14T16:20:47.8100000' AS DateTime2), CAST(N'2016-11-14T16:23:00.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (55, 4, 6, 4, CAST(N'2016-11-22T18:33:35.8100000' AS DateTime2), CAST(N'2016-11-22T20:11:20.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (56, 2, 3, 3, CAST(N'2016-11-24T20:39:23.8100000' AS DateTime2), CAST(N'2016-11-24T20:52:25.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (57, 8, 11, 5, CAST(N'2016-12-11T00:15:10.8100000' AS DateTime2), CAST(N'2016-12-11T00:35:36.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (58, 10, 11, 4, CAST(N'2016-12-11T00:58:28.8100000' AS DateTime2), CAST(N'2016-12-11T02:09:23.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (59, 2, 10, 3, CAST(N'2016-12-20T01:04:34.8100000' AS DateTime2), CAST(N'2016-12-20T01:05:52.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (60, 3, 5, 1, CAST(N'2017-01-05T03:31:52.8100000' AS DateTime2), CAST(N'2017-01-05T04:23:09.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (61, 8, 8, 2, CAST(N'2017-01-24T05:45:11.8100000' AS DateTime2), CAST(N'2017-01-24T06:36:51.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (62, 2, 3, 6, CAST(N'2017-02-12T06:40:09.8100000' AS DateTime2), CAST(N'2017-02-12T08:10:48.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (63, 10, 11, 3, CAST(N'2017-02-12T09:57:01.8100000' AS DateTime2), CAST(N'2017-02-12T11:02:58.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (64, 5, 3, 5, CAST(N'2017-02-23T12:45:08.8100000' AS DateTime2), CAST(N'2017-02-23T13:52:11.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (65, 6, 5, 4, CAST(N'2017-03-11T15:04:29.8100000' AS DateTime2), CAST(N'2017-03-11T15:27:58.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (66, 7, 2, 3, CAST(N'2017-03-27T18:07:17.8100000' AS DateTime2), CAST(N'2017-03-27T19:02:58.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (67, 8, 9, 4, CAST(N'2017-04-11T19:41:45.8100000' AS DateTime2), CAST(N'2017-04-11T20:00:05.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (68, 11, 4, 2, CAST(N'2017-04-16T21:08:27.8100000' AS DateTime2), CAST(N'2017-04-16T22:02:26.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (69, 3, 10, 1, CAST(N'2017-04-23T00:22:37.8100000' AS DateTime2), CAST(N'2017-04-23T00:55:02.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (70, 2, 10, 2, CAST(N'2017-05-05T03:49:21.8100000' AS DateTime2), CAST(N'2017-05-05T04:02:41.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (71, 6, 10, 2, CAST(N'2017-05-08T06:10:34.8100000' AS DateTime2), CAST(N'2017-05-08T07:13:57.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (72, 7, 6, 6, CAST(N'2017-05-24T08:57:25.8100000' AS DateTime2), CAST(N'2017-05-24T10:32:07.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (73, 8, 2, 4, CAST(N'2017-05-25T09:04:32.8100000' AS DateTime2), CAST(N'2017-05-25T09:20:32.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (74, 3, 8, 4, CAST(N'2017-06-05T09:11:11.8100000' AS DateTime2), CAST(N'2017-06-05T09:49:37.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (75, 9, 6, 2, CAST(N'2017-06-22T11:55:28.8100000' AS DateTime2), CAST(N'2017-06-22T13:15:45.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (76, 5, 5, 5, CAST(N'2017-06-26T15:10:34.8100000' AS DateTime2), CAST(N'2017-06-26T16:39:07.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (77, 11, 5, 4, CAST(N'2017-06-28T18:04:55.8100000' AS DateTime2), CAST(N'2017-06-28T19:28:47.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (78, 7, 7, 1, CAST(N'2017-07-08T18:12:34.8100000' AS DateTime2), CAST(N'2017-07-08T19:49:22.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (79, 10, 2, 5, CAST(N'2017-07-09T19:47:07.8100000' AS DateTime2), CAST(N'2017-07-09T21:07:20.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (80, 7, 2, 6, CAST(N'2017-07-09T20:36:25.8100000' AS DateTime2), CAST(N'2017-07-09T21:16:49.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (81, 10, 10, 4, CAST(N'2017-07-20T22:19:16.8100000' AS DateTime2), CAST(N'2017-07-20T22:50:29.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (82, 1, 3, 6, CAST(N'2017-07-28T00:04:00.8100000' AS DateTime2), CAST(N'2017-07-28T01:07:08.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (83, 1, 5, 6, CAST(N'2017-08-14T01:40:01.8100000' AS DateTime2), CAST(N'2017-08-14T02:13:47.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (84, 6, 1, 6, CAST(N'2017-08-29T03:30:36.8100000' AS DateTime2), CAST(N'2017-08-29T04:04:57.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (85, 10, 7, 6, CAST(N'2017-09-13T07:18:05.8100000' AS DateTime2), CAST(N'2017-09-13T08:13:10.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (86, 8, 3, 1, CAST(N'2017-09-16T11:08:33.8100000' AS DateTime2), CAST(N'2017-09-16T11:46:54.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (87, 11, 5, 1, CAST(N'2017-09-25T11:55:00.8100000' AS DateTime2), CAST(N'2017-09-25T12:18:14.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (88, 2, 1, 5, CAST(N'2017-09-30T15:47:13.8100000' AS DateTime2), CAST(N'2017-09-30T17:08:11.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (89, 11, 6, 1, CAST(N'2017-10-06T17:56:48.8100000' AS DateTime2), CAST(N'2017-10-06T19:00:51.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (90, 3, 5, 3, CAST(N'2017-10-15T20:08:09.8100000' AS DateTime2), CAST(N'2017-10-15T21:55:50.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (91, 8, 9, 3, CAST(N'2017-10-25T21:22:31.8100000' AS DateTime2), CAST(N'2017-10-25T22:01:38.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (92, 6, 10, 6, CAST(N'2017-11-05T00:35:57.8100000' AS DateTime2), CAST(N'2017-11-05T00:36:56.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (93, 9, 4, 2, CAST(N'2017-11-11T02:10:09.8100000' AS DateTime2), CAST(N'2017-11-11T03:49:39.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (94, 8, 7, 4, CAST(N'2017-11-22T05:54:48.8100000' AS DateTime2), CAST(N'2017-11-22T07:27:55.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (95, 10, 11, 5, CAST(N'2017-12-01T09:17:36.8100000' AS DateTime2), CAST(N'2017-12-01T10:07:39.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (96, 6, 9, 6, CAST(N'2017-12-11T11:05:13.8100000' AS DateTime2), CAST(N'2017-12-11T12:58:22.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (97, 5, 8, 6, CAST(N'2017-12-20T13:44:24.8100000' AS DateTime2), CAST(N'2017-12-20T14:11:48.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (98, 5, 7, 4, CAST(N'2018-01-04T16:12:57.8100000' AS DateTime2), CAST(N'2018-01-04T16:50:54.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (99, 11, 8, 2, CAST(N'2018-01-07T18:50:22.8100000' AS DateTime2), CAST(N'2018-01-07T19:20:39.8100000' AS DateTime2))
GO
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (100, 10, 11, 1, CAST(N'2018-01-21T21:01:25.8100000' AS DateTime2), CAST(N'2018-01-21T21:52:55.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (101, 3, 3, 3, CAST(N'2018-02-02T23:59:12.8100000' AS DateTime2), CAST(N'2018-02-03T00:02:47.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (102, 8, 11, 3, CAST(N'2018-02-15T00:34:31.8100000' AS DateTime2), CAST(N'2018-02-15T00:44:20.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (103, 5, 3, 6, CAST(N'2018-02-21T03:09:46.8100000' AS DateTime2), CAST(N'2018-02-21T03:18:42.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (104, 2, 3, 1, CAST(N'2018-03-05T04:07:25.8100000' AS DateTime2), CAST(N'2018-03-05T04:50:26.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (105, 1, 6, 5, CAST(N'2018-03-16T07:18:40.8100000' AS DateTime2), CAST(N'2018-03-16T07:50:27.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (106, 6, 2, 5, CAST(N'2018-03-21T08:35:05.8100000' AS DateTime2), CAST(N'2018-03-21T09:54:55.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (107, 5, 9, 1, CAST(N'2018-03-29T09:42:54.8100000' AS DateTime2), CAST(N'2018-03-29T09:45:06.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (108, 3, 10, 3, CAST(N'2018-04-12T11:08:58.8100000' AS DateTime2), CAST(N'2018-04-12T12:36:45.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (109, 9, 1, 3, CAST(N'2018-04-22T12:25:37.8100000' AS DateTime2), CAST(N'2018-04-22T13:15:03.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (110, 1, 9, 5, CAST(N'2018-04-30T15:30:41.8100000' AS DateTime2), CAST(N'2018-04-30T16:41:04.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (111, 5, 6, 6, CAST(N'2018-05-06T15:59:05.8100000' AS DateTime2), CAST(N'2018-05-06T16:40:23.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (112, 8, 9, 5, CAST(N'2018-05-14T16:53:06.8100000' AS DateTime2), CAST(N'2018-05-14T17:11:19.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (113, 4, 10, 4, CAST(N'2018-05-24T20:52:04.8100000' AS DateTime2), CAST(N'2018-05-24T21:41:12.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (114, 1, 8, 6, CAST(N'2018-06-03T23:28:04.8100000' AS DateTime2), CAST(N'2018-06-04T00:21:42.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (115, 6, 5, 2, CAST(N'2018-06-04T00:16:53.8100000' AS DateTime2), CAST(N'2018-06-04T01:07:04.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (116, 5, 11, 4, CAST(N'2018-06-23T03:52:51.8100000' AS DateTime2), CAST(N'2018-06-23T04:29:01.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (117, 6, 2, 2, CAST(N'2018-07-06T05:01:20.8100000' AS DateTime2), CAST(N'2018-07-06T06:10:11.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (118, 2, 6, 1, CAST(N'2018-07-11T05:43:42.8100000' AS DateTime2), CAST(N'2018-07-11T06:20:56.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (119, 2, 8, 5, CAST(N'2018-07-30T08:25:43.8100000' AS DateTime2), CAST(N'2018-07-30T08:43:40.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (120, 11, 7, 5, CAST(N'2018-08-18T09:09:50.8100000' AS DateTime2), CAST(N'2018-08-18T09:14:45.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (121, 4, 3, 4, CAST(N'2018-09-03T11:20:18.8100000' AS DateTime2), CAST(N'2018-09-03T12:30:03.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (122, 8, 5, 1, CAST(N'2018-09-09T14:11:51.8100000' AS DateTime2), CAST(N'2018-09-09T14:16:53.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (123, 10, 8, 6, CAST(N'2018-09-22T17:48:49.8100000' AS DateTime2), CAST(N'2018-09-22T18:38:56.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (124, 6, 6, 1, CAST(N'2018-09-23T18:02:59.8100000' AS DateTime2), CAST(N'2018-09-23T19:37:23.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (125, 9, 9, 4, CAST(N'2018-09-24T19:38:02.8100000' AS DateTime2), CAST(N'2018-09-24T20:54:59.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (126, 6, 7, 6, CAST(N'2018-10-03T19:58:00.8100000' AS DateTime2), CAST(N'2018-10-03T20:35:41.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (127, 8, 1, 2, CAST(N'2018-10-05T22:06:39.8100000' AS DateTime2), CAST(N'2018-10-05T22:49:41.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (128, 4, 1, 5, CAST(N'2018-10-18T23:44:19.8100000' AS DateTime2), CAST(N'2018-10-19T00:43:03.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (129, 3, 9, 4, CAST(N'2018-11-04T00:41:46.8100000' AS DateTime2), CAST(N'2018-11-04T02:14:17.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (130, 10, 2, 5, CAST(N'2018-11-08T04:35:00.8100000' AS DateTime2), CAST(N'2018-11-08T06:29:20.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (131, 4, 7, 1, CAST(N'2018-11-17T07:59:26.8100000' AS DateTime2), CAST(N'2018-11-17T09:01:58.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (132, 8, 5, 3, CAST(N'2018-11-26T10:40:37.8100000' AS DateTime2), CAST(N'2018-11-26T11:20:59.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (133, 11, 10, 1, CAST(N'2018-12-15T13:17:07.8100000' AS DateTime2), CAST(N'2018-12-15T13:44:38.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (134, 11, 4, 1, CAST(N'2018-12-19T14:54:41.8100000' AS DateTime2), CAST(N'2018-12-19T16:09:05.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (135, 11, 11, 1, CAST(N'2019-01-02T16:09:46.8100000' AS DateTime2), CAST(N'2019-01-02T16:49:22.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (136, 7, 7, 6, CAST(N'2019-01-16T17:21:11.8100000' AS DateTime2), CAST(N'2019-01-16T19:04:35.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (137, 5, 8, 6, CAST(N'2019-01-30T18:02:09.8100000' AS DateTime2), CAST(N'2019-01-30T18:19:08.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (138, 4, 1, 4, CAST(N'2019-02-03T21:15:03.8100000' AS DateTime2), CAST(N'2019-02-03T22:44:32.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (139, 4, 9, 6, CAST(N'2019-02-19T00:20:21.8100000' AS DateTime2), CAST(N'2019-02-19T00:57:06.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (140, 9, 6, 3, CAST(N'2019-02-25T00:51:39.8100000' AS DateTime2), CAST(N'2019-02-25T01:48:50.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (141, 2, 8, 6, CAST(N'2019-03-12T03:06:38.8100000' AS DateTime2), CAST(N'2019-03-12T03:23:45.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (142, 4, 5, 4, CAST(N'2019-03-27T07:03:31.8100000' AS DateTime2), CAST(N'2019-03-27T08:36:21.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (143, 7, 11, 4, CAST(N'2019-04-13T07:37:37.8100000' AS DateTime2), CAST(N'2019-04-13T09:00:28.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (144, 6, 6, 1, CAST(N'2019-05-01T10:07:24.8100000' AS DateTime2), CAST(N'2019-05-01T12:06:23.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (145, 6, 2, 4, CAST(N'2019-05-13T13:43:20.8100000' AS DateTime2), CAST(N'2019-05-13T15:29:47.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (146, 8, 4, 2, CAST(N'2019-05-17T15:54:48.8100000' AS DateTime2), CAST(N'2019-05-17T17:17:23.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (147, 9, 8, 3, CAST(N'2019-05-25T18:46:59.8100000' AS DateTime2), CAST(N'2019-05-25T19:06:27.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (148, 7, 10, 2, CAST(N'2019-06-07T20:29:52.8100000' AS DateTime2), CAST(N'2019-06-07T21:26:30.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (149, 4, 5, 3, CAST(N'2019-06-24T20:36:43.8100000' AS DateTime2), CAST(N'2019-06-24T22:03:10.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (150, 6, 8, 5, CAST(N'2019-06-28T23:59:25.8100000' AS DateTime2), CAST(N'2019-06-29T01:19:16.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (151, 11, 10, 6, CAST(N'2019-07-15T02:24:57.8100000' AS DateTime2), CAST(N'2019-07-15T03:15:57.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (152, 7, 1, 5, CAST(N'2019-07-21T04:30:24.8100000' AS DateTime2), CAST(N'2019-07-21T06:30:15.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (153, 3, 8, 1, CAST(N'2019-08-01T06:05:01.8100000' AS DateTime2), CAST(N'2019-08-01T06:43:26.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (154, 6, 8, 3, CAST(N'2019-08-02T06:44:33.8100000' AS DateTime2), CAST(N'2019-08-02T06:50:05.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (155, 1, 1, 1, CAST(N'2019-08-02T08:48:57.8100000' AS DateTime2), CAST(N'2019-08-02T09:42:13.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (156, 1, 10, 2, CAST(N'2019-08-02T09:43:54.8100000' AS DateTime2), CAST(N'2019-08-02T10:01:58.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (157, 1, 7, 3, CAST(N'2019-08-02T12:00:58.8100000' AS DateTime2), CAST(N'2019-08-02T12:29:39.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (158, 10, 2, 3, CAST(N'2019-08-12T15:29:34.8100000' AS DateTime2), CAST(N'2019-08-12T16:05:34.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (159, 6, 7, 2, CAST(N'2019-08-16T16:42:20.8100000' AS DateTime2), CAST(N'2019-08-16T18:16:03.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (160, 9, 5, 1, CAST(N'2019-08-25T18:19:36.8100000' AS DateTime2), CAST(N'2019-08-25T18:29:27.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (161, 5, 5, 5, CAST(N'2019-08-25T22:09:15.8100000' AS DateTime2), CAST(N'2019-08-25T23:18:29.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (162, 8, 9, 1, CAST(N'2019-09-02T00:41:43.8100000' AS DateTime2), CAST(N'2019-09-02T01:22:51.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (163, 7, 3, 1, CAST(N'2019-09-21T02:55:01.8100000' AS DateTime2), CAST(N'2019-09-21T04:26:16.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (164, 5, 11, 2, CAST(N'2019-09-30T03:06:24.8100000' AS DateTime2), CAST(N'2019-09-30T04:43:17.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (165, 8, 2, 5, CAST(N'2019-10-09T04:15:29.8100000' AS DateTime2), CAST(N'2019-10-09T06:08:08.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (166, 9, 9, 3, CAST(N'2019-10-21T05:03:27.8100000' AS DateTime2), CAST(N'2019-10-21T05:13:07.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (167, 5, 4, 4, CAST(N'2019-10-29T08:06:24.8100000' AS DateTime2), CAST(N'2019-10-29T08:47:28.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (168, 7, 9, 5, CAST(N'2019-10-31T09:29:38.8100000' AS DateTime2), CAST(N'2019-10-31T11:01:30.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (169, 8, 7, 5, CAST(N'2019-11-05T12:46:08.8100000' AS DateTime2), CAST(N'2019-11-05T14:28:12.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (170, 3, 8, 4, CAST(N'2019-11-23T15:41:46.8100000' AS DateTime2), CAST(N'2019-11-23T16:22:22.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (171, 9, 7, 2, CAST(N'2019-12-09T18:11:43.8100000' AS DateTime2), CAST(N'2019-12-09T18:20:29.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (172, 7, 5, 3, CAST(N'2019-12-12T20:19:24.8100000' AS DateTime2), CAST(N'2019-12-12T20:44:09.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (173, 11, 6, 5, CAST(N'2019-12-23T21:34:42.8100000' AS DateTime2), CAST(N'2019-12-23T21:46:59.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (174, 5, 10, 4, CAST(N'2020-01-07T22:37:21.8100000' AS DateTime2), CAST(N'2020-01-08T00:13:54.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (175, 3, 8, 6, CAST(N'2020-01-19T22:38:19.8100000' AS DateTime2), CAST(N'2020-01-19T23:53:30.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (176, 9, 10, 1, CAST(N'2020-02-03T00:15:06.8100000' AS DateTime2), CAST(N'2020-02-03T02:14:28.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (177, 3, 4, 1, CAST(N'2020-02-22T01:31:55.8100000' AS DateTime2), CAST(N'2020-02-22T03:21:00.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (178, 11, 4, 1, CAST(N'2020-03-05T04:23:34.8100000' AS DateTime2), CAST(N'2020-03-05T05:41:07.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (179, 1, 8, 2, CAST(N'2020-03-08T07:02:08.8100000' AS DateTime2), CAST(N'2020-03-08T07:29:06.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (180, 2, 5, 2, CAST(N'2020-03-25T09:50:00.8100000' AS DateTime2), CAST(N'2020-03-25T10:16:08.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (181, 9, 1, 5, CAST(N'2020-04-05T10:05:17.8100000' AS DateTime2), CAST(N'2020-04-05T11:06:21.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (182, 11, 10, 5, CAST(N'2020-04-21T10:40:08.8100000' AS DateTime2), CAST(N'2020-04-21T12:09:41.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (183, 1, 4, 3, CAST(N'2020-04-29T11:04:20.8100000' AS DateTime2), CAST(N'2020-04-29T11:48:15.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (184, 10, 3, 3, CAST(N'2020-05-18T13:32:18.8100000' AS DateTime2), CAST(N'2020-05-18T14:35:59.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (185, 8, 9, 2, CAST(N'2020-05-23T16:32:29.8100000' AS DateTime2), CAST(N'2020-05-23T18:30:43.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (186, 9, 7, 1, CAST(N'2020-06-08T19:35:11.8100000' AS DateTime2), CAST(N'2020-06-08T21:00:31.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (187, 7, 2, 5, CAST(N'2020-06-14T20:43:11.8100000' AS DateTime2), CAST(N'2020-06-14T21:23:32.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (188, 6, 11, 4, CAST(N'2020-06-14T21:30:21.8100000' AS DateTime2), CAST(N'2020-06-14T22:44:09.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (189, 6, 2, 5, CAST(N'2020-06-26T23:27:35.8100000' AS DateTime2), CAST(N'2020-06-27T00:41:22.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (190, 6, 7, 3, CAST(N'2020-07-03T23:35:38.8100000' AS DateTime2), CAST(N'2020-07-04T00:19:50.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (191, 7, 7, 6, CAST(N'2020-07-09T01:27:58.8100000' AS DateTime2), CAST(N'2020-07-09T02:38:29.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (192, 1, 6, 1, CAST(N'2020-07-22T02:10:20.8100000' AS DateTime2), CAST(N'2020-07-22T03:41:09.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (193, 6, 7, 4, CAST(N'2020-08-01T03:34:43.8100000' AS DateTime2), CAST(N'2020-08-01T03:36:18.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (194, 7, 3, 6, CAST(N'2020-08-17T05:23:58.8100000' AS DateTime2), CAST(N'2020-08-17T06:42:29.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (195, 4, 11, 2, CAST(N'2020-09-01T06:20:40.8100000' AS DateTime2), CAST(N'2020-09-01T08:06:19.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (196, 9, 2, 4, CAST(N'2020-09-09T07:22:44.8100000' AS DateTime2), CAST(N'2020-09-09T07:24:30.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (197, 3, 10, 6, CAST(N'2020-09-20T08:50:41.8100000' AS DateTime2), CAST(N'2020-09-20T10:40:57.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (198, 3, 6, 3, CAST(N'2020-09-24T11:16:16.8100000' AS DateTime2), CAST(N'2020-09-24T13:14:10.8100000' AS DateTime2))
INSERT [test].[device_event] ([eID], [dID], [pID], [tID], [startDate], [endDate]) VALUES (199, 11, 3, 1, CAST(N'2020-10-09T13:32:40.8100000' AS DateTime2), CAST(N'2020-10-09T14:15:37.8100000' AS DateTime2))
GO
SET IDENTITY_INSERT [test].[device_event] OFF