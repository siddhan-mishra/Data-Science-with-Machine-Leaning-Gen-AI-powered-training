use upgrade;

CREATE DATABASE IF NOT EXISTS ecommerce_analytics;

USE ecommerce_analytics;

CREATE TABLE ecommerce_sales (
    order_id VARCHAR(20) NOT NULL,
    order_date DATE NOT NULL,
    order_time TIME NOT NULL,

    order_status VARCHAR(30) NOT NULL,
    sales_channel VARCHAR(30) NOT NULL,

    customer_id VARCHAR(20) NOT NULL,
    customer_name VARCHAR(150) NOT NULL,
    customer_age TINYINT UNSIGNED NOT NULL,
    gender VARCHAR(20) NOT NULL,
    customer_segment VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,

    customer_city VARCHAR(100) NOT NULL,
    customer_state VARCHAR(100) NOT NULL,
    customer_country VARCHAR(60) NOT NULL,
    region VARCHAR(30) NOT NULL,
    customer_postal_code VARCHAR(20) NOT NULL,

    payment_method VARCHAR(40) NOT NULL,
    payment_status VARCHAR(30) NOT NULL,
    currency CHAR(3) NOT NULL,

    shipping_method VARCHAR(30) NOT NULL,
    warehouse VARCHAR(20) NOT NULL,

    delivery_days DECIMAL(5,2) NULL,
    estimated_delivery_days DECIMAL(5,2) NULL,
    delivery_status VARCHAR(30) NOT NULL,

    return_status VARCHAR(30) NULL,
    return_reason VARCHAR(150) NULL,

    customer_rating DECIMAL(2,1) NULL,
    review_sentiment VARCHAR(20) NULL,
    customer_review TEXT NULL,

    marketing_channel VARCHAR(40) NOT NULL,
    campaign_name VARCHAR(100) NULL,
    coupon_code VARCHAR(50) NULL,

    loyalty_points_earned INT UNSIGNED NOT NULL DEFAULT 0,
    loyalty_points_redeemed INT UNSIGNED NOT NULL DEFAULT 0,

    quantity INT UNSIGNED NOT NULL,

    gross_sales DECIMAL(15,2) NOT NULL,
    discount_amount DECIMAL(15,2) NOT NULL,
    tax_amount DECIMAL(15,2) NOT NULL,
    shipping_cost DECIMAL(15,2) NOT NULL,
    net_sales DECIMAL(15,2) NOT NULL,
    product_cost DECIMAL(15,2) NOT NULL,
    profit DECIMAL(15,2) NOT NULL,

    profit_margin_percentage DECIMAL(7,2) NOT NULL,
    customer_lifetime_value DECIMAL(15,2) NOT NULL,

    is_repeat_customer BOOLEAN NOT NULL,
    customer_order_count INT UNSIGNED NOT NULL,

    PRIMARY KEY (order_id),

    INDEX idx_order_date (order_date),
    INDEX idx_customer_id (customer_id),
    INDEX idx_customer_country (customer_country),
    INDEX idx_customer_state (customer_state),
    INDEX idx_order_status (order_status),
    INDEX idx_payment_status (payment_status),
    INDEX idx_sales_channel (sales_channel),
    INDEX idx_marketing_channel (marketing_channel),
    INDEX idx_warehouse (warehouse)
);


CREATE TABLE credit_card_customer (
    Customer_ID VARCHAR(20) NOT NULL,
    Age TINYINT UNSIGNED NOT NULL,
    Gender VARCHAR(10),
    Annual_Income DECIMAL(15,2),
    Occupation VARCHAR(50),
    Card_Type VARCHAR(20),
    Credit_Limit DECIMAL(15,2),
    Card_Age_Months INT,
    Monthly_Spending DECIMAL(15,2),
    Monthly_Transactions INT,
    Avg_Transaction_Value DECIMAL(15,2),

    Online_Shopping_Spending DECIMAL(15,2),
    Grocery_Spending DECIMAL(15,2),
    Fuel_Spending DECIMAL(15,2),
    Dining_Spending DECIMAL(15,2),
    Travel_Spending DECIMAL(15,2),
    Entertainment_Spending DECIMAL(15,2),
    Utility_Bill_Spending DECIMAL(15,2),

    Outstanding_Balance DECIMAL(15,2),
    Statement_Balance DECIMAL(15,2),
    Payment_Amount DECIMAL(15,2),

    Payment_Ratio DECIMAL(5,4),
    Credit_Utilization DECIMAL(5,4),
    Cash_Advance_Amount DECIMAL(15,2),

    EMI_Count INT,
    International_Transactions INT,

    Reward_Points_Earned INT,
    Reward_Points_Redeemed INT,

    Mobile_App_Login INT,
    Credit_Score INT,

    PRIMARY KEY (Customer_ID)
);
-- Check current status
SHOW GLOBAL VARIABLES LIKE 'local_infile';

-- Enable it
SET GLOBAL local_infile = 1;

-- Verify again (should show ON)
SHOW GLOBAL VARIABLES LIKE 'local_infile';
show variables like 'secure_file_priv';





LOAD DATA  INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/synthetic_credit_card_customer_behavior_dataset.csv"

INTO TABLE credit_card_customer
FIELDS TERMINATED BY ','     -- (Each column in the CSV is separated by a comma (standard CSV format).
ENCLOSED BY '"'              -- Values are wrapped in double quotes " (very common in CSVs).
LINES TERMINATED BY '\n'   -- 
IGNORE 1 LINES;
-- 