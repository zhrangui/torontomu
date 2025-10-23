CREATE TABLE Address (
    addr_ID NUMBER(10),
    st_no VARCHAR2(50) NOT NULL,
    st_name VARCHAR2(30) NOT NULL,
    city VARCHAR2(30),
    province VARCHAR2(30),
    postal_code VARCHAR2(10),
    CONSTRAINT address_pk PRIMARY KEY (addr_ID)
);

CREATE TABLE Locations (
    location_ID NUMBER(10),
    location_name VARCHAR2(30) NOT NULL,
    CONSTRAINT location_pk PRIMARY KEY (location_ID)
);

CREATE TABLE Guardian (
    gu_ID NUMBER(10),
    gu_fname VARCHAR2(20) NOT NULL,
    gu_lname VARCHAR2(20) NOT NULL,
    gu_phone VARCHAR2(15) NOT NULL,
    drivers_license VARCHAR2(20),
    CONSTRAINT guardians_pk PRIMARY KEY (gu_ID)
);

CREATE TABLE Counsellor (
    co_ID NUMBER(10),
    co_fname VARCHAR2(20) NOT NULL,
    co_lname VARCHAR2(20) NOT NULL,
    addr_ID NUMBER(10) NOT NULL,
    CONSTRAINT counsellors_pk PRIMARY KEY (co_ID),
    CONSTRAINT counsellors_address_fk FOREIGN KEY (addr_ID) REFERENCES Address(addr_ID)
);

CREATE TABLE Badge (
    badge_name VARCHAR2(20),
    badge_description VARCHAR2(100),
    CONSTRAINT badge_pk PRIMARY KEY (badge_name)
);

CREATE TABLE Activity (
    activity_ID NUMBER(10),
    activity_name VARCHAR2(30) NOT NULL,
    age_requirement VARCHAR2(20),
    participant_limit NUMBER(3),
    badge_name VARCHAR2(20),
    CONSTRAINT activity_pk PRIMARY KEY (activity_ID),
    CONSTRAINT activity_badge_name_fk FOREIGN KEY (badge_name) REFERENCES Badge(badge_name)
);

CREATE TABLE Equipment (
    item_name NUMBER(10),
    activity_ID NUMBER(10),
    quantity NUMBER(5) NOT NULL,
    weight_per_unit NUMBER(7,2),
    safety_warning VARCHAR2(100),
    consumable NUMBER(1),
    CONSTRAINT equipment_pk PRIMARY KEY (item_name, activity_ID),
    CONSTRAINT equipment_activity_fk FOREIGN KEY (activity_ID) REFERENCES Activity(activity_ID)
);

CREATE TABLE Camper (
    cam_ID NUMBER(10),
    cam_fname VARCHAR2(20) NOT NULL,
    cam_lname VARCHAR2(20) NOT NULL,
    address_ID NUMBER(10) NOT NULL,
    cam_age NUMBER(3) NOT NULL,
    gu_ID NUMBER(10) NOT NULL,
    CONSTRAINT campers_pk PRIMARY KEY (cam_ID),
    CONSTRAINT campers_address_fk FOREIGN KEY (address_ID) REFERENCES Address(addr_ID),
    CONSTRAINT campers_gu_fk FOREIGN KEY (gu_ID) REFERENCES Guardian(gu_ID)
);

CREATE TABLE Event (
    event_ID NUMBER(10),
    co_ID NUMBER(10) NOT NULL,
    activity_ID NUMBER(10) NOT NULL,
    location_ID NUMBER(10) NOT NULL,
    event_date DATE NOT NULL,
    start_time TIMESTAMP NOT NULL,
    duration INTERVAL DAY TO SECOND NOT NULL,
    CONSTRAINT events_pk PRIMARY KEY (event_ID),
    CONSTRAINT events_co_fk FOREIGN KEY (co_ID) REFERENCES Counsellor(co_ID),
    CONSTRAINT events_activity_fk FOREIGN KEY (activity_ID) REFERENCES Activity(activity_ID),
    CONSTRAINT events_location_fk FOREIGN KEY (location_ID) REFERENCES Locations(location_ID)
);

CREATE TABLE Registration (
    cam_ID NUMBER(10) NOT NULL,
    event_ID NUMBER(10) NOT NULL,
    CONSTRAINT registration_pk PRIMARY KEY (cam_ID, event_ID),
    CONSTRAINT registration_cam_fk FOREIGN KEY (cam_ID) REFERENCES Camper(cam_ID),
    CONSTRAINT registration_event_fk FOREIGN KEY (event_ID) REFERENCES Event(event_ID)
);

CREATE TABLE Collection (
    cam_ID NUMBER(10),
    badge_name VARCHAR2(20),
    event_ID NUMBER(10),
    CONSTRAINT collection_pk PRIMARY KEY (cam_ID, badge_name),
    CONSTRAINT collection_cam_fk FOREIGN KEY (cam_ID) REFERENCES Camper(cam_ID),
    CONSTRAINT collection_badge_fk FOREIGN KEY (badge_name) REFERENCES Badge(badge_name),
    CONSTRAINT collection_event_fk FOREIGN KEY (event_ID) REFERENCES Event(event_ID)
);

-- Address entries
INSERT INTO Address (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1001, '123', 'Maple Ave', 'Toronto', 'ON', 'M1A1A1');
INSERT INTO Address (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1002, '456', 'Oak St', 'North York', 'ON', 'M2B2B2');
INSERT INTO Address (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1003, '789', 'Pine Rd', 'Scarborough', 'ON', 'M3C3C3');

-- Location entries
INSERT INTO Locations (location_ID, location_name) VALUES (2001, 'Main Hall');
INSERT INTO Locations (location_ID, location_name) VALUES (2002, 'Lakeside Field');
INSERT INTO Locations (location_ID, location_name) VALUES (2003, 'Arts ' || CHR(38) || ' Crafts Room');

-- Guardians
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3001, 'Alice', 'Wong', '416-555-0101', 'D1234567');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3002, 'Bob', 'Smith', '416-555-0202', 'D2345678');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3003, 'Carol', 'Ng', '416-555-0303', 'D3456789');

-- Badges
INSERT INTO Badge (badge_name, badge_description) VALUES ('Swim', 'Completed beginner swim requirements');
INSERT INTO Badge (badge_name, badge_description) VALUES ('Art', 'Participated in arts and crafts activities');
INSERT INTO Badge (badge_name, badge_description) VALUES ('Hike', 'Completed day hike');

-- Activity (note badge_name references Badge)
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4001, 'Swimming Lessons', '6+', 20, 'Swim');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4002, 'Arts ' || CHR(38) || ' Crafts', '5+', 15, 'Art');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4003, 'Nature Hike', '8+', 25, 'Hike');

-- Counsellors (references Address)
INSERT INTO Counsellor (co_ID, co_fname, co_lname, addr_ID) VALUES (5001, 'David', 'Brown', 1001);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, addr_ID) VALUES (5002, 'Emily', 'White', 1002);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, addr_ID) VALUES (5003, 'Frank', 'Johnson', 1003);

-- Campers (references Address and Guardians)
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6001, 'Sam', 'Lee', 1001, 10, 3001);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6002, 'Maya', 'Patel', 1002, 8, 3002);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6003, 'Liam', 'O''Connor', 1003, 12, 3003);

-- Collection (camper badges) (references Camper and Badge)
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6001, 'Swim', NULL);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6001, 'Art', NULL);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6002, 'Art', NULL);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6003, 'Hike', NULL);

-- Events (references Counsellor, Activity and Location)
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7001, 5001, 4001, 2001, DATE '2025-07-01', TIMESTAMP '2025-07-01 09:00:00', INTERVAL '0 01:30:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7002, 5002, 4002, 2002, DATE '2025-07-01', TIMESTAMP '2025-07-01 11:00:00', INTERVAL '0 02:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7003, 5003, 4003, 2003, DATE '2025-07-02', TIMESTAMP '2025-07-02 14:30:00', INTERVAL '0 01:00:00' DAY TO SECOND);

-- Equipment (references Activity)
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8001, 4001, 30, 1.50, 'Ensure proper fit', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8002, 4002, 20, 0.75, 'Keep away from eyes', 1);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8003, 4003, 15, 2.50, 'Adjust straps before use', 0);
