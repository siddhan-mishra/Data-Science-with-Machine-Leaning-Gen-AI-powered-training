use upgrade;
select * from `telco-customer-churn`;
-- 1. Find all customers whose MonthlyCharges are higher than the average MonthlyCharges of all customers.
select monthlycharges,msc from (select monthlycharges, avg(monthlycharges) over() as msc from `telco-customer-churn`) as t where monthlycharges>msc; 


-- 2. List the customerID, gender, and tenure of customers who have the same Contract type as customer '7590-VHVEG'.
select customerID, gender,tenure from `telco-customer-churn` where  contract = (select contract from `telco-customer-churn` where customerID='7590-VHVEG');

-- 3. Display customers who pay more than the average MonthlyCharges of customers who have Fiber optic internet service.
select monthlycharges,msc,iscp from (
select monthlycharges,InternetService as iscp, avg(monthlycharges) over() as msc from `telco-customer-churn`) 
as t where monthlycharges>msc and iscp='fiber optic'; 


-- 4. Find all customers who have Churn = 'Yes' and whose TotalCharges is greater than the average TotalCharges of non-churned customers (Churn = 'No').
select churn,totalcharges,(select distinct avg(totalcharges) over(partition by churn)  from`telco-customer-churn` where churn ='no') as avg_no_churn_totalcharges from `telco-customer-churn` 
where totalcharges > (select distinct avg(totalcharges) over(partition by churn)  from`telco-customer-churn` where churn ='no') 
and churn='yes';

-- 5. Retrieve the customerID and PaymentMethod of customers whose tenure is longer than the average tenure of senior citizens (SeniorCitizen = 1).
select customerId,seniorcitizen,tenure,(select distinct avg(tenure) over()  from`telco-customer-churn` where seniorcitizen =1) as senior_citizen_avg_tenure from `telco-customer-churn` 
where tenure > (select distinct avg(tenure) over()  from`telco-customer-churn` where seniorcitizen =1) 
;

-- 6. List customers who have the maximum MonthlyCharges among all customers who have Month-to-month contracts.
select customerid,contract,monthlycharges from `telco-customer-churn`
where monthlycharges=(
		select distinct max(monthlycharges) over() as maxmc 
        from `telco-customer-churn`where contract='month-to-month')
;


-- 7. Find customers who do not have the same InternetService as any customer who has Churn = 'Yes'. 
select customerid,internetservice,churn from`telco-customer-churn` where internetservice not in(select distinct internetservice from`telco-customer-churn` where churn = 'yes');

-- 8. Display the names (customerIDs) of customers who have a higher MonthlyCharges than every customer with DSL internet service.
select customerid,contract,monthlycharges,internetservice from `telco-customer-churn`
where monthlycharges >(
		select distinct max(monthlycharges) over()
        from `telco-customer-churn`where internetservice='dsl');
-- alternate all funtion

		SELECT customerid, contract, monthlycharges FROM `telco-customer-churn`  WHERE monthlycharges > ALL ( SELECT monthlycharges FROM `telco-customer-churn` WHERE internetservice = 'dsl');
        
-- 9. Using a subquery in the FROM clause, find the average tenure of customers grouped by Contract, and then show only those contracts whose average tenure is greater than 30.
select customerid,contract,tenure from (select *,avg(tenure) over(partition by contract) from`telco-customer-churn`) as t  where tenure > 30;

-- 10. Find all customers who have Partner = 'Yes' and whose MonthlyCharges is higher than the average MonthlyCharges of customers who have Partner = 'No'.
SELECT customerID, monthlycharges,(
      SELECT AVG(monthlycharges)
      FROM `telco-customer-churn`
      WHERE partner = 'No'
  )as avg_pertnerno
FROM `telco-customer-churn`
WHERE partner = 'Yes'
  AND monthlycharges > (
      SELECT AVG(monthlycharges)
      FROM `telco-customer-churn`
      WHERE partner = 'No'
  );

-- 11. List customers who exist in the dataset and have the same PaymentMethod as at least one customer who has Churn = 'Yes' (use EXISTS).
SELECT customerID, paymentmethod
FROM `telco-customer-churn` c
WHERE EXISTS (
    SELECT 1
    FROM `telco-customer-churn` sub
    WHERE sub.paymentmethod = c.paymentmethod
      AND sub.churn = 'Yes'
);


-- 12. Find the second highest MonthlyCharges value in the entire table using a subquery (do not use LIMIT or window functions).
SELECT MAX(monthlycharges) AS second_highest
FROM `telco-customer-churn`
WHERE monthlycharges < (
    SELECT MAX(monthlycharges)
    FROM `telco-customer-churn`
);


-- 13. For each Contract type, find the customer(s) who have the highest TotalCharges within that contract. Use a correlated subquery.
SELECT customerID, contract, totalcharges
FROM `telco-customer-churn` c
WHERE totalcharges = (
    SELECT MAX(totalcharges)
    FROM `telco-customer-churn`
    WHERE contract = c.contract
);
-- another option that worked

SELECT c.customerID, c.contract, c.totalcharges
FROM `telco-customer-churn` c
JOIN (
    SELECT contract, MAX(totalcharges) AS max_total
    FROM `telco-customer-churn`
    GROUP BY contract
) AS t
ON c.contract = t.contract
AND c.totalcharges = t.max_total;

-- 14. Write a query that returns customers who have higher MonthlyCharges than the average of their own InternetService group and also have higher tenure than the overall average tenure. (Use two different subqueries.)
