use upgrade ;
select count(*) from datingapp;
select * from datingapp;

-- Q1. Write a query to show ALL columns for users
	-- whose relationship_intent is 'Hookups' and whose location_type is 'Metro'. Basically, the city situationship crowd.  [SELECT, WHERE]
select * from datingapp where location_type = 'metro' and relationship_intent ='hookups';

-- Q2. Find every profile that is both an 'Extreme User' (app_usage_time_label) and 'Choosy' (swipe_right_label) — the people who are on the app 24/7 but still won't swipe right on just anyone.  [WHERE, AND]
select * from datingapp where app_usage_time_label = 'Extreme user' and swipe_right_label ='choosy';


-- Q3. List the age, zodiac_sign, and relationship_intent of the 10 oldest users in the dataset, oldest first.  [ORDER BY, LIMIT]
select age, zodiac_sign,relationship_intent from datingapp order by age desc limit 10;


-- Q4. Get a list of every unique zodiac sign that appears in the dataset — no duplicates.  [DISTINCT]
select distinct zodiac_sign from datingapp;

-- Q5. Some users left their bio completely empty (bio_length = 0), aka the ultimate 'mysterious' match. Show their gender, age, and match_outcome.  [WHERE]
select gender, age,match_outcome from datingapp where bio_length = 0 ;

-- Q6. Pull 15 profiles that were swiping 'After Midnight' AND ended up 'Ghosted'. Late-night decisions really don't hit the same, huh?  [WHERE, LIMIT]
select * from datingapp where swipe_time_of_day = 'After Midnight' and match_outcome ='ghosted';


-- Q7. Calculate the average swipe_right_ratio for each swipe_right_label group, rounded to 2 decimal places. Does 'Swipe Maniac' actually swipe right the most?  [GROUP BY, AVG, ROUND]
select distinct swipe_right_label, round(avg(swipe_right_ratio) over(partition by swipe_right_label),2) as swipe_right_ratio from datingapp ;

-- Q8. Count how many users fall into each match_outcome category. Sort from the most common outcome to the least common — is 'Ghosted' really as common as everyone says?  [GROUP BY, COUNT, ORDER BY]
select distinct count(*) over (partition by match_outcome) as count_matches_outcome, match_outcome from datingapp order by count_matches_outcome desc;

-- Q9. For each relationship_intent, find the average likes_received, rounded to 2 decimals. Do people 'Exploring' get more attention than people looking for something 'Serious'?  [GROUP BY, AVG, ROUND]
select distinct round(avg(likes_received) over(partition by relationship_intent),2)  as avg_likes , relationship_intent from datingapp;

-- Q10. Which income_bracket groups have an average mutual_matches greater than 15? Let's see if money really does help you match.  [GROUP BY, HAVING]
select avg(mutual_matches),income_bracket from datingapp group by income_bracket having avg(mutual_matches)> 15;

-- Q11. Find the average emoji_usage_rate for each gender. Somebody's definitely over-texting with the 😭💀🔥 combo — who is it?  [GROUP BY, AVG]
select avg(emoji_usage_rate),gender  as emoji_avg_rate from datingapp group by gender;

-- Q12. Find the average app_usage_time_min for each education_level, sorted from highest usage to lowest. Are PhDs actually too busy for the apps?  [GROUP BY, AVG, ORDER BY]
select avg(app_usage_time_min) as avg_app_usage,education_level from datingapp group by education_level order by avg_app_usage desc;

-- Q13. For users whose match_outcome is 'Relationship Formed', count how many belong to each zodiac_sign. Which sign is secretly the most successful at love?  [WHERE, GROUP BY, COUNT]
select count(*),zodiac_sign from datingapp where match_outcome='Relationship Formed' group by zodiac_sign order by count(*) desc ;


