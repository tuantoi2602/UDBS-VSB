 /*3/For each person from Japan (attribute mother language) count the following values:
• Summary of event duration reported by a person on a device S3-8.
• The number of ”planed maintenance”events (attribute event description) reported by a
person.*/

select p.pID, p.name  from test.person p
where pID in (
    select pID from test.device_event de
    join test.device d on d.dID = de.dID
    where p.pID = de.pID and p.mother_language = 'Japan'
) and pID in (
    select pID from test.device_event de
    join test.device d on d.dID = de.dID
    where p.pID = de.pID and d.label = 'S3-8'
) 



select person.name, (select sum(datediff(minute,startDate,endDate)) from test.device_event
join test.device on device_event.dID = device.dID
where person.pID = device_event.pID and device.label ='S3-8') as duration,
(select count(*) from test.device_event 
join test.event_type on device_event.tID = event_type.tID
where person.pID = device_event.pID 
and event_type.event_description = 'planned maintenance')
as numb from test.person
where person.mother_language = 'Japan'
/*Find ID of persons that have more than one hardworking subordinate (subordinate has bossID
equal to his pID). A hardworking subordinate is a person who reported a ”planed maintenance”event
in 2017*/

select bossID from test.person
join (select pID from test.device_event
join test.event_type on device_event.)