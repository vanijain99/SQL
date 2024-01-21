use ineuron;
DROP table VJ_CONSUMER_COMPLAINTS;
CREATE table if not exists VJ_CONSUMER_COMPLAINTS

(    DATE_RECEIVED varchar(50),
     PRODUCT_NAME VARCHAR(50),
     SUB_PRODUCT VARCHAR(100),
     ISSUE VARCHAR(100),
     SUB_ISSUE VARCHAR(100),
     CONSUMER_COMPLAINT_NARRATIVE varchar(400),
     Company_Public_Response varchar(200),
     Company VARCHAR(100),
     State_Name CHAR(20),
     Zip_Code varchar(100),
     Tags VARCHAR(40),
     Consumer_Consent_Provided CHAR(40),
     Submitted_via varchar(100),
     Date_Sent_to_Company varchar(100),
     Company_Response_to_Consumer VARCHAR(100),
     Timely_Response CHAR(20),
     CONSUMER_DISPUTED CHAR(20),
     COMPLAINT_ID int NOT NULL PRIMARY KEY
);

DESCRIBE TABLE VJ_CONSUMER_COMPLAINTS;

load data infile 
'C:/SQL/ConsumerComplaints_new.csv'
into table VJ_CONSUMER_COMPLAINTS
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows ;
SET @@global.sql_mode= '';

select * from VJ_CONSUMER_COMPLAINTS LIMIT 100; 

SELECT DISTINCT * FROM VJ_CONSUMER_COMPLAINTS;

-- SYNTAX : SELECT DISTINCT COL_NAME FROM TABLE_NAME
SELECT DISTINCT PRODUCT_NAME FROM VJ_CONSUMER_COMPLAINTS;
SELECT DISTINCT SUB_PRODUCT FROM VJ_CONSUMER_COMPLAINTS;

SELECT DISTINCT ISSUE FROM VJ_CONSUMER_COMPLAINTS;

select distinct COMPANY from VJ_CONSUMER_COMPLAINTS;
SELECT DISTINCT SUBMITTED_VIA  from VJ_CONSUMER_COMPLAINTS;

-- --------LIKE KEYWORD ----=HIGHLY USED IN SQL --------------------
-- % represents zero,one,or multiple characters
-- _ underscore represnts one,singe chracter
/*

a% - any values that starts with a
%a - any values that ends with a
%word% - any values that has word in any position

_a% - any values that has a in teh second position
a_% - any values that starts with "a" and are atleast 2 chracters in length
a__% - any values that starts with "a" and are atleast 3 chracters in length
a%r - any values that starts with a and ends with r

ab%cd%de%f - any values that starts with ab followed by any characters and then cd and then followed by any characters 
and then de followed by any charcaters and ending with f

*/
-- -a% - any values that starts with a
SELECT DISTINCT * FROM VJ_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME LIKE 'Bank%'; -- - bank at the start followed by any character % AT THE END MEANS Bank followed by any sequence of character

-- %word% - any values that has word in any position
SELECT DISTINCT * FROM VJ_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME LIKE '%account%'; -- anywhere word 'account' appearing in the data 
SELECT DISTINCT * FROM VJ_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME LIKE '%Credit%'; -- anywhere credit

-- %a - any values that ends with a
SELECT DISTINCT * FROM VJ_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME LIKE '%account'; -- AT THE END I NEED ACCOUNT as product name 
SELECT DISTINCT * FROM VJ_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME LIKE '%loan';  -- at the end i need loan keyword to be there

-- _a% - any values that has a in the second position
select * from VJ_CONSUMER_COMPLAINTS where company like '_a%';

-- a_% - any values that starts with "a" and are atleast 2 chracters in length
select * from VJ_CONSUMER_COMPLAINTS where SUBMITTED_VIA like 'F_%'; 

-- a__% - any values that starts with "a" and are atleast 3 chracters in length
SELECT * FROM VJ_CONSUMER_COMPLAINTS WHERE CONSUMER_COMPLAINT_NARRATIVE LIKE 'a__%';


-- a%r - any values that starts with a and ends with r
SELECT * FROM VJ_CONSUMER_COMPLAINTS WHERE SUB_PRODUCT LIKE 'C%t';
select * from VJ_CONSUMER_COMPLAINTS where ISSUE like 'M%e';

create table like_ex(subject varchar(20));
insert into like_ex values
    ('John  Dddoe'),
    ('Joe   Doe'),
    ('John_down'),
    ('Joe down'),
    ('Elaine'),
    (''),    -- empty string
    (null);

SELECT * FROM like_ex;
select subject from like_ex where subject like '%Jo%oe%' 
 order by subject;
 
 select * from vj_consumer_complaints where product_name IN ('Consumer Loan','Debt collection','Mortgage');

SELECT DISTINCT * FROM VJ_CONSUMER_COMPLAINTS WHERE PRODUCT_NAME = 'Consumer Loan' OR 
PRODUCT_NAME = 'Mortage' OR PRODUCT_NAME = 'Debt collection';


SELECT DISTINCT * FROM VJ_CONSUMER_COMPLAINTS 
WHERE COMPANY IN ('Wells Fargo & Company','Citibank','
Bank of America');

SELECT DISTINCT * FROM VJ_CONSUMER_COMPLAINTS WHERE DATE_RECEIVED 
BETWEEN DATE_FORMAT(date '2013-07-29', '%d-%m-%Y') AND DATE_FORMAT(date '2013-07-31', '%d-%m-%Y');






