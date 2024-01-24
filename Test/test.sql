select * from test.device
--1A For each manufacturer, find out how many of his devices had less than two reported
--events in 2015. (15 points)
select d.manufacturer, count(t.manufacturer)
from (select distinct manufacturer from test.device) d
left join (
select d.manufacturer
from test.device d
left join test.device_event e on d.dID = e.dID
and year(startDate) = 2015
group by d.dID, d.manufacturer
having count(e.startDate) < 2
) t on d.manufacturer = t.manufacturer
group by d.manufacturer

--1B For each manufacturer, find out how many of his devices have less than two events
--lasting more than 100 minutes. (15 points)
select d.manufacturer, count(t.manufacturer)
from (select distinct manufacturer from test.device) d
left join (
select d.manufacturer
from test.device d
left join test.device_event e on d.dID = e.dID
and datediff(minute, startDate, endDate) > 100
group by d.dID, d.manufacturer
having count(e.startDate) < 2
) t on d.manufacturer = t.manufacturer
group by d.manufacturer

--2 
/*For each person, find the longest event they reported. In other words, select those
events where the person did not report an event of longer duration. Use the function
datediff (minute, startDate, endDate) to get the duration of the event.
List the attributes pID, startDate, label, event description, and name.*/
select p.pID, de.startDate, d.label, et.event_description, name
from test.person p
join test.device_event de on de.pID = p.pID
join test.event_type et on et.tID = de.tID
join test.device d on d.dID = de.dID
where datediff(minute,startDate,endDate) = (
    select max(datediff(minute,startDate,endDate))
    from test.device_event de1
    where p.pID = de1.pID
)
order by p.pID

select de.pID, de.startDate, d.label, et.event_description, p.name
from test.device_event de
join test.device d on de.dID = d.dID
join test.event_type et on de.tID = et.tID
join test.person p on de.pID = p.pID
join (
select pID, max(DateDiff(minute, startDate, endDate)) max_datediff
from test.device_event
group by pID
) t on de.pID = t.pID
and DateDiff(minute, de.startDate, de.endDate) = max_datediff


--3
/*Find people who have never reported an event with importance 0 that is longer than
100 minutes. Use the function datediff (minute, startDate, endDate) to
get the duration of the event.*/

select p.pID from test.person p
join test.device_event de on de.pID = p.pID
join test.event_type et on et.tID = de.tID
join test.device d on d.dID = de.dID
where datediff(minute,startDate,endDate) > 100 and d.manufacturer = 'Bosh' 


select *
from test.person p
where 100 >= ALL (select datediff(minute,startDate,endDate) from test.device_event
join test.event_type on event_type.tID = device_event.tID
join test.device d on d.dID = device_event.dID
where p.pID = device_event.pID and  event_type.importance = 0)

select *
from test.person p
where not exists (
select *
from test.device_event e
join test.event_type t on t.tID = e.tID
where p.pID = e.pID and datediff(minute, startDate, endDate) > 100
and t.importance = 0
)