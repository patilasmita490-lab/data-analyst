create database session5;
-- 1. Use the database

use session5;

-- 2. show tables

show tables;

-- 3. View entire startups table

select * from startups;

-- 4. Order by Query by default orders in ascending

select * from startups
order by profit;

-- 5. Order by MKT in descending order

select * from startups
order by mkt desc;

-- 6. Order by STATE 
select * from startups
order by state;
-- 7. Order by State descending order

select * from startups
order by state desc;


-- 8. Order by STATE and PROFIT

select * from startups
order by state , profit;


-- 9. Order by STATE in asc , Profit in Desc


-- 10. Find out different states counts
select state,count(*) from startups
group by state;


-- 11. Find out average profit based on states and arange 
-- avg profit in desc order

select state,avg(profit) as avgprofit from startups
group by state
order by avgprofit desc;

-- 12. Find out Max MKT based on states and arrange MKT in 
-- ascending order

select state,max(mkt) as max_mkt from startups
group by state 
order by max_mkt asc;


-- 13. Find out std deviation for ADMIN based on states

select state,stddev(admin) from startups
group by state;

-- 14. Find out total Spend by startups
select state,(rnd+mkt+admin) as total_spend from startups
order by total_spend desc;

-- 15. Find out min total spend based on states 

select state,min(rnd+mkt+admin) as min_total_spend from startups
group by state
order by min_total_spend desc;

-- 16. view tables
show tables;
-- 17. view the tips table

select * from tips;

-- 18. Find avg of total bill based on day and time

select day,time,avg(total_bill) as avg_totalbil from tips
group by day,time
order by avg_totalbil desc;
-- 19. Find out sum of total bill and tips based on smoker and 
-- gender order by tips desc

select smoker,sex,sum(total_bill),sum(tip) as sum_tip from tips
group by smoker,sex
order by sum_tip desc;

-- 20. Find out top 5 tips in the data

select * from tips
order by tip desc
limit 5;

-- 21. Find out bottom 3 total_bill in the data
select * from tips
order by total_bill asc
limit 3;
-- 22. Find out highest size in the data
select max(size) from tips;

select * from tips
order by size desc
limit 1;
-- 23. Find out highest total bill

-- 24. Find out highest tip by female and non smoker

select * from tips 
where sex='female' and smoker='no'
order by tip desc
limit 1;

-- 25. Find out third highest tip by female and non smoker

select * from tips 
where sex='female' and smoker='no'
order by tip desc
limit 1
offset 2;

-- 25. Find out the entry where lowest tip was paid

select min(tip) from tips;

select * from tips
where tip=(select min(tip) from tips);

-- Find out 5th lowest tip paid by female, smoker
