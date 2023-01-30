SELECT * FROM    crime_scene_report
WHERE city ='SQL City'and date=20180115

-- Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".

-- Witness 1
SELECT * FROM person 
WHERE address_street_name = 'Northwestern Dr' 
ORDER BY address_number DESC LIMIT 1;

-- Witness 2
SELECT * FROM person 
WHERE name like '%Annabel%'
AND address_street_name = 'Franklin Ave';

SELECT transcript, name
FROM interview
JOIN person
ON interview.person_id=person.id
WHERE person_id =14887 or person_id=16371

SELECT membership_id, check_in_date, plate_number
FROM get_fit_now_check_in gfc
JOIN get_fit_now_member gfm
ON gfc.membership_id=gfm.id
JOIN person p
ON gfm.person_id=p.id
JOIN drivers_license dl
ON p.license_id=dl.id
WHERE plate_number LIKE '%H42W%';


SELECT membership_id, name
FROM get_fit_now_check_in
JOIN get_fit_now_member
ON get_fit_now_check_in.membership_id=get_fit_now_member.id
WHERE membership_id = '48Z55'


-- SOLUTION
INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        
        SELECT value FROM solution;
   
   
SELECT transcript, name
FROM interview
JOIN person
ON interview.person_id=person.id
WHERE name ='Jeremy Bowers' 

SELECT name, annual_income, height, hair_color, car_make, car_model, gender, event_name
FROM person p
JOIN drivers_license dl
ON p.license_id=dl.id
JOIN facebook_event_checkin fec
ON fec.person_id=p.id
JOIN income i
ON p.ssn=i.ssn
WHERE car_make='Tesla' and car_model='Model S' and hair_color='red' and gender='female'
ORDER BY annual_income DESC;


-- SOLUTION
INSERT INTO solution VALUES (1, 'Miranda Priestly');
        
        SELECT value FROM solution;
        
        

