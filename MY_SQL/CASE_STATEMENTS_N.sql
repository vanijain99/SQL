use ineuron;
select * from vj_consumer_complaints;

select *,
case
     when submitted_via in ('Refferal','Postal mail','Email') then 'outbound'
     when submitted_via in ('Phone','Web') then 'inbound'
     else 'electronics'
end as submission_type
from vj_consumer_complaints;

SELECT DATE_RECEIVED, PRODUCT_NAME ,SUB_PRODUCT,ISSUE,submitted_via,
        CASE WHEN SUBMITTED_VIA IN ('Referral','Postal Mail','Email') THEN 'Outbound'
             WHEN SUBMITTED_VIA IN ('Phone','Web') THEN 'Inbound'
             ELSE 'Electronics'
        END AS Submission_Type,
         COMPANY,STATE_NAME,ZIP_CODE
FROM VJ_CONSUMER_COMPLAINTS;

select *,
    CASE 
        wHen Product_Name like '%loan%' or Product_Name like '%Loan%' then 'Loan type'-- THIS U CAN AVOIUD 
        when Product_Name in ('Bank account or service','Mortgage','Debt collection', 
                              'Credit reporting','Money transfers') then 'service'
        else 'other'
        
    end as Finance_type 
    from vj_consumer_complaints;
    
    
    ----- OPTIMIZED CODE
    SELECT *,
               CASE 
	                WHEN LOWER(PRODUCT_NAME) LIKE '%loan' THEN 'Loan'
	                WHEN UPPER(PRODUCT_NAME) IN('BANK ACCOUNT OR SERVICE','MORTGAGE','DEBT CLLECTION','CREDIT CARD','CREDIT REPORTING','MONEY TRANSFERS') THEN 'Service'
	ELSE 'Other'
END AS FINANCE_TYPE
FROM vj_consumer_complaints;

SELECT *,
	CASE
	WHEN SUB_PRODUCT = 'I do not know' or SUB_PRODUCT is null THEN 'NA'
	WHEN lower(SUB_PRODUCT) LIKE '%loan' THEN 'LOAN'
	WHEN lower(SUB_PRODUCT) LIKE '%card' THEN 'CARD'
	WHEN lower(SUB_PRODUCT) LIKE '%mortage' THEN 'MORTGAGE'
	ELSE SUB_PRODUCT
    END AS SUB_PRODUCT_TYPE
FROM VJ_CONSUMER_COMPLAINTS;

SELECT DISTINCT COMPANY_RESPONSE_TO_CONSUMER FROM VJ_CONSUMER_COMPLAINTS;
SELECT *,
       CASE WHEN COMPANY_RESPONSE_TO_CONSUMER = 'Closed with explanation' THEN 'EXPLAINED'
            WHEN COMPANY_RESPONSE_TO_CONSUMER = 'Closed with monetary relief' THEN 'MONETARY RELIEF PROVIDED'
            WHEN COMPANY_RESPONSE_TO_CONSUMER LIKE '%Closed%' THEN 'Closed'
            ELSE COMPANY_RESPONSE_TO_CONSUMER
        END AS COMPANY_RESPONSE_TO_CONSUMER_TYPE
    FROM VJ_CONSUMER_COMPLAINTS;

CREATE OR REPLACE VIEW  VJ_COMPANY_RESPONSE_TO_CONSUMER AS
SELECT DATE_RECEIVED,PRODUCT_NAME,SUB_PRODUCT,ISSUE,COMPANY,STATE_NAME,ZIP_CODE,SUBMITTED_VIA,

         CASE WHEN SUBMITTED_VIA IN ('Referral','Postal Mail','Email') THEN 'Outbound'
              WHEN SUBMITTED_VIA IN ('Phone','Web') THEN 'Inbound'
             ELSE 'Electronics'
         END AS Submission_Type,
         
         case 
               when SUB_PRODUCT = 'I do not know' or SUB_PRODUCT is NULL THEN 'NA'
               when lower (SUB_PRODUCT) LIKE '%loan' THEN 'LOAN'
               when lower (SUB_PRODUCT) LIKE  '%card' THEN 'CARD'
               when lower (SUB_PRODUCT) LIKE '%mortgage' THEN 'MORTGAGE'
               ELSE SUB_PRODUCT
         END AS SUB_PRODUCT_TYPE,
         
         CASE 
             WHEN COMPANY_RESPONSE_TO_CONSUMER = 'Closed with explanation' THEN 'Explained'
             WHEN COMPANY_RESPONSE_TO_CONSUMER = 'Closed with monetary relief' THEN 'Monetary releif provided'
             WHEN COMPANY_RESPONSE_TO_CONSUMER LIKE '%Closed%' THEN 'Closed'
             ELSE COMPANY_RESPONSE_TO_CONSUMER
        END AS COMPANY_RESPONSE_CONSUMER_TYPE
        
FROM VJ_CONSUMER_COMPLAINTS;

SELECT * FROM VJ_COMPANY_RESPONSE_TO_CONSUMER;
