create database home_loans;
use home_loans;

CREATE TABLE branch (
    branch_code INT NOT NULL,
    branch_name VARCHAR(50) NOT NULL,
    branch_latitude DECIMAL(9,6) NOT NULL,
    branch_longitude DECIMAL(9,6) NOT NULL,
    branch_pincode INT NOT NULL,

    PRIMARY KEY (branch_code),
    UNIQUE KEY uq_branch_name (branch_name)
);

CREATE TABLE products (
    product_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,

    PRIMARY KEY (product_id),
    UNIQUE KEY uq_product_name (product_name)
);

CREATE TABLE channel (
    channel_id INT NOT NULL,
    channel_name VARCHAR(100) NOT NULL,

    PRIMARY KEY (channel_id),
    UNIQUE KEY uq_channel_name (channel_name)
);


CREATE TABLE customer (
    customer_number INT NOT NULL,
    applied_loan_amount_in_lacs INT NOT NULL,
    month TINYINT NOT NULL,
    fin_year SMALLINT NOT NULL,
    month_year VARCHAR(7) NOT NULL,

    channel_id INT NOT NULL,
    product_id INT NOT NULL,

    gender VARCHAR(20) NOT NULL,
    occupation VARCHAR(30) NOT NULL,
    age VARCHAR(10) NOT NULL,
    salary VARCHAR(30) NOT NULL,

    branch_code INT NOT NULL,

    PRIMARY KEY (customer_number),

    CONSTRAINT fk_customer_channel
        FOREIGN KEY (channel_id)
        REFERENCES channel(channel_id),

    CONSTRAINT fk_customer_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id),

    CONSTRAINT fk_customer_branch
        FOREIGN KEY (branch_code)
        REFERENCES branch(branch_code)
);


CREATE TABLE sanction_data (
    customer_number INT NOT NULL,
    applied_loan_amount_in_lacs INT NOT NULL,
    month INT NOT NULL,
    fin_year SMALLINT NOT NULL,
    month_year VARCHAR(7) NOT NULL,

    sanction_amt_in_lacs DECIMAL(8,2) NOT NULL,
    disb_amt_in_lacs DECIMAL(8,2) NOT NULL,

    sdf_branch VARCHAR(50) NOT NULL,

    PRIMARY KEY (customer_number),

    CONSTRAINT fk_sanction_customer
        FOREIGN KEY (customer_number)
        REFERENCES customer(customer_number),

    CONSTRAINT fk_sanction_branch
        FOREIGN KEY (sdf_branch)
        REFERENCES branch(branch_name)
);

CREATE TABLE recovery_data (
    customer_number INT NOT NULL,
    month INT NOT NULL,
    fin_year SMALLINT NOT NULL,
    month_year VARCHAR(7) NOT NULL,

    delinquency_months VARCHAR(30) NOT NULL,
    recovery_amount DECIMAL(8,2) NOT NULL,
    recovery_branch VARCHAR(50) NOT NULL,

    PRIMARY KEY (customer_number),

    CONSTRAINT fk_recovery_customer
        FOREIGN KEY (customer_number)
        REFERENCES customer(customer_number),

    CONSTRAINT fk_recovery_branch
        FOREIGN KEY (recovery_branch)
        REFERENCES branch(branch_name)
);



-- 1. Enable Server-Side Local Uploads
SET GLOBAL local_infile = 1;

-- 2. Select your database (Replace with your actual database name)


-- 3. Load Branch Data
LOAD DATA LOCAL INFILE "C:/Users/siddh/Desktop/Codepro/Upgrad classes/projects/Homeloans project/home loans/branch.csv"
INTO TABLE branch
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

-- 4. Load Channel Data
LOAD DATA LOCAL INFILE "C:/Users/siddh/Desktop/Codepro/Upgrad classes/projects/Homeloans project/home loans/channel.csv"
INTO TABLE channel
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

-- 5. Load Customer Data
LOAD DATA LOCAL INFILE "C:/Users/siddh/Desktop/Codepro/Upgrad classes/projects/Homeloans project/home loans/customer.csv"
INTO TABLE customer
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

-- 6. Load Products Data
LOAD DATA LOCAL INFILE "C:/Users/siddh/Desktop/Codepro/Upgrad classes/projects/Homeloans project/home loans/products.csv"
INTO TABLE products
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

-- 7. Load Recovery Data
SET FOREIGN_KEY_CHECKS = 0;
LOAD DATA LOCAL INFILE "C:/Users/siddh/Desktop/Codepro/Upgrad classes/projects/Homeloans project/home loans/Recovery data.csv"
INTO TABLE recovery_data
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

-- 8. Load Sanction Data
LOAD DATA LOCAL INFILE "C:/Users/siddh/Desktop/Codepro/Upgrad classes/projects/Homeloans project/home loans/Sanction data.csv"
INTO TABLE sanction_data
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

SET FOREIGN_KEY_CHECKS = 1;



----
select * from sanction_data;