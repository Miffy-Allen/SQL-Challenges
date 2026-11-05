-- A crime has taken place and the detective needs your help. The detective gave you the crime scene report, but you somehow lost it. 
-- You vaguely remember that the crime was a ​murder​ that occurred sometime on ​Jan.15, 2018​ and that it took place in ​SQL City​
select *
from crime_scene_report
where date = 20180115 and city = 'SQL City' and type = 'murder';

-- Security footage shows that there were 2 witnesses. 
-- The first witness lives at the last house on "Northwestern Dr". 
-- The second witness, named Annabel, lives somewhere on "Franklin Ave"
select *
from person
where address_street_name = 'Franklin Ave'
and name LIKE 'Annabel%';

select * from person
where address_street_name = 'Northwestern Dr'
order by address_number desc
limit 1;

-- Annabel id = 16371 / Morty id = 14887
-- To view interview transcripts use the ids in the interview table
select *
from interview
where person_id = 16371 or person_id = 14887

-- Killer was at the gym on the 9th of jan
-- Killer was a gold member 
-- Killer had a membership bag starting w 48Z
-- Killer had a car with a plate includng H42W

select *
from get_fit_now_member as gfnm
join get_fit_now_check_in as ci 
on gfnm.id = ci.membership_id 
where membership_status = 'gold'
and
check_in_date = 20180109
and 
membership_id LIKE '48Z%'

-- This gives us two names - Joe Germuska (48Z7A) Jeremy Bowers (48Z55)
select *
from person as p
join drivers_license as dl
on p.license_id = dl.id
where p.name = 'Joe Germuska' or name = 'Jeremy Bowers'
and dl.plate_number LIKE '%H42W%'

-- Jeremy Bowers 
-- id = 67318

-- Congrats, you found the murderer! But wait, there's more... 
-- If you think you're up for a challenge, try querying the interview transcript of the murderer to find the real villain behind this crime. 
-- If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. 
select *
from interview
where person_id = 67318

--	I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
-- She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.
select 
name,
car_model
from person as p
join drivers_license as dl
on p.license_id = dl.id
join facebook_event_checkin as fec
on fec.person_id = p.id
where hair_color = 'red'
and car_make = 'Tesla'
and height between 65 and 67
and car_model = 'Model S'
and event_name LIKE '%Symphony%'

-- Miranda Priestly
-- Congrats, you found the brains behind the murder! Everyone in SQL City hails you as the greatest SQL detective of all time. 
-- Time to break out the champagne!