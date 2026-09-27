create database nexabank;
use nexabank;
CREATE TABLE customers (
    customer_id    INT PRIMARY KEY AUTO_INCREMENT,
    full_name      VARCHAR(100) NOT NULL,
    email          VARCHAR(150) UNIQUE NOT NULL,
    phone          VARCHAR(15),
    city           VARCHAR(50),
    state          VARCHAR(50),
    signup_date    DATE,
    kyc_status     VARCHAR(20) DEFAULT 'Pending',
    credit_score   INT
    -- credit_score NULL for new customers not yet assessed
);

CREATE TABLE accounts (
    account_id     INT PRIMARY KEY AUTO_INCREMENT,
    customer_id    INT NOT NULL,
    account_type   VARCHAR(30),
    balance        DECIMAL(15,2) DEFAULT 0.00,
    opened_date    DATE,
    status         VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE transactions (
    txn_id         INT PRIMARY KEY AUTO_INCREMENT,
    account_id     INT NOT NULL,
    txn_type       VARCHAR(30),
    amount         DECIMAL(15,2),
    txn_date       DATETIME,
    channel        VARCHAR(30),
    merchant       VARCHAR(100),
    status         VARCHAR(20) DEFAULT 'Success',
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE loans (
    loan_id        INT PRIMARY KEY AUTO_INCREMENT,
    customer_id    INT NOT NULL,
    loan_type      VARCHAR(50),
    principal      DECIMAL(15,2),
    interest_rate  DECIMAL(5,2),
    tenure_months  INT,
    disbursed_date DATE,
    status         VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE fraud_flags (
    flag_id        INT PRIMARY KEY AUTO_INCREMENT,
    txn_id         INT NOT NULL,
    flag_reason    VARCHAR(200),
    flagged_date   DATE,
    resolved       TINYINT(1) DEFAULT 0,
    FOREIGN KEY (txn_id) REFERENCES transactions(txn_id)
);



--
--

INSERT INTO customers
  (full_name, email, phone, city, state, signup_date, kyc_status, credit_score) VALUES
('Aarav Sharma',    'aarav@nexabank.in',    '9876543210', 'Bangalore', 'Karnataka',    '2021-03-01', 'Verified', 780),
('Priya Nair',      'priya@nexabank.in',    '9123456780', 'Mumbai',    'Maharashtra',  '2021-05-15', 'Verified', 810),
('Rohit Mehta',     'rohit@nexabank.in',    '9988776655', 'Delhi',     'Delhi',        '2021-07-20', 'Verified', 720),
('Sneha Iyer',      'sneha@nexabank.in',    NULL,         'Chennai',   'Tamil Nadu',   '2022-01-10', 'Verified', 650),
('Kiran Rao',       'kiran@nexabank.in',    '9001122334', 'Hyderabad', 'Telangana',    '2022-03-05', 'Verified', 760),
('Divya Gupta',     'divya@nexabank.in',    NULL,         'Pune',      'Maharashtra',  '2022-05-18', 'Pending',  NULL),
('Arjun Singh',     'arjun@nexabank.in',    '9871234567', 'Bangalore', 'Karnataka',    '2022-07-02', 'Verified', 690),
('Meera Patel',     'meera@nexabank.in',    '9765432108', 'Ahmedabad', 'Gujarat',      '2022-09-25', 'Verified', 730),
('Vikram Joshi',    'vikram@nexabank.in',   '9345612870', 'Kolkata',   'West Bengal',  '2022-11-10', 'Verified', 700),
('Ananya Reddy',    'ananya@nexabank.in',   '9456781230', 'Bangalore', 'Karnataka',    '2023-01-22', 'Verified', 790),
('Suresh Kumar',    'suresh@nexabank.in',   NULL,         'Bangalore', 'Karnataka',    '2023-03-08', 'Pending',  NULL),
('Pooja Verma',     'pooja@nexabank.in',    '9812345670', 'Delhi',     'Delhi',        '2023-04-15', 'Verified', 740),
('Amit Desai',      'amit@nexabank.in',     '9654321870', 'Surat',     'Gujarat',      '2023-06-01', 'Verified', 670),
('Nisha Chaudhary', 'nisha@nexabank.in',    NULL,         'Mumbai',    'Maharashtra',  '2023-07-20', 'Pending',  NULL),
('Raj Pillai',      'raj@nexabank.in',      '9123098765', 'Kochi',     'Kerala',       '2023-08-01', 'Verified', 750),
('Tanya Bose',      'tanya@nexabank.in',    '9900112233', 'Kolkata',   'West Bengal',  '2023-09-14', 'Verified', 810),
('Manish Tiwari',   'manish@nexabank.in',   '9988001122', 'Delhi',     'Delhi',        '2023-10-05', 'Verified', 680),
('Riya Kapoor',     'riya@nexabank.in',     '9876001234', 'Mumbai',    'Maharashtra',  '2023-11-01', 'Verified', 720),
('Deepak Negi',     'deepak@nexabank.in',   '9811001234', 'Jaipur',    'Rajasthan',    '2023-12-10', 'Pending',  NULL),
('Kavita Mishra',   'kavita@nexabank.in',   '9700112233', 'Lucknow',   'Uttar Pradesh','2024-01-05', 'Verified', 660);
-- 
INSERT INTO accounts (customer_id, account_type, balance, opened_date, status) VALUES
(1,  'Savings',  125000.00, '2021-03-02', 'Active'),
(1,  'Current',  850000.00, '2021-03-02', 'Active'),
(2,  'Savings',  320000.00, '2021-05-16', 'Active'),
(3,  'Savings',   45000.00, '2021-07-21', 'Active'),
(3,  'Current',  230000.00, '2021-07-21', 'Active'),
(4,  'Savings',   18000.00, '2022-01-11', 'Active'),
(5,  'Savings',  560000.00, '2022-03-06', 'Active'),
(6,  'Savings',    5000.00, '2022-05-19', 'Active'),
(7,  'Savings',   95000.00, '2022-07-03', 'Active'),
(8,  'Savings',  210000.00, '2022-09-26', 'Active'),
(9,  'Savings',   33000.00, '2022-11-11', 'Active'),
(9,  'Current',  175000.00, '2022-11-11', 'Active'),
(10, 'Savings',  740000.00, '2023-01-23', 'Active'),
(11, 'Savings',    2500.00, '2023-03-09', 'Inactive'),
(12, 'Savings',  158000.00, '2023-04-16', 'Active'),
(13, 'Savings',   27000.00, '2023-06-02', 'Active'),
(14, 'Savings',    8500.00, '2023-07-21', 'Active'),
(15, 'Savings',  410000.00, '2023-08-02', 'Active'),
(16, 'Savings',  295000.00, '2023-09-15', 'Active'),
(17, 'Savings',   62000.00, '2023-10-06', 'Active'),
(18, 'Current',  380000.00, '2023-11-02', 'Active'),
(19, 'Savings',   15000.00, '2023-12-11', 'Active'),
(20, 'Savings',   42000.00, '2024-01-06', 'Active'),
(2,  'Current',  490000.00, '2023-02-01', 'Active');
-- account_id 14 (Suresh/customer 11) is Inactive — tests status filtering



-- SQL
-- TRANSACTIONS (30 rows — Debit / Credit / Transfer; Success / Failed)
INSERT INTO transactions
  (account_id, txn_type, amount, txn_date, channel, merchant, status) VALUES
(1,  'Debit',  12500.00, '2024-01-05 10:22:00', 'Mobile', 'Amazon India',        'Success'),
(1,  'Debit',   8200.00, '2024-01-18 14:05:00', 'Mobile', 'Swiggy',              'Success'),
(2,  'Credit',500000.00, '2024-01-20 09:00:00', 'NEFT',   'Salary Credit',       'Success'),
(3,  'Debit',  22000.00, '2024-02-03 11:30:00', 'ATM',    'ATM Withdrawal',      'Success'),
(3,  'Debit',  15000.00, '2024-02-14 16:45:00', 'POS',    'Croma Electronics',   'Success'),
(5,  'Debit',  45000.00, '2024-02-22 09:15:00', 'NEFT',   'Home Loan EMI',       'Success'),
(4,  'Credit', 18000.00, '2024-02-28 12:00:00', 'NEFT',   'Salary Credit',       'Success'),
(6,  'Debit',    500.00, '2024-03-01 08:30:00', 'Mobile', 'Recharge',            'Failed'),
(7,  'Debit',  30000.00, '2024-03-07 13:20:00', 'Mobile', 'MakeMyTrip',          'Success'),
(8,  'Credit',250000.00, '2024-03-10 10:00:00', 'NEFT',   'Salary Credit',       'Success'),
(9,  'Debit',   5500.00, '2024-03-15 15:40:00', 'POS',    'Big Bazaar',          'Success'),
(10, 'Debit',  18000.00, '2024-03-22 11:00:00', 'Mobile', 'HDFC Insurance',      'Success'),
(11, 'Debit',   7200.00, '2024-04-01 09:45:00', 'ATM',    'ATM Withdrawal',      'Success'),
(12, 'Credit', 12000.00, '2024-04-05 14:30:00', 'UPI',    'Freelance Income',    'Success'),
(1,  'Debit',  95000.00, '2024-04-10 10:20:00', 'NEFT',   'Car Loan EMI',        'Success'),
(13, 'Credit',180000.00, '2024-04-15 09:00:00', 'NEFT',   'Salary Credit',       'Success'),
(2,  'Debit', 200000.00, '2024-04-20 16:00:00', 'NEFT',   'Property Purchase',   'Success'),
(14, 'Debit',  50000.00, '2024-04-25 11:30:00', 'Mobile', 'Jewellery Purchase',  'Success'),
(3,  'Debit',  12000.00, '2024-05-02 10:00:00', 'Mobile', 'Netflix/OTT',         'Success'),
(16, 'Credit',  8500.00, '2024-05-08 12:20:00', 'UPI',    'Freelance Income',    'Success'),
(5,  'Debit',  45000.00, '2024-05-22 09:15:00', 'NEFT',   'Home Loan EMI',       'Success'),
(17, 'Debit',   3200.00, '2024-05-28 14:50:00', 'Mobile', 'Grocery App',         'Failed'),
(18, 'Debit', 150000.00, '2024-06-05 10:30:00', 'NEFT',   'Business Payment',    'Success'),
(19, 'Credit', 25000.00, '2024-06-10 09:00:00', 'NEFT',   'Salary Credit',       'Success'),
(10, 'Debit',  55000.00, '2024-06-15 11:45:00', 'NEFT',   'Fixed Deposit',       'Success'),
(1,  'Debit',   4800.00, '2024-06-20 13:10:00', 'Mobile', 'Zomato',              'Success'),
(20, 'Credit', 42000.00, '2024-07-01 09:00:00', 'NEFT',   'Salary Credit',       'Success'),
(22, 'Debit',  75000.00, '2024-07-05 10:20:00', 'NEFT',   'Business Expense',    'Success'),
(15, 'Debit',  22000.00, '2024-07-12 15:30:00', 'POS',    'Apple Store',         'Success'),
(8,  'Debit',  30000.00, '2024-07-20 14:00:00', 'Mobile', 'Investment App',      'Failed');



-- SQL
-- LOANS (15 rows — Home, Personal, Auto, Education loans)
INSERT INTO loans
  (customer_id, loan_type, principal, interest_rate, tenure_months, disbursed_date, status) VALUES
(1,  'Auto Loan',        650000.00, 8.50, 60,  '2022-06-01', 'Active'),
(2,  'Home Loan',       4500000.00, 7.20, 240, '2021-09-01', 'Active'),
(3,  'Personal Loan',    250000.00, 12.50, 36, '2023-01-15', 'Active'),
(4,  'Education Loan',   800000.00, 9.00, 84,  '2022-08-01', 'Active'),
(5,  'Home Loan',       3800000.00, 7.50, 240, '2022-06-15', 'Active'),
(6,  'Personal Loan',     50000.00, 14.00, 12, '2023-06-01', 'Closed'),
(7,  'Auto Loan',        420000.00, 9.20, 48,  '2023-03-01', 'Active'),
(8,  'Home Loan',       2800000.00, 7.80, 180, '2022-12-01', 'Active'),
(9,  'Personal Loan',    120000.00, 13.00, 24, '2024-01-10', 'Active'),
(10, 'Gold Loan',        180000.00, 10.50, 18, '2023-07-01', 'Active'),
(12, 'Personal Loan',    200000.00, 12.00, 36, '2023-08-15', 'Active'),
(13, 'Auto Loan',        350000.00, 9.50, 48,  '2023-11-01', 'Active'),
(15, 'Home Loan',       5200000.00, 7.10, 300, '2023-09-01', 'Active'),
(1,  'Personal Loan',    100000.00, 11.50, 24, '2024-02-01', 'Active'),
(16, 'Education Loan',   600000.00, 8.75, 60,  '2024-01-20', 'Active');
-- customer_id 11, 14, 17–20: no loans — useful for LEFT JOIN practice
 

-- fault flags 
INSERT INTO fraud_flags (txn_id, flag_reason, flagged_date, resolved) VALUES 
 
(18, 'Large jewellery purchase — unusual spending pattern', '2024-04-25', 0), 
 
(8,  'Failed transaction — insufficient funds pattern',    '2024-03-01', 1), 
 
(17, 'Large transfer — sudden balance drop',               '2024-04-20', 0), 
 
(22, 'Failed transaction — suspicious merchant',           '2024-05-28', 1), 
 
(30, 'Failed — 3rd failed attempt in 24 hours',            '2024-07-20', 0), 
 
(15, 'Unusually large single debit on ATM',                '2024-02-22', 1), 
 
(28, 'Large NEFT — new beneficiary no OTP confirm',        '2024-07-05', 0), 
 
(23, 'Business payment — amount exceeds 30-day avg x10',  '2024-06-05', 0), 
 
(25, 'Large FD creation — source of funds unclear',        '2024-06-15', 1), 
 
(29, 'POS txn — card used in different city simultaneously','2024-07-12', 0);



-- 1. List all Verified customers with a credit score above 700, sorted by score descending.
select * from customers where kyc_status='verified' and credit_score > 700 order by credit_score desc;

-- 2. Find all customers who have a NULL phone number OR a NULL credit score.
select * from customers where isnull(phone) or isnull(credit_score);

-- 3. Show all Active Savings accounts with a balance above Rs 1,00,000.
select * from accounts where account_type ='savings' and balance > 100000;

-- 4. List all distinct transaction channels used for Successful transactions in 2024
select distinct channel from transactions where year(txn_date)='2024' and status='success'  ;


-- 5. Show all failed transactions with the customer's name. (3-table JOIN)
select cu.full_name,ac.account_type,ac.balance,cu.credit_score,tx.amount as transaction_amount,tx.txn_date,tx.channel,tx.status
from transactions as tx inner join accounts as ac on tx.account_id=ac.account_id
inner join customers as cu on ac.customer_id=cu.customer_id where tx.status = "failed";

-- 6. Total debit amount per customer for Successful transactions in 2024.
select distinct cu.customer_id,cu.full_name, sum(ac.balance) over(partition by cu.customer_id),sum(ac.balance) over(partition by cu.customer_id)-sum(tx.amount) over(partition by cu.customer_id) from 
transactions as tx inner join accounts as ac on tx.account_id=ac.account_id
right join customers as cu on ac.customer_id=cu.customer_id
 ;

-- 7.Which states have more than 2 Verified customers? Sort by count descending.
select count(state) as verified_customer,state from customers where kyc_status='verified' group by state having verified_customer>2;

