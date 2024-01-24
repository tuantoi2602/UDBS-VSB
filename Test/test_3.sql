/*3. Find persons without a subordinate person */
select * from test.person p
where p.pID not in (
    select bossID from test.person p1 where p1.bossID IS NOT NULL)

/* 2. Find all persons having at least one subordinate person and compute the following informations:
• The number of events reported by the person in 2017.
• The number of events reported by the person on the H1 device. */
select distinct bossID, (
    select count(*) from test.device_event
    where device_event.pID = p1.bossID and year(startDate) = 2017),(
    select count(*) from test.device
    join test.device_event on device_event.dID = device.dID
    where p1.bossID = device_event.pID and device.label = 'H1')
    from test.person p1
    where 1 >= (select count(bossID) from test.person p2
               where p1.pID = p2.bossID) and bossID is not null
/* 1.Find a nationality (attribute person.mother language) for each device, where persons having
this nationality reported the highest number of events on the device.
*/
select * from test.person p 
join test.device_event de on de.pID = p.pID
join test.device d on d.dID = de.dID
join (select count(*) from test.device_event de
    join test.person p on p.pID = de.pID


select * from test.event_type
select * from test.device_event