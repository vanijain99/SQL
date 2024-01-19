use ineuron;
select current_date();

select current_time();
select current_timestamp();

-- convert_tz


-- timestampadd
select timestampadd(month,2,sysdate());
select timestampadd(week,2,sysdate());
select timestampadd(day,2,sysdate());
select timestampadd(year,2,sysdate());

-- extract, str_to_date & date 
select EXTRACT(YEAR FROM NOW()) as year_from_date;
select EXTRACT(month FROM NOW()) as month_from_date;
select EXTRACT(day FROM NOW()) as day_from_date;
SELECT STR_TO_DATE('21, 07, 2023', '%d, %m, %Y') As New_form;
SELECT STR_TO_DATE('2023, 07, 21', '%Y, %m, %d') As New_form;
select EXTRACT(day FROM STR_TO_DATE('2023, 07, 21', '%Y, %m, %d')) as day_from_date;
select EXTRACT(day FROM DATE '2020-08-08' ) as day_from_date;
select EXTRACT(YEAR FROM STR_TO_DATE('21, 07, 2023', '%d, %m, %Y')) as year_from_date;
select EXTRACT(YEAR FROM DATE '2020-08-08') as year_from_date;

select EXTRACT(month FROM STR_TO_DATE('21, 07, 2023', '%d, %m, %Y')) as month_from_date;
select EXTRACT(month FROM DATE '2020-08-08') as month_from_date;


select month(current_timestamp() ) as month ,
  day( current_timestamp() ) as day ,
  hour(current_timestamp()) as hour,
  minute(current_timestamp()) as minute,
  second(current_timestamp()) as second;
 
 -- number of week from start of the year
  select week(current_date) as week_from_start_of_the_year;
  select week(str_to_date('05, 02, 2024', '%d, %m, %Y')) as week_from_start_of_the_year;
  
  select month(current_date) as month_from_start_of_the_year;
  select month(str_to_date('05, 02, 2024', '%d, %m, %Y')) as month_from_start_of_the_year;

  select day(current_date) as day_from_start_of_the_year;
  select day(str_to_date('05, 02, 2024', '%d, %m, %Y')) as day_of_month;

  select year(current_date) as year;
  select year(str_to_date('05, 02, 2024', '%d, %m, %Y')) as year_from_date;
  
  -- getting last day  of month from given date
  select last_day(current_date) as last_day_of_given_month_from_date;
  select last_day(str_to_date('05, 02, 2024', '%d, %m, %Y')) as last_day_of_given_month_from_date;
  
  
select DATE '2020-08-08' + INTERVAL '2' day as date_after_2_days;
select DATE '2020-08-08' + INTERVAL '5' month as date_after_5_months;
select DATE '2020-08-08' + INTERVAL '2' year as year_after_2_years;
select DATE '2020-08-08' - INTERVAL '2' day as date_before_2_days;
select DATE '2020-08-08' + INTERVAL '29' hour as date_after_29_hours;

select current_date()  + INTERVAL '2' day as date_after_2_days;
select current_date() + INTERVAL '5' month as date_after_5_months;
select current_date() + INTERVAL '2' year as year_after_2_years;
select current_date() - INTERVAL '2' day as date_before_2_days;
select current_date() + INTERVAL '29' hour as date_after_29_hours;

SELECT QUARTER(CURRENT_DATE) AS QTR;
select QUARTER(date '2022-08-24') as qtr;

-- date format for converting the date in format we want
select DATE_FORMAT(SYSDATE(), '%Y-%m-%d') as date;
select DATE_FORMAT(SYSDATE(), '%d-%m-%y') as date;
select DATE_FORMAT(date '2024-05-20', '%d-%m-%y') as date;
select DATE_FORMAT(date '2024-05-20', '%d-%m-%Y') as date;
select DATE_FORMAT(date '2024-05-20', '%d-%m') as date;
select DATE_FORMAT(date '2024-05-20', '%m-%Y') as date;

SELECT DAYNAME ('2024-01-12') as dayname;
SELECT DAYNAME (CURRENT_DATE) as dayname;

-- datediff
select datediff('2022-06-01',CURRENT_DATE) as difference;
select datediff( '2022-07-23','2023-07-19') as difference;
select datediff(year, '2021-07-23','2023-07-19') as difference;
SELECT DATEDIFF("2017-06-25", "2017-06-15") as difference;


-- month diff
SELECT TIMESTAMPDIFF(MONTH, '2012-05-05', '2012-12-16') as mnth_diff;
SELECT TIMESTAMPDIFF(MONTH, '2012-05-05', '2013-12-16') as mnth_diff;

-- year diff
SELECT TIMESTAMPDIFF(year, '2012-05-05', '2022-12-16') as yr_diff;
SELECT TIMESTAMPDIFF(year, '2012-05-05', current_date()) as yr_diff;

 SELECT DATE_ADD('2006-05-01',INTERVAL 1 DAY);
SELECT DATE_ADD('2006-05-01',INTERVAL 15 DAY);
SELECT DATE_ADD('2006-05-01',INTERVAL 5 month);
SELECT DATE_ADD('2006-05-01',INTERVAL  5 year);

select WEEK(CURRENT_DATE); -- FROM 1ST JAN 2024 HOW MNAY EEKS HAVE SURPASSED
select MONTH(CURRENT_DATE); -- -- FROM 1ST JAN 2024 HOW MNAY MONTHS HAVE SURPASSED
select MONTH(date '2024-05-18'); -- -- FROM 1ST JAN 2024 HOW MNAY MONTHS HAVE SURPASSED


SELECT TIMESTAMPDIFF(day, '2012-05-05', '2012-12-16') as yr_diff;





