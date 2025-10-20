--1--
CREATE TABLE STORE_REPS
(
    rep_ID NUMBER(5),
    last VARCHAR2(15),
    first VARCHAR2(10),
    comm CHAR(1) DEFAULT 'Y',
    CONSTRAINT store_reps_pk PRIMARY KEY (rep_ID)
);

--2--
ALTER TABLE STORE_REPS
MODIFY (last NOT NULL, first NOT NULL);

--3--
ALTER TABLE STORE_REPS
ADD CONSTRAINT comm_chk CHECK (comm IN ('Y', 'N'));

--4--
ALTER TABLE STORE_REPS
ADD base_salary NUMBER(7,2);

ALTER TABLE STORE_REPS
ADD CONSTRAINT base_salary_chk CHECK (base_salary > 0);

--5--
CREATE TABLE BOOK_STORES
(
    Store_ID NUMBER(8),
    Name  VARCHAR2(30) UNIQUE NOT NULL,
    CONTACT VARCHAR2(30),
    Rep_ID VARCHAR2(5),
    CONSTRAINT book_stores_pk PRIMARY KEY (Store_ID)
);

--6--
ALTER TABLE BOOK_STORES
MODIFY Rep_ID NUMBER(5);

ALTER TABLE BOOK_STORES
ADD CONSTRAINT book_stores_store_reps_fk FOREIGN KEY (Rep_ID) REFERENCES store_reps(rep_ID);

--7--
ALTER TABLE BOOK_STORES
DROP CONSTRAINT  book_stores_store_reps_fk;

ALTER TABLE BOOK_STORES
ADD CONSTRAINT book_stores_store_reps_fk FOREIGN KEY (Rep_ID) REFERENCES store_reps(rep_ID) ON DELETE CASCADE;

--8--
ALTER TABLE BOOK_STORES
ADD CONSTRAINT book_stores_store_id_rep_id_uk UNIQUE (Store_ID, Rep_ID);

CREATE TABLE REP_CONTRACTS
(
    Store_ID NUMBER(8),
    Name     NUMBER(5),
    Quarter  CHAR(3),
    Rep_ID   NUMBER(5),
    CONSTRAINT rep_contracts_pk PRIMARY KEY (Store_ID, Quarter, Rep_ID),
    CONSTRAINT rep_contracts_book_stores_fk FOREIGN KEY (Store_ID, Rep_ID) REFERENCES BOOK_STORES(Store_ID, Rep_ID)
);

--9--
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'STORE_REPS';


--10--
ALTER TABLE STORE_REPS
MODIFY CONSTRAINT base_salary_chk DISABLE;

ALTER TABLE STORE_REPS
MODIFY CONSTRAINT base_salary_chk ENABLE;

--11--
CREATE TABLE DEPARTMENT
(
    dept_id NUMBER,
    dept_name VARCHAR2(20),
    dept_location VARCHAR2(15),
    CONSTRAINT department_pk PRIMARY KEY (dept_id)
);
CREATE TABLE SALARY_GRADE
(
    grade NUMBER,
    min_salary NUMBER,
    max_salary NUMBER,
    CONSTRAINT salary_grades_pk PRIMARY KEY (grade)
);
CREATE TABLE EMPLOYEES
(
    emp_id NUMBER,
    emp_name VARCHAR2(15),
    job_name VARCHAR2(10),
    manager_id NUMBER,
    hire_date DATE,
    salary NUMBER(10,2),
    commission NUMBER(7,2),
    dep_id NUMBER,
    CONSTRAINT employees_pk PRIMARY KEY (emp_id),
    CONSTRAINT employees_department_fk FOREIGN KEY (dep_id) REFERENCES DEPARTMENT(dept_id)
);
