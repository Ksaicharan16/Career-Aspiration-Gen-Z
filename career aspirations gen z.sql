show databases;
create database kanchu;
use kanchu;

show tables;

SELECT * FROM kanchu.`career aspirations`;
                           ---------------
-- Q1) What is the gender distrubtion of respondents in india

SELECT gender, COUNT(*) AS count
FROM kanchu.`career aspirations`
WHERE country = 'India'
GROUP BY gender;
                 ----------------
                 
-- Q2) What percentage of responents from india are intersted in education  abroad and sponsorship          

SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM kanchu.`career aspirations` WHERE country = 'India')) AS percentage
FROM kanchu.`career aspirations`
WHERE country = 'India' and `Higher Education Aspring` = 'Yes' AND `Higher Education Aspring` = 'Yes';
                          ---------------
                          
-- Q3) What are the top 6  influences career aspiration for respondents from india                          

SELECT `Influencing Factors`, COUNT(*) AS influence_count
FROM kanchu.`career aspirations`
WHERE country = 'India'
GROUP BY `Influencing Factors`
ORDER BY influence_count DESC
LIMIT 6;
                          -------------
                          
-- Q4) How do career aspiration influences by vary gender in india                          

select gender, `influencing factors`, COUNT(*) AS count
FROM kanchu.`career aspirations`
WHERE country = 'India'
GROUP BY gender, `Influencing Factors`
ORDER BY gender, count DESC;
                        ----------------------
                        
-- Q5) What percentage of respondents are willing to work for a company for at last 3 years                        

SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM kanchu.`career aspirations`)) AS percentage
FROM kanchu.`career aspirations`
WHERE `Working for 3 years in company` = 'Yes';
                           ---------------------------
                         
-- Q6) How many respondents prefer to work for socially impactful companies?                   
                           
SELECT  count(*) AS count
FROM kanchu.`career aspirations`
WHERE `Social impact  Rating` = '6';
							-----------------

-- Q7) How many respondents prefer to work for socially impactful companies vary gender?

select gender, count(*) AS count
FROM kanchu.`career aspirations`
where `Social impact  Rating` ='7'
group by gender;
                           ----------------------
                           
-- Q8) What is the distribution of minimum expected salary in the first three years among respondents?                           

SELECT `Expect monthly slry fresher`, COUNT(*) AS count
FROM kanchu.`career aspirations`
GROUP BY `Expect monthly slry fresher`;
                                --------------------
				
-- Q9) What is the expected minimum monthly salary in hand?

SELECT AVG(`min expect slry entry level`) AS average_salary
FROM kanchu.`career aspirations`;
                               -----------------------------
                               
-- Q10) What percentage of respondents prefer remote working?                               

SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM kanchu.`career aspirations`)) AS percentage
FROM kanchu.`career aspirations`
WHERE `NO-REMOTE working`= 'Yes';
                                 ---------------

-- Q11) What is the preferred number of daily work hours?

SELECT `Working hours a day`, COUNT(*) AS count
FROM kanchu.`career aspirations`
GROUP BY `working hours a day`;
                            ----------------
                            
-- Q12) What are the common work frustrations among respondents?
                            
SELECT `Work frustrate`, COUNT(*) AS count
FROM kanchu.`career aspirations`
GROUP BY `Work frustrate`
ORDER BY count DESC;
                        --------------------------
                        
-- Q13) How does the need for work-life balance interventions vary by gender?                        

SELECT gender, COUNT(*) AS count
FROM kanchu.`career aspirations`
WHERE `Break period` = 'Yes'
GROUP BY gender;
               ---------------------------
               
-- Q14) How many respondents are willing to work under an abusive manager?               

SELECT COUNT(*) AS count
FROM kanchu.`career aspirations`
WHERE `abusive manager` = 'Yes';
                                    ------------
                                    
-- Q15)What is the distribution of minimum expected salary after five years?                                    

SELECT `Expect monthly slry 5 years  exp`, COUNT(*) AS count
FROM kanchu.`career aspirations`
GROUP BY `Expect monthly slry 5 years  exp`;
                                 -----------------------
                                 
-- Q16)What are the remote working preferences by gender?                                 

SELECT gender, COUNT(*) AS count
FROM  kanchu.`career aspirations`
WHERE `NO-REMOTE working` = 'Yes'
GROUP BY gender;
                         --------------------------
                         
-- Q17)  What are the top work frustrations for each gender?                         

SELECT gender, `work frustrate`, COUNT(*) AS count
FROM kanchu.`career aspirations`
GROUP BY gender, `work frustrate`
ORDER BY gender, count DESC;
                            -----------------------
                            
-- Q18) What factors boost work happiness and productivity for respondents?                            

SELECT `Happier a productive at work`, COUNT(*) AS count
FROM kanchu.`career aspirations`
GROUP BY `Happier a productive at work`
ORDER BY count DESC;
                               ---------------------
                               
-- Q19) What percentage of respondents need sponsorship for education abroad?

SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM kanchu.`career aspirations`)) AS percentage
FROM kanchu.`career aspirations`
WHERE `Higher Education Aspring` = 'Yes';
