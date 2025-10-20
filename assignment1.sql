CREATE TABLE store_reps
(
    rep_ID NUMBER(5),
    last VARCHAR2(15) NOT NULL,
    first VARCHAR2(10) NOT NULL,
    comm CHAR(1) DEFAULT 'Y',
    CONSTRAINT pk_store_reps PRIMARY KEY (rep_ID),
    CHECK (comm IN ('Y', 'N'))
)

ALTER TABLE store_reps 
ADD base_salary NUMBER(7,2);

ALTER TABLE store_reps
ADD CONSTRAINT chk_base_salary CHECK (base_salary > 0);

CREATE TABLE BOOK_STORES
(
    Store_ID NUMBER(8),
    Name  VARCHAR2(30) UNIQUE NOT NULL,
    CONTACT VARCHAR2(30),
    Rep_ID VARCHAR2(5),
    CONSTRAINT pk_stores PRIMARY KEY (Store_ID)
);

ALTER TABLE BOOK_STORES
MODIFY Rep_ID NUMBER(5);

ALTER TABLE BOOK_STORES
ADD CONSTRAINT fk_store_reps FOREIGN KEY (Rep_ID) REFERENCES store_reps(rep_ID);

ALTER TABLE BOOK_STORES
DROP CONSTRAINT fk_store_reps;

ALTER TABLE BOOK_STORES
ADD CONSTRAINT fk_store_reps FOREIGN KEY (Rep_ID) REFERENCES store_reps(rep_ID) ON DELETE CASCADE;


CREATE TABLE REP_CONTRACTS
(
    Store_ID NUMBER(8),
    Name     NUMBER(5),
    Quarter  CHAR(3),
    Rep_ID   NUMBER(5),
    CONSTRAINT pk_rep_contracts PRIMARY KEY (Store_ID, Name, Quarter, Rep_ID)
);
