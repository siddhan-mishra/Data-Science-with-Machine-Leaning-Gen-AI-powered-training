create database ecommerce_db;
use ecommerce_db;
CREATE TABLE customers (
    customer_id   INT PRIMARY KEY,
    full_name     VARCHAR(80)  NOT NULL,
    email         VARCHAR(120) NOT NULL UNIQUE,
    city          VARCHAR(50)  NOT NULL,
    country       VARCHAR(50)  NOT NULL,
    signup_date   DATE         NOT NULL
);
CREATE TABLE product_categories (
    category_id        INT PRIMARY KEY,
    category_name      VARCHAR(60) NOT NULL,
    parent_category_id INT NULL,
    CONSTRAINT fk_category_parent
        FOREIGN KEY (parent_category_id) REFERENCES product_categories(category_id)
);
CREATE TABLE products (
    product_id     INT PRIMARY KEY,
    product_name   VARCHAR(100)  NOT NULL,
    category_id    INT           NOT NULL,
    unit_price     DECIMAL(10,2) NOT NULL,
    stock_quantity INT           NOT NULL DEFAULT 0,
    CONSTRAINT fk_products_category
        FOREIGN KEY (category_id) REFERENCES product_categories(category_id)
);

CREATE TABLE orders (
    order_id      INT PRIMARY KEY,
    customer_id   INT  NOT NULL,
    order_date    DATE NOT NULL,
    status        ENUM('PLACED','SHIPPED','DELIVERED','CANCELLED','RETURNED') NOT NULL,
    shipping_city VARCHAR(50) NOT NULL,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10 , 2 ) NOT NULL,
    discount_pct DECIMAL(5 , 2 ) NOT NULL DEFAULT 0,
    CONSTRAINT fk_items_order FOREIGN KEY (order_id)
        REFERENCES orders (order_id),
    CONSTRAINT fk_items_product FOREIGN KEY (product_id)
        REFERENCES products (product_id)
);

INSERT INTO customers VALUES
(1,'Ananya Mishra','ananya.mishra@mail.com','Bhubaneswar','India','2023-02-11'),
(2,'Rahul Sahoo','rahul.sahoo@mail.com','Cuttack','India','2023-03-04'),
(3,'Priya Nair','priya.nair@mail.com','Kochi','India','2023-05-19'),
(4,'Vikram Rathore','vikram.r@mail.com','Jaipur','India','2023-06-27'),
(5,'Sneha Kulkarni','sneha.k@mail.com','Pune','India','2023-08-02'),
(6,'Daniel Okafor','d.okafor@mail.com','Lagos','Nigeria','2023-09-14'),
(7,'Emily Carter','emily.carter@mail.com','Manchester','UK','2023-10-30'),
(8,'Mohit Bansal','mohit.bansal@mail.com','Delhi','India','2024-01-08'),
(9,'Laura Gomez','laura.gomez@mail.com','Madrid','Spain','2024-02-17'),
(10,'Arjun Deshpande','arjun.d@mail.com','Pune','India','2024-03-21'),
(11,'Fatima Sheikh','fatima.sheikh@mail.com','Hyderabad','India','2024-05-09'),
(12,'Kevin Park','kevin.park@mail.com','Seoul','South Korea','2024-07-15');

-- ------------------------------------------------------- product_categories
INSERT INTO product_categories VALUES
(1,'Electronics',NULL),
(2,'Home & Kitchen',NULL),
(3,'Fashion',NULL),
(4,'Mobiles',1),
(5,'Computers',1),
(6,'Audio',1),
(7,'Smartphones',4),
(8,'Feature Phones',4),
(9,'Laptops',5),
(10,'Gaming Laptops',9),
(11,'Cookware',2),
(12,'Small Appliances',2),
(13,'Men''s Wear',3),
(14,'Women''s Wear',3),
(15,'Headphones',6),
(16,'Speakers',6);
-- ----------------------------------------------------------------- products
INSERT INTO products VALUES
(101,'Zephyr X5 Smartphone',7,42999.00,48),
(102,'Zephyr Lite 4G',7,15499.00,120),
(103,'NovaCall Classic 2G',8,1799.00,300),
(104,'ProBook Air 14',9,68999.00,25),
(105,'ProBook Ultra 16',9,109999.00,12),
(106,'RaptorEdge RTX Gaming Laptop',10,159999.00,7),
(107,'RaptorEdge Lite Gaming Laptop',10,124999.00,10),
(108,'PulseBeat ANC Headphones',15,8999.00,90),
(109,'PulseBeat Studio Wired',15,3499.00,140),
(110,'BoomDome Party Speaker',16,12499.00,35),
(111,'BoomDome Mini',16,2999.00,210),
(112,'IronChef Triply Saucepan',11,2199.00,85),
(113,'IronChef Cast Iron Skillet',11,3299.00,60),
(114,'BrewMaster Drip Coffee Machine',12,5499.00,40),
(115,'WhirlBlend 750W Mixer',12,4199.00,55),
(116,'UrbanThread Oxford Shirt',13,1899.00,180),
(117,'UrbanThread Chino Trousers',13,2299.00,150),
(118,'BloomWear Kurta Set',14,2799.00,130);

-- ------------------------------------------------------------------- orders
INSERT INTO orders VALUES
(1001, 1,'2024-01-09','DELIVERED','Bhubaneswar'),
(1002, 3,'2024-01-21','DELIVERED','Kochi'),
(1003, 5,'2024-02-03','DELIVERED','Pune'),
(1004, 1,'2024-02-14','RETURNED','Bhubaneswar'),
(1005, 7,'2024-02-26','DELIVERED','Manchester'),
(1006, 2,'2024-03-05','DELIVERED','Cuttack'),
(1007, 8,'2024-03-17','CANCELLED','Delhi'),
(1008, 4,'2024-03-29','DELIVERED','Jaipur'),
(1009, 1,'2024-04-08','DELIVERED','Bhubaneswar'),
(1010, 9,'2024-04-19','DELIVERED','Madrid'),
(1011, 6,'2024-05-02','SHIPPED','Lagos'),
(1012,10,'2024-05-16','DELIVERED','Pune'),
(1013, 5,'2024-05-28','DELIVERED','Pune'),
(1014, 3,'2024-06-07','DELIVERED','Kochi'),
(1015,11,'2024-06-22','DELIVERED','Hyderabad'),
(1016, 1,'2024-07-04','DELIVERED','Bhubaneswar'),
(1017,12,'2024-07-18','DELIVERED','Seoul'),
(1018, 8,'2024-08-01','DELIVERED','Delhi'),
(1019, 2,'2024-08-13','RETURNED','Cuttack'),
(1020,10,'2024-08-27','DELIVERED','Pune'),
(1021, 7,'2024-09-06','DELIVERED','Manchester'),
(1022, 5,'2024-09-23','DELIVERED','Pune'),
(1023, 4,'2024-10-11','DELIVERED','Jaipur'),
(1024,11,'2024-10-25','DELIVERED','Hyderabad'),
(1025, 1,'2024-11-08','DELIVERED','Bhubaneswar'),
(1026, 9,'2024-11-19','CANCELLED','Madrid'),
(1027,12,'2024-12-02','DELIVERED','Seoul'),
(1028, 3,'2024-12-15','PLACED','Kochi'),
(1029,10,'2024-12-27','PLACED','Pune');

-- -------------------------------------------------------------- order_items
INSERT INTO order_items VALUES
(1,1001,101,1,42999.00, 5.00),
(2,1001,108,2, 8999.00, 0.00),
(3,1002,112,3, 2199.00, 0.00),
(4,1002,114,1, 5499.00,10.00),
(5,1003,104,1,68999.00, 0.00),
(6,1004,116,2, 1899.00, 0.00),
(7,1004,117,1, 2299.00, 0.00),
(8,1005,106,1,159999.00,2.50),
(9,1005,109,1, 3499.00, 0.00),
(10,1006,102,2,15499.00, 0.00),
(11,1006,111,4, 2999.00,15.00),
(12,1007,105,1,109999.00,0.00),
(13,1008,113,2, 3299.00, 0.00),
(14,1008,115,1, 4199.00, 5.00),
(15,1009,110,1,12499.00, 0.00),
(16,1009,118,3, 2799.00,10.00),
(17,1010,104,1,68999.00, 7.50),
(18,1011,103,5, 1799.00, 0.00),
(19,1011,111,2, 2999.00, 0.00),
(20,1012,107,1,124999.00,0.00),
(21,1012,108,1, 8999.00,10.00),
(22,1013,112,2, 2199.00, 0.00),
(23,1013,116,3, 1899.00, 5.00),
(24,1014,101,1,42999.00, 0.00),
(25,1015,114,2, 5499.00, 0.00),
(26,1015,115,1, 4199.00, 0.00),
(27,1016,105,1,109999.00,5.00),
(28,1016,109,2, 3499.00, 0.00),
(29,1017,106,1,159999.00,0.00),
(30,1017,110,2,12499.00, 5.00),
(31,1018,102,1,15499.00, 0.00),
(32,1018,117,2, 2299.00, 0.00),
(33,1019,118,4, 2799.00, 0.00),
(34,1020,104,2,68999.00,10.00),
(35,1021,113,1, 3299.00, 0.00),
(36,1021,112,2, 2199.00, 0.00),
(37,1022,101,1,42999.00, 7.50),
(38,1022,111,3, 2999.00, 0.00),
(39,1023,107,1,124999.00,5.00),
(40,1023,108,1, 8999.00, 0.00),
(41,1024,116,5, 1899.00,10.00),
(42,1024,118,2, 2799.00, 0.00),
(43,1025,105,1,109999.00,0.00),
(44,1025,110,1,12499.00,10.00),
(45,1026,106,1,159999.00,0.00),
(46,1027,103,10,1799.00, 0.00),
(47,1027,109,3, 3499.00, 5.00),
(48,1028,114,1, 5499.00, 0.00),
(49,1028,115,2, 4199.00, 0.00),
(50,1029,102,1,15499.00, 0.00),
(51,1029,117,3, 2299.00, 5.00);


CREATE DATABASE university_db;
USE university_db;




CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    full_name  VARCHAR(80) NOT NULL,
    department VARCHAR(60) NOT NULL,
    hire_date  DATE        NOT NULL,
    is_active  TINYINT(1)  NOT NULL DEFAULT 1
);

CREATE TABLE students (
    student_id      INT PRIMARY KEY,
    full_name       VARCHAR(80) NOT NULL,
    major           VARCHAR(60) NOT NULL,
    enrollment_year YEAR        NOT NULL,
    date_of_birth   DATE        NOT NULL,
    city            VARCHAR(50) NOT NULL
);

CREATE TABLE courses (
    course_id   INT PRIMARY KEY,
    course_code VARCHAR(10) NOT NULL UNIQUE,
    course_name VARCHAR(90) NOT NULL,
    department  VARCHAR(60) NOT NULL,
    credits     INT         NOT NULL,
    teacher_id  INT         NOT NULL,
    CONSTRAINT fk_courses_teacher
        FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id    INT NOT NULL,
    course_id     INT NOT NULL,
    semester      VARCHAR(10) NOT NULL,          -- e.g. '2024-ODD'
    grade_point   DECIMAL(3,1) NULL,             -- 0.0 to 10.0, NULL = not graded yet
    status        ENUM('ENROLLED','COMPLETED','DROPPED','FAILED') NOT NULL,
    CONSTRAINT fk_enroll_student FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT fk_enroll_course  FOREIGN KEY (course_id)  REFERENCES courses(course_id),
    CONSTRAINT uq_enrollment UNIQUE (student_id, course_id, semester)
);

-- ----------------------------------------------------------------- teachers
INSERT INTO teachers VALUES
(1,'Dr. Sudhir Panigrahi','Computer Science','2015-07-01',1),
(2,'Dr. Meenakshi Rao','Computer Science','2018-01-15',1),
(3,'Prof. Alan Whitfield','Mathematics','2012-08-20',1),
(4,'Dr. Ritika Jain','Mathematics','2020-06-10',1),
(5,'Dr. Samuel Mensah','Physics','2016-09-05',1),
(6,'Prof. Kavita Iyer','Electronics','2011-03-12',0),
(7,'Dr. Neeraj Kapoor','Electronics','2019-11-01',1),
(8,'Dr. Hiroshi Tanaka','Management','2021-02-18',1);

-- ----------------------------------------------------------------- students
INSERT INTO students VALUES
(1,'Aditi Rout','Computer Science',2022,'2004-04-12','Bhubaneswar'),
(2,'Suraj Behera','Computer Science',2022,'2004-01-30','Cuttack'),
(3,'Nikita Sharma','Mathematics',2022,'2003-11-22','Delhi'),
(4,'Imran Qureshi','Electronics',2022,'2004-07-08','Lucknow'),
(5,'Pooja Reddy','Computer Science',2023,'2005-02-14','Hyderabad'),
(6,'Tanmay Ghosh','Physics',2023,'2004-12-01','Kolkata'),
(7,'Sarah Mathew','Mathematics',2023,'2005-05-19','Kochi'),
(8,'Rohan Patil','Electronics',2023,'2004-09-27','Pune'),
(9,'Divya Menon','Computer Science',2023,'2005-03-03','Chennai'),
(10,'Aman Tripathi','Management',2024,'2006-06-11','Varanasi'),
(11,'Chloe Bennett','Computer Science',2024,'2005-10-25','Bristol'),
(12,'Kartik Joshi','Physics',2024,'2006-01-17','Nagpur'),
(13,'Ishita Bose','Mathematics',2024,'2005-08-09','Kolkata'),
(14,'Manish Yadav','Management',2024,'2005-12-30','Jaipur'),
(15,'Farah Ali','Electronics',2024,'2006-03-06','Hyderabad');

-- ------------------------------------------------------------------ courses
INSERT INTO courses VALUES
(1,'CS101','Programming Fundamentals','Computer Science',4,1),
(2,'CS201','Database Management Systems','Computer Science',4,2),
(3,'CS301','Operating Systems','Computer Science',3,1),
(4,'CS401','Machine Learning','Computer Science',4,2),
(5,'MA101','Calculus I','Mathematics',4,3),
(6,'MA202','Linear Algebra','Mathematics',3,4),
(7,'MA303','Probability & Statistics','Mathematics',4,3),
(8,'PH101','Mechanics','Physics',4,5),
(9,'PH202','Quantum Physics','Physics',3,5),
(10,'EC101','Digital Electronics','Electronics',4,7),
(11,'EC202','Signals & Systems','Electronics',3,7),
(12,'MG101','Principles of Management','Management',3,8),
(13,'MG202','Business Analytics','Management',4,8);

-- -------------------------------------------------------------- enrollments
INSERT INTO enrollments VALUES
(1, 1, 1,'2022-ODD',9.0,'COMPLETED'),
(2, 1, 5,'2022-ODD',8.0,'COMPLETED'),
(3, 1, 2,'2023-ODD',9.5,'COMPLETED'),
(4, 1, 3,'2023-EVEN',8.5,'COMPLETED'),
(5, 1, 4,'2024-ODD',9.0,'COMPLETED'),
(6, 2, 1,'2022-ODD',6.5,'COMPLETED'),
(7, 2, 5,'2022-ODD',4.0,'FAILED'),
(8, 2, 2,'2023-ODD',7.0,'COMPLETED'),
(9, 2, 3,'2023-EVEN',NULL,'DROPPED'),
(10,2, 4,'2024-ODD',7.5,'COMPLETED'),
(11,3, 5,'2022-ODD',9.5,'COMPLETED'),
(12,3, 6,'2023-ODD',9.0,'COMPLETED'),
(13,3, 7,'2023-EVEN',8.5,'COMPLETED'),
(14,3, 1,'2023-EVEN',7.5,'COMPLETED'),
(15,4,10,'2022-ODD',7.0,'COMPLETED'),
(16,4,11,'2023-ODD',6.0,'COMPLETED'),
(17,4, 5,'2022-ODD',5.5,'COMPLETED'),
(18,5, 1,'2023-ODD',8.5,'COMPLETED'),
(19,5, 2,'2024-ODD',9.0,'COMPLETED'),
(20,5, 6,'2024-ODD',8.0,'COMPLETED'),
(21,5, 3,'2024-EVEN',NULL,'ENROLLED'),
(22,6, 8,'2023-ODD',8.0,'COMPLETED'),
(23,6, 9,'2024-ODD',7.5,'COMPLETED'),
(24,6, 5,'2023-ODD',6.5,'COMPLETED'),
(25,7, 5,'2023-ODD',9.0,'COMPLETED'),
(26,7, 6,'2024-ODD',9.5,'COMPLETED'),
(27,7, 7,'2024-EVEN',NULL,'ENROLLED'),
(28,8,10,'2023-ODD',7.5,'COMPLETED'),
(29,8,11,'2024-ODD',3.5,'FAILED'),
(30,9, 1,'2023-ODD',9.5,'COMPLETED'),
(31,9, 2,'2024-ODD',9.5,'COMPLETED'),
(32,9, 4,'2024-EVEN',NULL,'ENROLLED'),
(33,9, 7,'2024-ODD',8.5,'COMPLETED'),
(34,10,12,'2024-ODD',7.0,'COMPLETED'),
(35,10,13,'2024-EVEN',NULL,'ENROLLED'),
(36,11, 1,'2024-ODD',8.0,'COMPLETED'),
(37,11, 5,'2024-ODD',7.0,'COMPLETED'),
(38,11, 2,'2024-EVEN',NULL,'ENROLLED'),
(39,12, 8,'2024-ODD',6.5,'COMPLETED'),
(40,12, 5,'2024-ODD',5.0,'COMPLETED'),
(41,13, 5,'2024-ODD',8.5,'COMPLETED'),
(42,13, 6,'2024-EVEN',NULL,'ENROLLED'),
(43,14,12,'2024-ODD',6.0,'COMPLETED'),
(44,14,13,'2024-EVEN',NULL,'ENROLLED'),
(45,15,10,'2024-ODD',7.5,'COMPLETED'),
(46,15, 5,'2024-ODD',4.5,'FAILED'),
(47, 3, 2,'2024-ODD',8.0,'COMPLETED'),
(48, 6, 7,'2024-EVEN',NULL,'ENROLLED');

CREATE DATABASE company_hr;
USE company_hr;

CREATE TABLE departments (
    department_id   INT PRIMARY KEY,
    department_name VARCHAR(60) NOT NULL,
    location        VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    employee_id   INT PRIMARY KEY,
    full_name     VARCHAR(80) NOT NULL,
    job_title     VARCHAR(60) NOT NULL,
    department_id INT NOT NULL,
    manager_id    INT NULL,                     -- NULL = top of the hierarchy
    hire_date     DATE NOT NULL,
    employment_status ENUM('ACTIVE','RESIGNED','ON_LEAVE') NOT NULL DEFAULT 'ACTIVE',
    CONSTRAINT fk_emp_dept    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    CONSTRAINT fk_emp_manager FOREIGN KEY (manager_id)    REFERENCES employees(employee_id)
);

CREATE TABLE salaries (
    salary_id      INT PRIMARY KEY,
    employee_id    INT NOT NULL,
    base_salary    DECIMAL(12,2) NOT NULL,
    bonus          DECIMAL(12,2) NOT NULL DEFAULT 0,
    effective_from DATE NOT NULL,
    effective_to   DATE NULL,                   -- NULL = currently in effect
    CONSTRAINT fk_sal_emp FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE projects (
    project_id    INT PRIMARY KEY,
    project_name  VARCHAR(90) NOT NULL,
    department_id INT NOT NULL,
    start_date    DATE NOT NULL,
    end_date      DATE NULL,
    budget        DECIMAL(14,2) NOT NULL,
    CONSTRAINT fk_proj_dept FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE project_assignments (
    assignment_id  INT PRIMARY KEY,
    project_id     INT NOT NULL,
    employee_id    INT NOT NULL,
    role_on_project VARCHAR(50) NOT NULL,
    allocation_pct INT NOT NULL,                -- 0-100
    assigned_date  DATE NOT NULL,
    CONSTRAINT fk_pa_project FOREIGN KEY (project_id)  REFERENCES projects(project_id),
    CONSTRAINT fk_pa_emp     FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CONSTRAINT uq_assignment UNIQUE (project_id, employee_id)
);

-- -------------------------------------------------------------- departments
INSERT INTO departments VALUES
(10,'Executive','Bengaluru'),
(20,'Engineering','Bengaluru'),
(30,'Data & Analytics','Hyderabad'),
(40,'Sales','Mumbai'),
(50,'Human Resources','Bengaluru'),
(60,'Finance','Mumbai');

-- ---------------------------------------------------------------- employees
-- Hierarchy: 1 (CEO) -> 2,3,4,5 -> teams below them
INSERT INTO employees VALUES
(1,'Ramesh Iyer','Chief Executive Officer',10,NULL,'2012-04-01','ACTIVE'),
(2,'Nandita Bose','VP Engineering',20,1,'2013-06-15','ACTIVE'),
(3,'Arvind Kulkarni','VP Data & Analytics',30,1,'2015-01-12','ACTIVE'),
(4,'Sheetal Kapoor','VP Sales',40,1,'2014-09-23','ACTIVE'),
(5,'Gopal Krishnan','VP Finance',60,1,'2016-03-07','ACTIVE'),
(6,'Ayesha Khan','Engineering Manager',20,2,'2017-05-02','ACTIVE'),
(7,'Deepak Sinha','Engineering Manager',20,2,'2018-08-19','ACTIVE'),
(8,'Ritu Agarwal','Senior Software Engineer',20,6,'2019-02-11','ACTIVE'),
(9,'Sameer Dutta','Software Engineer',20,6,'2021-07-05','ACTIVE'),
(10,'Priyanka Rao','Software Engineer',20,6,'2022-01-17','ACTIVE'),
(11,'Harsh Vardhan','Senior Software Engineer',20,7,'2019-10-28','ACTIVE'),
(12,'Lakshmi Pillai','QA Engineer',20,7,'2022-06-13','ACTIVE'),
(13,'Tanvi Shah','Analytics Manager',30,3,'2018-04-09','ACTIVE'),
(14,'Rakesh Mohanty','Senior Data Analyst',30,13,'2020-11-23','ACTIVE'),
(15,'Neha Verma','Data Analyst',30,13,'2022-09-01','ACTIVE'),
(16,'Sanjay Pradhan','Data Engineer',30,13,'2021-03-15','ON_LEAVE'),
(17,'Pooja Chandra','Sales Manager',40,4,'2017-12-04','ACTIVE'),
(18,'Vivek Anand','Account Executive',40,17,'2020-02-24','ACTIVE'),
(19,'Sunita Desai','Account Executive',40,17,'2021-08-30','RESIGNED'),
(20,'Manoj Gupta','HR Manager',50,1,'2016-07-18','ACTIVE'),
(21,'Swati Bhatt','HR Executive',50,20,'2022-04-11','ACTIVE'),
(22,'Nikhil Menon','Financial Analyst',60,5,'2020-05-26','ACTIVE'),
(23,'Anjali Saxena','Accountant',60,5,'2023-01-09','ACTIVE'),
(24,'Rohit Pandey','Junior Data Analyst',30,14,'2023-06-19','ACTIVE'),
(25,'Kiran Rawat','Junior Software Engineer',20,8,'2023-09-25','ACTIVE');

-- ----------------------------------------------------------------- salaries
INSERT INTO salaries VALUES
(1,1,450000.00,150000.00,'2022-04-01',NULL),
(2,2,320000.00, 90000.00,'2021-04-01','2023-03-31'),
(3,2,365000.00,110000.00,'2023-04-01',NULL),
(4,3,310000.00, 85000.00,'2021-04-01','2023-03-31'),
(5,3,350000.00,100000.00,'2023-04-01',NULL),
(6,4,300000.00,120000.00,'2022-04-01',NULL),
(7,5,295000.00, 80000.00,'2022-04-01',NULL),
(8,6,185000.00, 40000.00,'2021-04-01','2023-03-31'),
(9,6,210000.00, 50000.00,'2023-04-01',NULL),
(10,7,195000.00,45000.00,'2023-04-01',NULL),
(11,8,145000.00,25000.00,'2022-04-01','2024-03-31'),
(12,8,162000.00,30000.00,'2024-04-01',NULL),
(13,9, 92000.00,12000.00,'2023-04-01',NULL),
(14,10, 88000.00,10000.00,'2023-04-01',NULL),
(15,11,150000.00,28000.00,'2024-04-01',NULL),
(16,12, 78000.00, 8000.00,'2023-04-01',NULL),
(17,13,175000.00,42000.00,'2023-04-01',NULL),
(18,14,132000.00,22000.00,'2023-04-01','2024-03-31'),
(19,14,146000.00,26000.00,'2024-04-01',NULL),
(20,15, 85000.00, 9000.00,'2023-04-01',NULL),
(21,16,105000.00,15000.00,'2023-04-01',NULL),
(22,17,168000.00,60000.00,'2023-04-01',NULL),
(23,18, 96000.00,45000.00,'2023-04-01',NULL),
(24,19, 94000.00,38000.00,'2023-04-01','2024-08-31'),
(25,20,155000.00,25000.00,'2023-04-01',NULL),
(26,21, 72000.00, 7000.00,'2023-04-01',NULL),
(27,22,118000.00,18000.00,'2023-04-01',NULL),
(28,23, 68000.00, 6000.00,'2023-04-01',NULL),
(29,24, 62000.00, 5000.00,'2023-07-01',NULL),
(30,25, 70000.00, 6000.00,'2023-10-01',NULL);

-- ----------------------------------------------------------------- projects
INSERT INTO projects VALUES
(201,'Payments Platform Revamp',20,'2023-05-01','2024-04-30',12500000.00),
(202,'Mobile App v3',20,'2024-01-15',NULL,8200000.00),
(203,'Customer 360 Data Warehouse',30,'2023-09-01','2024-08-31',9600000.00),
(204,'Churn Prediction Model',30,'2024-03-01',NULL,4300000.00),
(205,'Enterprise Sales Expansion',40,'2024-02-01',NULL,6800000.00),
(206,'Automated Payroll System',50,'2023-11-01','2024-06-30',2100000.00),
(207,'Cost Optimisation Program',60,'2024-05-01',NULL,3400000.00);

-- ------------------------------------------------------- project_assignments
INSERT INTO project_assignments VALUES
(1,201, 6,'Project Lead',40,'2023-05-01'),
(2,201, 8,'Tech Lead',60,'2023-05-01'),
(3,201, 9,'Developer',80,'2023-05-15'),
(4,201,12,'QA',50,'2023-06-01'),
(5,202, 7,'Project Lead',50,'2024-01-15'),
(6,202,11,'Tech Lead',70,'2024-01-15'),
(7,202,10,'Developer',90,'2024-02-01'),
(8,202,25,'Developer',100,'2024-02-01'),
(9,202,12,'QA',50,'2024-02-10'),
(10,203,13,'Project Lead',40,'2023-09-01'),
(11,203,16,'Data Engineer',90,'2023-09-01'),
(12,203,14,'Analyst',60,'2023-09-15'),
(13,204,13,'Project Lead',30,'2024-03-01'),
(14,204,14,'Lead Analyst',40,'2024-03-01'),
(15,204,15,'Analyst',80,'2024-03-05'),
(16,204,24,'Junior Analyst',100,'2024-07-01'),
(17,205,17,'Project Lead',60,'2024-02-01'),
(18,205,18,'Account Lead',100,'2024-02-01'),
(19,205,19,'Account Executive',100,'2024-02-01'),
(20,206,20,'Project Lead',50,'2023-11-01'),
(21,206,21,'Coordinator',70,'2023-11-01'),
(22,206, 9,'Developer',20,'2023-12-01'),
(23,207,22,'Lead Analyst',70,'2024-05-01'),
(24,207,23,'Analyst',60,'2024-05-01'),
(25,207,15,'Data Support',20,'2024-06-01');

CREATE DATABASE hospital_db;
USE hospital_db;

CREATE TABLE doctors (
    doctor_id        INT PRIMARY KEY,
    full_name        VARCHAR(80) NOT NULL,
    specialization   VARCHAR(60) NOT NULL,
    department       VARCHAR(60) NOT NULL,
    joining_date     DATE NOT NULL,
    consultation_fee DECIMAL(8,2) NOT NULL
);

CREATE TABLE patients (
    patient_id    INT PRIMARY KEY,
    full_name     VARCHAR(80) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender        ENUM('M','F','OTHER') NOT NULL,
    city          VARCHAR(50) NOT NULL,
    registered_on DATE NOT NULL,
    blood_group   VARCHAR(5) NULL
);

CREATE TABLE appointments (
    appointment_id   INT PRIMARY KEY,
    patient_id       INT NOT NULL,
    doctor_id        INT NOT NULL,
    appointment_date DATE NOT NULL,
    visit_type       ENUM('NEW','FOLLOW_UP','EMERGENCY') NOT NULL,
    status           ENUM('COMPLETED','CANCELLED','NO_SHOW') NOT NULL,
    CONSTRAINT fk_appt_patient FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    CONSTRAINT fk_appt_doctor  FOREIGN KEY (doctor_id)  REFERENCES doctors(doctor_id)
);

CREATE TABLE treatments (
    treatment_id   INT PRIMARY KEY,
    appointment_id INT NOT NULL,
    treatment_name VARCHAR(90) NOT NULL,
    treatment_type ENUM('DIAGNOSTIC','PROCEDURE','MEDICATION','THERAPY') NOT NULL,
    cost           DECIMAL(10,2) NOT NULL,
    treatment_date DATE NOT NULL,
    CONSTRAINT fk_treat_appt FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- ------------------------------------------------------------------ doctors
INSERT INTO doctors VALUES
(1,'Dr. Anil Mohapatra','Cardiology','Cardiac Sciences','2014-03-10',1200.00),
(2,'Dr. Sunita Rani','Cardiology','Cardiac Sciences','2018-07-22',1000.00),
(3,'Dr. Farhan Ahmed','Orthopaedics','Musculoskeletal','2016-11-05',900.00),
(4,'Dr. Leela Nambiar','Paediatrics','Child Health','2013-01-18',700.00),
(5,'Dr. Rajeev Soni','Dermatology','Skin & Cosmetology','2019-05-30',800.00),
(6,'Dr. Grace Owusu','Neurology','Neurosciences','2017-09-12',1500.00),
(7,'Dr. Prakash Naidu','General Medicine','Internal Medicine','2012-06-01',600.00),
(8,'Dr. Meera Saxena','Gynaecology','Womens Health','2020-02-14',950.00);

-- ----------------------------------------------------------------- patients
INSERT INTO patients VALUES
(1,'Bimal Das','1978-05-14','M','Bhubaneswar','2023-01-10','B+'),
(2,'Renu Agrawal','1985-09-02','F','Cuttack','2023-01-24','O+'),
(3,'Sourav Mishra','1996-12-19','M','Bhubaneswar','2023-02-08','A+'),
(4,'Kalpana Sethi','1968-03-27','F','Puri','2023-02-21','AB+'),
(5,'Arun Pattnaik','2015-07-11','M','Bhubaneswar','2023-03-05','O-'),
(6,'Meghna Sahu','1992-11-30','F','Cuttack','2023-03-19','B-'),
(7,'Joseph Fernandes','1959-08-06','M','Rourkela','2023-04-02','A-'),
(8,'Swapna Dash','2001-04-23','F','Bhubaneswar','2023-04-16','O+'),
(9,'Girish Rath','1974-01-09','M','Sambalpur','2023-05-07','B+'),
(10,'Anita Panda','1988-06-15','F','Bhubaneswar','2023-05-28','A+'),
(11,'Tarun Jena','2018-02-28','M','Puri','2023-06-11','O+'),
(12,'Lopamudra Rout','1963-10-21','F','Cuttack','2023-07-03','AB-'),
(13,'Harish Swain','1999-03-17','M','Bhubaneswar','2023-08-20','B+'),
(14,'Nivedita Barik','1981-12-08','F','Rourkela','2023-09-14','O+'),
(15,'Ashok Nayak','1955-04-30','M','Bhubaneswar','2023-10-02','A+');

-- ------------------------------------------------------------- appointments
INSERT INTO appointments VALUES
(1,  1,1,'2024-01-08','NEW','COMPLETED'),
(2,  2,7,'2024-01-12','NEW','COMPLETED'),
(3,  3,3,'2024-01-19','NEW','COMPLETED'),
(4,  1,1,'2024-02-06','FOLLOW_UP','COMPLETED'),
(5,  4,6,'2024-02-13','NEW','COMPLETED'),
(6,  5,4,'2024-02-20','NEW','COMPLETED'),
(7,  6,8,'2024-02-27','NEW','CANCELLED'),
(8,  1,1,'2024-03-05','FOLLOW_UP','COMPLETED'),
(9,  2,7,'2024-03-11','FOLLOW_UP','COMPLETED'),
(10, 7,1,'2024-03-18','EMERGENCY','COMPLETED'),
(11, 8,5,'2024-03-26','NEW','COMPLETED'),
(12, 3,3,'2024-04-04','FOLLOW_UP','COMPLETED'),
(13, 9,7,'2024-04-10','NEW','COMPLETED'),
(14, 4,6,'2024-04-17','FOLLOW_UP','COMPLETED'),
(15,10,8,'2024-04-25','NEW','COMPLETED'),
(16, 1,2,'2024-05-07','FOLLOW_UP','COMPLETED'),
(17,11,4,'2024-05-14','NEW','COMPLETED'),
(18, 5,4,'2024-05-21','FOLLOW_UP','COMPLETED'),
(19,12,6,'2024-05-29','NEW','COMPLETED'),
(20, 7,1,'2024-06-05','FOLLOW_UP','NO_SHOW'),
(21, 8,5,'2024-06-12','FOLLOW_UP','COMPLETED'),
(22,13,3,'2024-06-19','NEW','COMPLETED'),
(23, 2,7,'2024-06-27','FOLLOW_UP','COMPLETED'),
(24, 9,7,'2024-07-03','FOLLOW_UP','COMPLETED'),
(25,14,8,'2024-07-11','NEW','COMPLETED'),
(26, 1,1,'2024-07-18','FOLLOW_UP','COMPLETED'),
(27,10,8,'2024-07-24','FOLLOW_UP','COMPLETED'),
(28,15,1,'2024-08-02','EMERGENCY','COMPLETED'),
(29, 4,6,'2024-08-09','FOLLOW_UP','COMPLETED'),
(30,11,4,'2024-08-16','FOLLOW_UP','COMPLETED'),
(31,12,6,'2024-08-23','FOLLOW_UP','CANCELLED'),
(32, 3,3,'2024-09-04','FOLLOW_UP','COMPLETED'),
(33,13,3,'2024-09-12','FOLLOW_UP','COMPLETED'),
(34,15,1,'2024-09-20','FOLLOW_UP','COMPLETED'),
(35, 6,8,'2024-09-27','NEW','COMPLETED'),
(36, 2,7,'2024-10-08','FOLLOW_UP','COMPLETED'),
(37,14,8,'2024-10-15','FOLLOW_UP','COMPLETED'),
(38, 9,2,'2024-10-22','FOLLOW_UP','COMPLETED'),
(39, 5,4,'2024-11-05','FOLLOW_UP','COMPLETED'),
(40,15,1,'2024-11-13','FOLLOW_UP','COMPLETED'),
(41, 8,5,'2024-11-21','FOLLOW_UP','NO_SHOW'),
(42,10,8,'2024-12-03','FOLLOW_UP','COMPLETED'),
(43, 1,1,'2024-12-10','FOLLOW_UP','COMPLETED'),
(44,13,3,'2024-12-18','FOLLOW_UP','COMPLETED'),
(45, 6,8,'2024-12-26','FOLLOW_UP','COMPLETED');

-- --------------------------------------------------------------- treatments
INSERT INTO treatments VALUES
(1,  1,'ECG','DIAGNOSTIC',900.00,'2024-01-08'),
(2,  1,'Lipid Profile','DIAGNOSTIC',1400.00,'2024-01-08'),
(3,  2,'Complete Blood Count','DIAGNOSTIC',450.00,'2024-01-12'),
(4,  3,'Knee X-Ray','DIAGNOSTIC',800.00,'2024-01-19'),
(5,  3,'Physiotherapy Session','THERAPY',1200.00,'2024-01-19'),
(6,  4,'2D Echocardiogram','DIAGNOSTIC',3200.00,'2024-02-06'),
(7,  5,'MRI Brain','DIAGNOSTIC',9500.00,'2024-02-13'),
(8,  6,'Childhood Vaccination','MEDICATION',1500.00,'2024-02-20'),
(9,  8,'Stress Test','DIAGNOSTIC',2800.00,'2024-03-05'),
(10, 8,'Statin Therapy','MEDICATION',1800.00,'2024-03-05'),
(11, 9,'Thyroid Panel','DIAGNOSTIC',1100.00,'2024-03-11'),
(12,10,'Emergency Angiography','PROCEDURE',42000.00,'2024-03-18'),
(13,10,'ICU Monitoring (24h)','PROCEDURE',18000.00,'2024-03-19'),
(14,11,'Skin Allergy Patch Test','DIAGNOSTIC',2200.00,'2024-03-26'),
(15,12,'Arthroscopy','PROCEDURE',65000.00,'2024-04-04'),
(16,13,'HbA1c Test','DIAGNOSTIC',700.00,'2024-04-10'),
(17,14,'EEG','DIAGNOSTIC',3500.00,'2024-04-17'),
(18,15,'Ultrasound Pelvis','DIAGNOSTIC',1800.00,'2024-04-25'),
(19,16,'Holter Monitoring','DIAGNOSTIC',4200.00,'2024-05-07'),
(20,17,'Paediatric Nebulisation','THERAPY',900.00,'2024-05-14'),
(21,18,'Growth Assessment','DIAGNOSTIC',600.00,'2024-05-21'),
(22,19,'Nerve Conduction Study','DIAGNOSTIC',5200.00,'2024-05-29'),
(23,21,'Laser Acne Treatment','PROCEDURE',7500.00,'2024-06-12'),
(24,22,'Shoulder MRI','DIAGNOSTIC',8800.00,'2024-06-19'),
(25,23,'Vitamin D Test','DIAGNOSTIC',1300.00,'2024-06-27'),
(26,24,'Diabetic Diet Counselling','THERAPY',800.00,'2024-07-03'),
(27,25,'Antenatal Checkup Package','DIAGNOSTIC',3400.00,'2024-07-11'),
(28,26,'2D Echocardiogram','DIAGNOSTIC',3200.00,'2024-07-18'),
(29,27,'Ultrasound Pelvis','DIAGNOSTIC',1800.00,'2024-07-24'),
(30,28,'Emergency Angioplasty','PROCEDURE',185000.00,'2024-08-02'),
(31,28,'ICU Monitoring (48h)','PROCEDURE',36000.00,'2024-08-04'),
(32,29,'MRI Brain (Contrast)','DIAGNOSTIC',12000.00,'2024-08-09'),
(33,30,'Paediatric Nebulisation','THERAPY',900.00,'2024-08-16'),
(34,32,'Physiotherapy Package (5)','THERAPY',5000.00,'2024-09-04'),
(35,33,'Shoulder Steroid Injection','PROCEDURE',4500.00,'2024-09-12'),
(36,34,'Cardiac Rehab Session','THERAPY',2500.00,'2024-09-20'),
(37,35,'PCOS Hormonal Panel','DIAGNOSTIC',2900.00,'2024-09-27'),
(38,36,'Thyroid Panel','DIAGNOSTIC',1100.00,'2024-10-08'),
(39,37,'Antenatal Ultrasound','DIAGNOSTIC',2100.00,'2024-10-15'),
(40,38,'Holter Monitoring','DIAGNOSTIC',4200.00,'2024-10-22'),
(41,39,'Childhood Vaccination','MEDICATION',1500.00,'2024-11-05'),
(42,40,'Cardiac Rehab Session','THERAPY',2500.00,'2024-11-13'),
(43,42,'Hormone Therapy Cycle','MEDICATION',6200.00,'2024-12-03'),
(44,43,'Lipid Profile','DIAGNOSTIC',1400.00,'2024-12-10'),
(45,44,'Physiotherapy Session','THERAPY',1200.00,'2024-12-18'),
(46,45,'PCOS Follow-up Panel','DIAGNOSTIC',2400.00,'2024-12-26');

CREATE DATABASE library_db;
USE library_db;

CREATE TABLE authors (
    author_id   INT PRIMARY KEY,
    author_name VARCHAR(80) NOT NULL,
    country     VARCHAR(50) NOT NULL,
    birth_year  INT NULL
);

CREATE TABLE members (
    member_id       INT PRIMARY KEY,
    full_name       VARCHAR(80) NOT NULL,
    membership_type ENUM('BASIC','PREMIUM','STUDENT') NOT NULL,
    join_date       DATE NOT NULL,
    city            VARCHAR(50) NOT NULL,
    is_active       TINYINT(1) NOT NULL DEFAULT 1
);

CREATE TABLE books (
    book_id        INT PRIMARY KEY,
    title          VARCHAR(120) NOT NULL,
    author_id      INT NOT NULL,
    genre          VARCHAR(50) NOT NULL,
    published_year INT NOT NULL,
    total_copies   INT NOT NULL,
    shelf_code     VARCHAR(10) NOT NULL,
    CONSTRAINT fk_books_author FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE borrowings (
    borrow_id   INT PRIMARY KEY,
    book_id     INT NOT NULL,
    member_id   INT NOT NULL,
    borrow_date DATE NOT NULL,
    due_date    DATE NOT NULL,
    return_date DATE NULL,                      -- NULL = still with the member
    fine_amount DECIMAL(8,2) NOT NULL DEFAULT 0,
    CONSTRAINT fk_bor_book   FOREIGN KEY (book_id)   REFERENCES books(book_id),
    CONSTRAINT fk_bor_member FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- ------------------------------------------------------------------ authors
INSERT INTO authors VALUES
(1,'Chinua Achebe','Nigeria',1930),
(2,'Arundhati Roy','India',1961),
(3,'Haruki Murakami','Japan',1949),
(4,'Ursula K. Le Guin','USA',1929),
(5,'Yuval Noah Harari','Israel',1976),
(6,'R. K. Narayan','India',1906),
(7,'Isabel Allende','Chile',1942),
(8,'Neil Gaiman','UK',1960),
(9,'Amitav Ghosh','India',1956),
(10,'Toni Morrison','USA',1931);

-- ------------------------------------------------------------------ members
INSERT INTO members VALUES
(1,'Subhashree Panda','PREMIUM','2022-06-14','Bhubaneswar',1),
(2,'Ayan Choudhury','STUDENT','2022-08-02','Cuttack',1),
(3,'Reema Thomas','BASIC','2022-11-25','Kochi',1),
(4,'Vinay Kumar','PREMIUM','2023-01-17','Bengaluru',1),
(5,'Oliver Hughes','BASIC','2023-03-09','London',1),
(6,'Snehal Deshmukh','STUDENT','2023-05-21','Pune',1),
(7,'Mitali Sen','PREMIUM','2023-07-30','Kolkata',1),
(8,'Karan Malhotra','BASIC','2023-09-12','Delhi',0),
(9,'Ipsita Mohanty','STUDENT','2023-11-04','Bhubaneswar',1),
(10,'Nurul Islam','PREMIUM','2024-01-19','Dhaka',1),
(11,'Gaurav Tiwari','BASIC','2024-03-26','Lucknow',1),
(12,'Elena Petrova','STUDENT','2024-06-08','Bhubaneswar',1);

-- -------------------------------------------------------------------- books
INSERT INTO books VALUES
(1,'Things Fall Apart',1,'Fiction',1958,5,'A-101'),
(2,'No Longer at Ease',1,'Fiction',1960,3,'A-102'),
(3,'The God of Small Things',2,'Fiction',1997,4,'A-110'),
(4,'The Ministry of Utmost Happiness',2,'Fiction',2017,3,'A-111'),
(5,'Norwegian Wood',3,'Fiction',1987,6,'B-201'),
(6,'Kafka on the Shore',3,'Magical Realism',2002,4,'B-202'),
(7,'1Q84',3,'Magical Realism',2009,2,'B-203'),
(8,'The Left Hand of Darkness',4,'Science Fiction',1969,3,'C-301'),
(9,'A Wizard of Earthsea',4,'Fantasy',1968,5,'C-302'),
(10,'Sapiens',5,'Non-Fiction',2011,8,'D-401'),
(11,'Homo Deus',5,'Non-Fiction',2015,5,'D-402'),
(12,'21 Lessons for the 21st Century',5,'Non-Fiction',2018,4,'D-403'),
(13,'Malgudi Days',6,'Short Stories',1943,6,'A-120'),
(14,'The Guide',6,'Fiction',1958,4,'A-121'),
(15,'The House of the Spirits',7,'Magical Realism',1982,3,'B-210'),
(16,'American Gods',8,'Fantasy',2001,4,'C-310'),
(17,'The Graveyard Book',8,'Fantasy',2008,3,'C-311'),
(18,'The Shadow Lines',9,'Fiction',1988,3,'A-130'),
(19,'The Hungry Tide',9,'Fiction',2004,2,'A-131'),
(20,'Beloved',10,'Fiction',1987,3,'A-140');

-- --------------------------------------------------------------- borrowings
INSERT INTO borrowings VALUES
(1,  1, 1,'2024-01-05','2024-01-19','2024-01-16',  0.00),
(2, 10, 2,'2024-01-09','2024-01-23','2024-01-30', 70.00),
(3,  5, 4,'2024-01-14','2024-01-28','2024-01-27',  0.00),
(4,  3, 7,'2024-01-22','2024-02-05','2024-02-05',  0.00),
(5,  1, 2,'2024-02-02','2024-02-16','2024-02-14',  0.00),
(6, 13, 1,'2024-02-06','2024-02-20','2024-02-25', 50.00),
(7,  6, 5,'2024-02-11','2024-02-25','2024-02-22',  0.00),
(8, 10, 9,'2024-02-19','2024-03-04','2024-03-02',  0.00),
(9, 16, 4,'2024-02-27','2024-03-12','2024-03-20', 80.00),
(10, 8, 2,'2024-03-03','2024-03-17','2024-03-15',  0.00),
(11, 3, 1,'2024-03-08','2024-03-22','2024-03-21',  0.00),
(12,11, 7,'2024-03-15','2024-03-29','2024-03-28',  0.00),
(13,14, 6,'2024-03-21','2024-04-04','2024-04-12', 80.00),
(14, 5, 9,'2024-03-27','2024-04-10','2024-04-08',  0.00),
(15, 7, 1,'2024-04-04','2024-04-18','2024-04-17',  0.00),
(16,10, 2,'2024-04-09','2024-04-23','2024-04-21',  0.00),
(17,20, 3,'2024-04-16','2024-04-30','2024-05-06', 60.00),
(18,12, 4,'2024-04-23','2024-05-07','2024-05-05',  0.00),
(19,17, 9,'2024-04-29','2024-05-13','2024-05-11',  0.00),
(20, 6, 1,'2024-05-06','2024-05-20','2024-05-18',  0.00),
(21, 1, 2,'2024-05-13','2024-05-27','2024-05-25',  0.00),
(22,18, 7,'2024-05-20','2024-06-03','2024-06-01',  0.00),
(23, 9,11,'2024-05-27','2024-06-10','2024-06-18', 80.00),
(24,10, 5,'2024-06-03','2024-06-17','2024-06-14',  0.00),
(25,15, 1,'2024-06-10','2024-06-24','2024-06-23',  0.00),
(26, 4, 2,'2024-06-17','2024-07-01','2024-06-29',  0.00),
(27,13, 9,'2024-06-24','2024-07-08','2024-07-06',  0.00),
(28, 5,10,'2024-07-01','2024-07-15','2024-07-13',  0.00),
(29, 3, 1,'2024-07-08','2024-07-22','2024-07-20',  0.00),
(30,11, 2,'2024-07-15','2024-07-29','2024-08-05', 70.00),
(31,16, 6,'2024-07-22','2024-08-05','2024-08-03',  0.00),
(32,10, 7,'2024-07-29','2024-08-12','2024-08-10',  0.00),
(33,19, 1,'2024-08-05','2024-08-19','2024-08-17',  0.00),
(34, 8,12,'2024-08-12','2024-08-26','2024-08-24',  0.00),
(35, 6, 2,'2024-08-19','2024-09-02','2024-08-31',  0.00),
(36,14, 4,'2024-08-26','2024-09-09','2024-09-15', 60.00),
(37,12, 1,'2024-09-02','2024-09-16','2024-09-14',  0.00),
(38,10,11,'2024-09-09','2024-09-23','2024-09-21',  0.00),
(39, 7, 9,'2024-09-16','2024-09-30','2024-09-28',  0.00),
(40,20, 2,'2024-09-23','2024-10-07','2024-10-05',  0.00),
(41, 1, 1,'2024-10-07','2024-10-21','2024-10-19',  0.00),
(42,17,12,'2024-10-14','2024-10-28','2024-11-04', 70.00),
(43, 5, 7,'2024-10-21','2024-11-04','2024-11-02',  0.00),
(44,15, 2,'2024-10-28','2024-11-11','2024-11-09',  0.00),
(45,10, 4,'2024-11-04','2024-11-18','2024-11-16',  0.00),
(46,18, 1,'2024-11-11','2024-11-25','2024-11-23',  0.00),

(47, 9, 6,'2024-11-18','2024-12-02',NULL,          0.00),
(48,13, 2,'2024-11-25','2024-12-09','2024-12-07',  0.00),
(49, 4,10,'2024-12-02','2024-12-16','2024-12-14',  0.00),
(50, 3, 1,'2024-12-09','2024-12-23','2024-12-21',  0.00),
(51,11, 5,'2024-12-16','2024-12-30',NULL,          0.00),
(52,16, 9,'2024-12-23','2025-01-06',NULL,          0.00),
(53, 2, 3,'2024-12-27','2025-01-10',NULL,          0.00);





-- Solving questions
