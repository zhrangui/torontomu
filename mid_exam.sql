CREATE TABLE store_reps
(
    rep_ID NUMBER(5) PRIMARY KEY,
    last VARCHAR2(15),
    first VARCHAR2(10),
    comm CHAR(1) DEFAULT 'Y'
)

--2--
ALTER TABLE STORE_REPS
MODIFY last NOT NULL;

ALTER TABLE STORE_REPS
MODIFY first NOT NULL;

--3--
ALTER TABLE STORE_REPS
ADD CONSTRAINT store_reps_comm 
CHECK (comm IN ('Y', 'N'));

--4--
ALTER TABLE STORE_REPS
ADD Base_salary NUMBER(7,2)

ALTER TABLE STORE_REPS
ADD CONSTRAINT store_reps_base_salary
CHECK (Base_salary>0)

--5--
CREATE TABLE BOOK_STORE
(
    Store_ID NUMBER(8) PRIMARY KEY,
    Name VARCHAR2(30) UNIQUE NOT NULL,
    Contact VARCHAR2(30),
    Rep_ID VARCHAR2(5)
)

--6--
ALTER TABLE BOOK_STORE
MODIFY rep_ID NUMBER(5)

ALTER TABLE BOOK_STORE
ADD CONSTRAINT book_store_rep_id_fk FOREIGN KEY (Rep_ID) REFERENCES STORE_REPS(rep_ID);

--7--
ALTER TABLE BOOK_STORE
DROP CONSTRAINT book_store_rep_id_fk;
ALTER TABLE BOOK_STORE
ADD CONSTRAINT book_store_rep_id_fk FOREIGN KEY (Rep_ID) REFERENCES STORE_REPS(rep_ID) ON DELETE CASCADE


--2--
CREATE TABLE Hotel
(    
    hotelNo NUMBER(5) PRIMARY KEY,
    hotelName VARCHAR2(100),
    city VARCHAR2(100)
)

--2.a--
CREATE TABLE Room
(    
    roomNo NUMBER(5),
    hotelNo NUMBER(5),
    type VARCHAR2(100),
    price NUMBER(7,2)
)

ALTER TABLE Room
ADD CONSTRAINT room_pk PRIMARY KEY(roomNo, hotelNo);

ALTER TABLE Room
ADD CONSTRAINT room_hetelno_fk FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo); 

ALTER TABLE Room
ADD CONSTRAINT room_type_check
CHECK(type IN ('Single', 'Double', 'Family'));

--2.b--
ALTER TABLE Room
ADD CONSTRAINT room_price_check
CHECK(price BETWEEN 10 AND 100 );

--3.c--
ALTER TABLE Room
ADD CONSTRAINT room_roomno_check
CHECK(roomno BETWEEN 1 AND 100 );

--2.d--
CREATE TABLE Booking
(    
    hotelNo NUMBER(5),
    guestNo NUMBER(5),
    dateFrom DATE,
    dateTo DATE
);

ALTER TABLE Booking
ADD CONSTRAINT book_datefrom_check
CHECK(dateFrom > TO_DATE(dateFrom,'dd-mm-YYYY'));

ALTER TABLE Booking
ADD CONSTRAINT book_dateto_check
CHECK(dateTo > TO_DATE(dateTo,'dd-mm-YYYY'));

--e--


--f--
CREATE TABLE Guest
(    
    guestNo NUMBER(5) PRIMARY KEY,
    guestName VARCHAR2(100),
    guestAddress VARCHAR2(100)
);
ALTER TABLE Guest
ADD CONSTRAINT guest_dateto_check
CHECK(dateTo > TO_DATE(dateTo,'dd-mm-YYYY'));