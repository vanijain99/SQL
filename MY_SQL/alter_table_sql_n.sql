use ineuron;

-- --WHEN THERE IS NO DATA AVAIALBLE --HARDLY 1-5 % IN REALITY 
CREATE  TABLE vj_sales 
(
  customer_id VARCHAR(1)  ,
  order_date DATE NOT NULL,
  product_id INT not null);

DROP TABLE vj_sales;
  INSERT INTO vj_sales
VALUES
('A', '2021-01-01', '1'),
('B', '2021-01-01', '2'),
('C', '2021-01-07', '2'),
('D', '2021-01-10', '3'),
('E', '2021-01-11', '3'),
('F', '2021-01-11', '3'),
('G', '2021-01-01', '2'),
('H', '2021-01-02', '2'),
('I', '2021-01-04', '1'),
('J', '2021-01-11', '1'),
('K', '2021-01-16', '3'),
('L','2021-01-07', '3'),
('M','2021-01-23', 4); 

select * from vj_sales;

-- THIS WILL COPY ONLY STRUCTURE OF THE TABLE
CREATE  TABLE  vj_sales_COPY LIKE  vj_sales;
DESCRIBE TABLE vj_sales_COPY;
select * from vj_sales_COPY;

-- THIS WILL COPY STRUCTURE AS WELL AS DATA OF THE TABLE
CREATE TABLE  vj_sales_COPY_DATA AS
SELECT * FROM VJ_SALES;

SELECT * FROM VJ_SALES_COPY_DATA;

DESCRIBE TABLE VJ_SALES_COPY_DATA;
DROP TABLE VJ_SALES_COPY_DATA;
CREATE  TABLE VJ_SALES_COPY_DATA AS 
SELECT CUSTOMER_ID,ORDER_DATE FROM VJ_SALES;

CREATE  TABLE  vj_sales_COPY LIKE  vj_sales;

-- ALTER COMMMAND WILL WORK ONLY IF TABLE IS EMPTY IN CASE OF NOT NULL CONSTRAINT. WITHOUT OR WITH ANY OTHER CONSTRAINT IT WILL WORK

ALTER TABLE VJ_SALES_COPY_DATA
ADD COLUMN AGE INT NOT  NULL;

ALTER TABLE VJ_SALES_COPY_DATA
ADD COLUMN COUNTRY VARCHAR(20) DEFAULT 'NONE';



ALTER TABLE VJ_SALES_COPY
ADD COLUMN AGE INT NOT  NULL;

CREATE OR REPLACE TABLE Vj_sales 
(
  customer_id VARCHAR(1) PRIMARY KEY ,
  order_date DATE DEFAULT TO_DATE('2022-12-10'),
  product_id INT not null);

INSERT INTO VJ_SALES(customer_id,product_id)
VALUES('E',5); 

SELECT * FROM VJ_SALES;

drop table vj_sales_copy_data;
-- ADD A PK TO AN EXISTING COLUMN
alter table VJ_SALES_COPY_DATA
ADD PRIMARY KEY (customer_id);

describe VJ_SALES_COPY_DATA;
-- ADDING A PK TO A NEW COLUMN -- WORKS ONLY WHEN TABLE IS EMPTY
ALTER TABLE VJ_SALES_COPY_DATA
DROP PRIMARY KEY;

ALTER TABLE VJ_SALES_COPY_DATA
ADD COLUMN  aadhar_no varchar(15) PRIMARY KEY;

-- ADDING A PK TO A NEW COLUMN ,WHEN TABLE IS NOT EMPTY - THEN IT IS A 2 STEP PROCESS
-- ADD THE COLUMN FIRST AND THEN MAKE IT PK USING 2 STEP PROCESS
alter table VJ_SALES_COPY_DATA
ADD column pan_no varchar(15);

alter table vj_sales_copy_data
ADD PRIMARY KEY (pan_no);

-- get ddl function is used to retrieve a ddl statement that could be used to recreate a specified table
-- the statement includes the constraints currently set on table 
select get_ddl('table','vj_sales') as ddl_statement;


-- update command
ALTER TABLE VJ_SALES_COPY_DATA
ADD COLUMN  aadhar_no varchar(15) ;

Update vj_sales_copy_data
set aadhar_no= 'xxxx-xxxx-xxxx' where aadhar_no is null;