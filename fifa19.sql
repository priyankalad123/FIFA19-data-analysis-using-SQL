create database fifa19;
use fifa19;
select * from FIFA19_Players;

----***Data Analysis on  FIFA data***----

--Q1 How many players are there in the datasets?
select count(*) as Total_Players from FIFA19_Players;

--Q2 How many nationalities do these players belong to?
select count(nationality) as number_of_nationalities from FIFA19_Players;

--Q3 Which nationality has the highest number of players, what are the top 3 nationalities by # of players?
select count(*) as frequency, nationality from FIFA19_Players group by nationality;

select count(*) as frequency, nationality from FIFA19_Players group by nationality order by frequency desc;
--will show nationality frequency in decreasing order

--Q4 What is the total wage given to all players? What's the average and standard deviation?
SELECT 
    SUM(wage) AS total_wage, 
    AVG(wage) AS average_wage, 
    STDDEV_SAMP(wage) AS std_wage 
FROM 
    FIFA19_Players 
LIMIT 
    0, 1000;
    
--Q5 Which player has the highest wage? Who has the lowest?
select max(wage) from FIFA19_Players

select name from FIFA19_Players where wage=565000
--will show the name of player with highest wage


--Q6 The player having the best overall rating? Worst Overall rating?
SELECT 
    name 
FROM 
    FIFA19_Players 
WHERE 
    overall_rating = (SELECT MAX(overall_rating) FROM FIFA19_Players) 
LIMIT 
    0, 1000;


--Q7 Club having the highest total of overall rating? Highest Average of overall rating?
SELECT Name, Overall_rating
FROM FIFA19_Players;


--Q8 What are the top 5 clubs based on the average ratings of their players?
SELECT AVG(overall_rating) AS average_rating, club 
FROM FIFA19_Players 
GROUP BY club 
ORDER BY average_rating DESC 
LIMIT 5;

--Q9 What is the distribution of players whose preferred foot is left vs right?
SELECT COUNT(*) AS frequency, `Preferred_Foot`
FROM FIFA19_Players
GROUP BY `Preferred_Foot`
ORDER BY frequency DESC
LIMIT 0, 1000;

--Q10 Which jersey number is the luckiest?
SELECT SUM(wage) AS total_wage, `Jersey_No`
FROM FIFA19_Players
GROUP BY `Jersey_No`
ORDER BY total_wage DESC
LIMIT 0, 1000;

--Q11 What is the frequency distribution of nationalities among players whose club name starts with M?
select count(*) as freq, nationality, club from FIFA19_Players where club like 'M%' group by nationality, club;

--Q12 How many players have joined their respective clubs in the date range 20 May 2018 to 10 April 2019(both inclusive)?
select count(*) from FIFA19_Players where joined between '2018-05-20' and '2019-04-10';

--Q13 How many players have joined their respective clubs date wise?
select count(*) as freq, joined  from FIFA19_Players  group by joined order by freq desc;

--Q14 How many players have joined their respective clubs yearly?
select count(*) as freq, year(joined) from FIFA19_Players  group by year(joined) order by freq desc;











