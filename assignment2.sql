CREATE TABLE Address
(
    Addr_ID NUMBER(10),
    st_no VARCHAR2(50) NOT NULL,
    st_name VARCHAR2(30) NOT NULL,
    city VARCHAR2(30),
    province VARCHAR2(30),
    postal_code VARCHAR2(10),
    CONSTRAINT address_pk PRIMARY KEY (Addr_ID)
);

CREATE TABLE Counsellor
(
    co_ID NUMBER(10),
    co_fname VARCHAR2(20) NOT NULL,
    co_lname VARCHAR2(20) NOT NULL,
    Addr_ID NUMBER(10) NOT NULL,
    CONSTRAINT counsellors_pk PRIMARY KEY (co_ID),
    CONSTRAINT counsellors_address_fk FOREIGN KEY (Addr_ID) REFERENCES Address(Addr_ID)
);

CREATE TABLE Events
(
    event_ID NUMBER(10),
    co_ID NUMBER(10) NOT NULL,
    activity_ID NUMBER(10) NOT NULL,
    event_date DATE NOT NULL,
    start_time TIMESTAMP NOT NULL,
    duration INTERVAL DAY TO SECOND NOT NULL,
    CONSTRAINT events_pk PRIMARY KEY (event_ID)
);

CREATE TABLE Locations
(
    location_ID NUMBER(10),
    location_name VARCHAR2(30) NOT NULL,
    CONSTRAINT location_pk PRIMARY KEY (location_ID)
);

CREATE TABLE Guardians
(
    gu_ID NUMBER(10),
    gu_fname VARCHAR2(20) NOT NULL,
    gu_lname VARCHAR2(20) NOT NULL,
    gu_phone VARCHAR2(15) NOT NULL,
    drivers_license VARCHAR2(20),
    CONSTRAINT guardians_pk PRIMARY KEY (gu_ID)
);

CREATE TABLE Activity
(
    activity_ID NUMBER(10),
    activity_name VARCHAR2(30) NOT NULL,
    age_requirement VARCHAR2(20),
    participants_limit NUMBER(3),
    badge_name VARCHAR2(20),
    CONSTRAINT activity_pk PRIMARY KEY (activity_ID),
    CONSTRAINT activity_badge_name_fk FOREIGN KEY (badge_name) REFERENCES Badges(badge_name)
);

CREATE TABLE Camper
(
    cam_ID NUMBER(10),
    cam_fname VARCHAR2(20) NOT NULL,
    cam_lname VARCHAR2(20) NOT NULL,
    address_ID NUMBER(10) NOT NULL,
    cam_age NUMBER(3) NOT NULL,
    gu_ID NUMBER(10) NOT NULL,
    CONSTRAINT campers_pk PRIMARY KEY (cam_ID),
    CONSTRAINT campers_address_ID_fk FOREIGN KEY (address_ID) REFERENCES Address(Addr_ID),
    CONSTRAINT campers_gu_ID_fk FOREIGN KEY (gu_ID) REFERENCES Guardians(gu_ID)
);

CREATE TABLE Collection
(
    cam_ID NUMBER(10),
    badge_name VARCHAR2(20) NOT NULL, 
    CONSTRAINT collection_pk PRIMARY KEY (cam_ID, badge_name),
    CONSTRAINT collection_cam_fk FOREIGN KEY (cam_ID) REFERENCES Camper(cam_ID),
    CONSTRAINT collection_badge_fk FOREIGN KEY (badge_name) REFERENCES Badges(badge_name)
);

CREATE TABLE Badges
(
    badge_name VARCHAR2(20),
    badge_description VARCHAR2(100),
    CONSTRAINT badges_pk PRIMARY KEY (badge_name)
);

CREATE TABLE Equipment
(
    item_name NUMBER(10),
    equip_name VARCHAR2(30),
    activity_ID NUMBER(10),
    quantity NUMBER(5) NOT NULL,
    weight_per_unit NUMBER(7,2),
    safety_warning VARCHAR2(100),
    consumable NUMBER(1),
    CONSTRAINT equipment_pk PRIMARY KEY (item_name, equip_name),
    CONSTRAINT equipment_activity_ID FOREIGN KEY (activity_ID) REFERENCES Activity(activity_ID)
);

-- Address entries
INSERT INTO Address (Addr_ID, st_no, st_name, city, province, postal_code) VALUES (1001, '123', 'Maple Ave', 'Toronto', 'ON', 'M1A1A1');
INSERT INTO Address (Addr_ID, st_no, st_name, city, province, postal_code) VALUES (1002, '456', 'Oak St', 'North York', 'ON', 'M2B2B2');
INSERT INTO Address (Addr_ID, st_no, st_name, city, province, postal_code) VALUES (1003, '789', 'Pine Rd', 'Scarborough', 'ON', 'M3C3C3');

-- Location entries
INSERT INTO Locations (location_ID, location_name) VALUES (2001, 'Main Hall');
INSERT INTO Locations (location_ID, location_name) VALUES (2002, 'Lakeside Field');
INSERT INTO Locations (location_ID, location_name) VALUES (2003, 'Arts & Crafts Room');

-- Guardians
INSERT INTO Guardians (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3001, 'Alice', 'Wong', '416-555-0101', 'D1234567');
INSERT INTO Guardians (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3002, 'Bob', 'Smith', '416-555-0202', 'D2345678');
INSERT INTO Guardians (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3003, 'Carol', 'Ng', '416-555-0303', 'D3456789');

-- Badges
INSERT INTO Badges (badge_name, badge_description) VALUES ('Swim', 'Completed beginner swim requirements');
INSERT INTO Badges (badge_name, badge_description) VALUES ('Art', 'Participated in arts and crafts activities');
INSERT INTO Badges (badge_name, badge_description) VALUES ('Hike', 'Completed day hike');

-- Activity (note badge_name references Badges)
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participants_limit, badge_name) VALUES (4001, 'Swimming Lessons', '6+', 20, 'Swim');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participants_limit, badge_name) VALUES (4002, 'Arts & Crafts', '5+', 15, 'Art');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participants_limit, badge_name) VALUES (4003, 'Nature Hike', '8+', 25, 'Hike');

-- Counsellors (references Address)
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Addr_ID) VALUES (5001, 'David', 'Brown', 1001);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Addr_ID) VALUES (5002, 'Emily', 'White', 1002);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Addr_ID) VALUES (5003, 'Frank', 'Johnson', 1003);

-- Campers (references Address and Guardians)
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6001, 'Sam', 'Lee', 1001, 10, 3001);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6002, 'Maya', 'Patel', 1002, 8, 3002);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6003, 'Liam', 'O''Connor', 1003, 12, 3003);

-- Collection (camper badges) (references Camper and Badges)
INSERT INTO Collection (cam_ID, badge_name) VALUES (6001, 'Swim');
INSERT INTO Collection (cam_ID, badge_name) VALUES (6001, 'Art');
INSERT INTO Collection (cam_ID, badge_name) VALUES (6002, 'Art');
INSERT INTO Collection (cam_ID, badge_name) VALUES (6003, 'Hike');

-- Events (references counsellor and activity). Note: event_date and start_time use ANSI literals; duration uses INTERVAL
INSERT INTO Events (event_ID, co_ID, activity_ID, event_date, start_time, duration) VALUES (7001, 5001, 4001, DATE '2025-07-01', TIMESTAMP '2025-07-01 09:00:00', INTERVAL '00:01:30' HOUR TO MINUTE);
INSERT INTO Events (event_ID, co_ID, activity_ID, event_date, start_time, duration) VALUES (7002, 5002, 4002, DATE '2025-07-01', TIMESTAMP '2025-07-01 11:00:00', INTERVAL '00:02:00' HOUR TO MINUTE);
INSERT INTO Events (event_ID, co_ID, activity_ID, event_date, start_time, duration) VALUES (7003, 5003, 4003, DATE '2025-07-02', TIMESTAMP '2025-07-02 14:30:00', INTERVAL '00:01:00' HOUR TO MINUTE);

-- Equipment
-- Note: Original table references activity_ID in FOREIGN KEY but activity_ID column is missing in table definition. We'll include item_name as numeric id and equip_name as name; to avoid FK error, we omit activity_ID here because it's not present in the CREATE TABLE.
INSERT INTO Equipment (item_name, equip_name, quantity, weight_per_unit, safety_warning, consumable) VALUES (8001, 'Life Jacket', 30, 1.50, 'Ensure proper fit', 0);
INSERT INTO Equipment (item_name, equip_name, quantity, weight_per_unit, safety_warning, consumable) VALUES (8002, 'Paint Set', 20, 0.75, 'Keep away from eyes', 1);
INSERT INTO Equipment (item_name, equip_name, quantity, weight_per_unit, safety_warning, consumable) VALUES (8003, 'Hiking Pack', 15, 2.50, 'Adjust straps before use', 0);

