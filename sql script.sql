-- What is the total amount of debt owed by all countries in the dataset?
select sum(debt) as total_amount_of_debt
from international_debt_with_missing_values;

-- How many distinct countries are recorded in the dataset?
select count(distinct country_name)
from international_debt_with_missing_values 
where country_name is not null;

-- What are the distinct types of debt indicators, and what do they represent?
select distinct indicator_name
from international_debt_with_missing_values;

-- Which country has the highest total debt, and how much does it owe?
select country_name, sum(debt) as total_debt
from international_debt_with_missing_values 
group by country_name
having length(country_name) > 0
order by total_debt desc
limit 1;

-- What is the average debt across different debt indicators?
select indicator_name, avg(debt) as average_debt
from international_debt_with_missing_values
group by indicator_name
order by average_debt; 

-- Which country has made the highest amount of principal repayments?
select country_name, sum(debt) as principal_repayment
from international_debt_with_missing_values
where indicator_name = 'Principal repayments on external debt, long-term (AMT, current US$)'
AND debt IS NOT NULL
AND country_name > ''
group by country_name
order by principal_repayment desc
limit 1;


-- What is the most common debt indicator across all countries?
select indicator_name, count(distinct country_name) as No_of_countries
from international_debt_with_missing_values
group by indicator_name
order by No_of_countries desc
limit 1;


-- Identify any other key debt trends and summarize your findings.
-- 1. Which countries have the highest new disbursements from external debt?
select country_name, sum(debt) AS total_disbursements
from international_debt_with_missing_values
where indicator_name = 'Disbursements on external debt, long-term (DIS, current US$)'
and debt is not null
and country_name > ''
group by country_name
order by total_disbursements desc
limit 5;



-- 2. Which creditor type (official vs. private) receives the highest total principal repayments?
select 
    case 
        when indicator_name like '%official creditors%' then 'Official Creditors'
        when indicator_name like '%private creditors%' then 'Private Creditors'
        else 'Other'
    end as creditor_type,
sum(debt) as total_principal_repayments
from international_debt_with_missing_values
where indicator_name in ('PPG, official creditors (AMT, current US$)','PPG, private creditors (AMT, current US$)')
group by creditor_type
order by total_principal_repayments desc;
	   


