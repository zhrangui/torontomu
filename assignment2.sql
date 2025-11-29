-- ==================== DROP ALL TABLES ====================
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Collection';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Registration';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Event';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Equipment';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Camper';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Activity';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Counsellor';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Badge';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Guardian';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Locations';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Address2';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- ==================== CREATE TABLES ====================



CREATE TABLE Address2 (
    addr_ID NUMBER(10),
    st_no VARCHAR2(50) NOT NULL,
    st_name VARCHAR2(30) NOT NULL,
    city VARCHAR2(30),
    province VARCHAR2(30),
    postal_code VARCHAR2(10),
    CONSTRAINT Address2_pk PRIMARY KEY (addr_ID)
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
    Address2_ID NUMBER(10) NOT NULL,
    CONSTRAINT counsellors_pk PRIMARY KEY (co_ID),
    CONSTRAINT counsellors_Address2_fk FOREIGN KEY (Address2_ID) REFERENCES Address2(addr_ID)
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
    Address2_ID NUMBER(10) NOT NULL,
    cam_age NUMBER(3) NOT NULL,
    gu_ID NUMBER(10) NOT NULL,
    CONSTRAINT campers_pk PRIMARY KEY (cam_ID),
    CONSTRAINT campers_Address2_fk FOREIGN KEY (Address2_ID) REFERENCES Address2(addr_ID),
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


-- ==================== Address2 (25 rows) ====================
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1001, '123', 'Maple Ave', 'Toronto', 'ON', 'M1A1A1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1002, '456', 'Oak St', 'North York', 'ON', 'M2B2B2');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1003, '789', 'Pine Rd', 'Scarborough', 'ON', 'M3C3C3');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1004, '101', 'Elm St', 'Mississauga', 'ON', 'L4L1A1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1005, '202', 'Birch Ave', 'Etobicoke', 'ON', 'M8W1E1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1006, '303', 'Cedar Ln', 'Brampton', 'ON', 'L6S5A1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1007, '404', 'Spruce Dr', 'Markham', 'ON', 'L3P1A1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1008, '505', 'Ash Ct', 'Vaughan', 'ON', 'L4L8L1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1009, '606', 'Willow Way', 'Richmond Hill', 'ON', 'L4C5L1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1010, '707', 'Poplar Pl', 'Aurora', 'ON', 'L4G6V1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1011, '808', 'Fir Rd', 'Newmarket', 'ON', 'L3X1Z1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1012, '909', 'Juniper Sq', 'Bolton', 'ON', 'L7E1M1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1013, '1010', 'Chestnut Blvd', 'Ajax', 'ON', 'L1T1A1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1014, '1111', 'Hazel St', 'Pickering', 'ON', 'L1W1A1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1015, '1212', 'Sycamore Ln', 'Whitby', 'ON', 'L1N1A1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1016, '1313', 'Alder Ave', 'Oshawa', 'ON', 'L1H1A1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1017, '1414', 'Larch Ct', 'Clarington', 'ON', 'L1C1A1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1018, '1515', 'Tamarack Dr', 'Whitchurch-Stouffville', 'ON', 'L4A1A1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1019, '1616', 'Locust Pl', 'King', 'ON', 'L7B1A1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1020, '1717', 'Pawpaw Way', 'East Gwillimbury', 'ON', 'L9N1A1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1021, '1818', 'Mulberry Rd', 'Bradford', 'ON', 'L3Z1A1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1022, '1919', 'Dogwood Sq', 'Georgina', 'ON', 'L4P1A1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1023, '2020', 'Redbud Blvd', 'Sharon', 'ON', 'L0G1A1');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1024, '2121', 'Magnolia Ave', 'Sutton', 'ON', 'L0E1R0');
INSERT INTO Address2 (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1025, '2222', 'Dogwood Dr', 'Javelin Lake', 'ON', 'L0E1S0');

-- ==================== LOCATIONS (25 rows) ====================
INSERT INTO Locations (location_ID, location_name) VALUES (2001, 'Main Hall');
INSERT INTO Locations (location_ID, location_name) VALUES (2002, 'Lakeside Field');
INSERT INTO Locations (location_ID, location_name) VALUES (2003, 'Arts ' || CHR(38) || ' Crafts Room');
INSERT INTO Locations (location_ID, location_name) VALUES (2004, 'North Pavilion');
INSERT INTO Locations (location_ID, location_name) VALUES (2005, 'South Garden');
INSERT INTO Locations (location_ID, location_name) VALUES (2006, 'East Gymnasium');
INSERT INTO Locations (location_ID, location_name) VALUES (2007, 'West Soccer Field');
INSERT INTO Locations (location_ID, location_name) VALUES (2008, 'Central Court');
INSERT INTO Locations (location_ID, location_name) VALUES (2009, 'Basketball Arena');
INSERT INTO Locations (location_ID, location_name) VALUES (2010, 'Tennis Complex');
INSERT INTO Locations (location_ID, location_name) VALUES (2011, 'Volleyball Area');
INSERT INTO Locations (location_ID, location_name) VALUES (2012, 'Swimming Pool');
INSERT INTO Locations (location_ID, location_name) VALUES (2013, 'Archery Range');
INSERT INTO Locations (location_ID, location_name) VALUES (2014, 'Rock Climbing Wall');
INSERT INTO Locations (location_ID, location_name) VALUES (2015, 'Obstacle Course');
INSERT INTO Locations (location_ID, location_name) VALUES (2016, 'Campfire Area');
INSERT INTO Locations (location_ID, location_name) VALUES (2017, 'Forest Trail');
INSERT INTO Locations (location_ID, location_name) VALUES (2018, 'Amphitheater');
INSERT INTO Locations (location_ID, location_name) VALUES (2019, 'Game Room');
INSERT INTO Locations (location_ID, location_name) VALUES (2020, 'Music Studio');
INSERT INTO Locations (location_ID, location_name) VALUES (2021, 'Science Lab');
INSERT INTO Locations (location_ID, location_name) VALUES (2022, 'Library');
INSERT INTO Locations (location_ID, location_name) VALUES (2023, 'Dining Hall');
INSERT INTO Locations (location_ID, location_name) VALUES (2024, 'Dormitory A');
INSERT INTO Locations (location_ID, location_name) VALUES (2025, 'Dormitory B');

-- ==================== GUARDIANS (25 rows) ====================
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3001, 'Alice', 'Wong', '416-555-0101', 'D1234567');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3002, 'Bob', 'Smith', '416-555-0202', 'D2345678');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3003, 'Carol', 'Ng', '416-555-0303', 'D3456789');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3004, 'David', 'Kumar', '416-555-0404', 'D4567890');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3005, 'Emma', 'Lopez', '416-555-0505', 'D5678901');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3006, 'Frank', 'Chen', '416-555-0606', 'D6789012');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3007, 'Grace', 'Patel', '416-555-0707', 'D7890123');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3008, 'Henry', 'Anderson', '416-555-0808', 'D8901234');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3009, 'Iris', 'Taylor', '416-555-0909', 'D9012345');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3010, 'Jack', 'Martinez', '416-555-1010', 'D0123456');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3011, 'Karen', 'Wilson', '416-555-1111', 'D1123456');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3012, 'Leo', 'Brown', '416-555-1212', 'D2123456');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3013, 'Mary', 'Garcia', '416-555-1313', 'D3123456');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3014, 'Nathan', 'Rodriguez', '416-555-1414', 'D4123456');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3015, 'Olivia', 'Jones', '416-555-1515', 'D5123456');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3016, 'Paul', 'White', '416-555-1616', 'D6123456');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3017, 'Quinn', 'Harris', '416-555-1717', 'D7123456');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3018, 'Rachel', 'Lewis', '416-555-1818', 'D8123456');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3019, 'Steven', 'Walker', '416-555-1919', 'D9123456');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3020, 'Tina', 'Hall', '416-555-2020', 'D0223456');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3021, 'Uma', 'Young', '416-555-2121', 'D1223456');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3022, 'Victor', 'King', '416-555-2222', 'D2223456');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3023, 'Wendy', 'Scott', '416-555-2323', 'D3223456');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3024, 'Xavier', 'Green', '416-555-2424', 'D4223456');
INSERT INTO Guardian (gu_ID, gu_fname, gu_lname, gu_phone, drivers_license) VALUES (3025, 'Yara', 'Adams', '416-555-2525', 'D5223456');

-- ==================== BADGES (10 rows) ====================
INSERT INTO Badge (badge_name, badge_description) VALUES ('Swim', 'Completed beginner swim requirements');
INSERT INTO Badge (badge_name, badge_description) VALUES ('Art', 'Participated in arts and crafts activities');
INSERT INTO Badge (badge_name, badge_description) VALUES ('Hike', 'Completed day hike');
INSERT INTO Badge (badge_name, badge_description) VALUES ('Soccer', 'Soccer tournament winner');
INSERT INTO Badge (badge_name, badge_description) VALUES ('Basketball', 'Basketball skills achievement');
INSERT INTO Badge (badge_name, badge_description) VALUES ('Tennis', 'Tennis doubles champion');
INSERT INTO Badge (badge_name, badge_description) VALUES ('Archery', 'Archery proficiency');
INSERT INTO Badge (badge_name, badge_description) VALUES ('Dance', 'Creative dance performer');
INSERT INTO Badge (badge_name, badge_description) VALUES ('Music', 'Music performance excellence');
INSERT INTO Badge (badge_name, badge_description) VALUES ('Science', 'Science experiment master');

INSERT INTO Badge (badge_name, badge_description) VALUES ('Leadership', 'Demonstrated leadership'); -- ADDED
INSERT INTO Badge (badge_name, badge_description) VALUES ('Friendship', 'Helped a friend in need'); -- ADDED

-- ==================== ACTIVITIES (25 rows) ====================
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4001, 'Swimming Lessons', '6+', 20, 'Swim');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4002, 'Arts ' || CHR(38) || ' Crafts', '5+', 15, 'Art');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4003, 'Nature Hike', '8+', 25, 'Hike');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4004, 'Soccer Training', '7+', 22, 'Soccer');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4005, 'Basketball Camp', '8+', 20, 'Basketball');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4006, 'Tennis Clinic', '9+', 16, 'Tennis');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4007, 'Archery Range', '10+', 12, 'Archery');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4008, 'Dance Class', '6+', 18, 'Dance');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4009, 'Music Workshop', '7+', 14, 'Music');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4010, 'Science Lab', '8+', 15, 'Science');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4011, 'Rock Climbing', '12+', 10, 'Hike');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4012, 'Volleyball League', '9+', 20, 'Soccer');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4013, 'Badminton Open', '8+', 16, 'Tennis');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4014, 'Cooking Class', '7+', 12, 'Art');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4015, 'Photography Tour', '10+', 14, 'Art');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4016, 'Theater Performance', '6+', 25, 'Dance');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4017, 'Outdoor Survival', '11+', 15, 'Hike');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4018, 'Board Games Night', '5+', 20, 'Music');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4019, 'Storytelling Circle', '6+', 18, 'Music');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4020, 'Pottery Workshop', '8+', 10, 'Art');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4021, 'Swimming Relay Race', '7+', 16, 'Swim');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4022, 'Hiking Trail Adventure', '9+', 20, 'Hike');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4023, 'Chess Tournament', '8+', 12, 'Music');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4024, 'Canoe Paddling', '10+', 14, 'Swim');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4025, 'Skateboard Tricks', '10+', 15, 'Dance');

-- ==================== COUNSELLORS (25 rows) ====================
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5001, 'David', 'Brown', 1001);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5002, 'Emily', 'White', 1002);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5003, 'Frank', 'Johnson', 1003);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5004, 'Grace', 'Miller', 1004);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5005, 'Henry', 'Davis', 1005);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5006, 'Iris', 'Martinez', 1006);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5007, 'James', 'Garcia', 1007);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5008, 'Karen', 'Rodriguez', 1008);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5009, 'Leo', 'Wilson', 1009);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5010, 'Mary', 'Anderson', 1010);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5011, 'Nathan', 'Taylor', 1011);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5012, 'Olivia', 'Thomas', 1012);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5013, 'Paul', 'Jackson', 1013);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5014, 'Quinn', 'White', 1014);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5015, 'Rachel', 'Harris', 1015);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5016, 'Steven', 'Martin', 1016);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5017, 'Tina', 'Lee', 1017);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5018, 'Uma', 'Perez', 1018);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5019, 'Victor', 'Thompson', 1019);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5020, 'Wendy', 'Clark', 1020);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5021, 'Xavier', 'Ramirez', 1021);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5022, 'Yara', 'Sanchez', 1022);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5023, 'Zachary', 'Morris', 1023);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5024, 'Amber', 'Rogers', 1024);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, Address2_ID) VALUES (5025, 'Brandon', 'Reed', 1025);

-- ==================== CAMPERS (25 rows) ====================
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6001, 'Sam', 'Lee', 1001, 10, 3001);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6002, 'Maya', 'Patel', 1002, 8, 3002);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6003, 'Liam', 'O''Connor', 1003, 12, 3003);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6004, 'Sophia', 'Kumar', 1004, 9, 3004);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6005, 'Noah', 'Lopez', 1005, 11, 3005);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6006, 'Emma', 'Chen', 1006, 7, 3006);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6007, 'Jacob', 'Patel', 1007, 10, 3007);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6008, 'Olivia', 'Anderson', 1008, 13, 3008);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6009, 'Mason', 'Taylor', 1009, 8, 3009);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6010, 'Isabella', 'Martinez', 1010, 11, 3010);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6011, 'Ethan', 'Wilson', 1011, 9, 3011);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6012, 'Ava', 'Brown', 1012, 10, 3012);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6013, 'Lucas', 'Garcia', 1013, 12, 3013);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6014, 'Mia', 'Rodriguez', 1014, 8, 3014);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6015, 'Logan', 'Jones', 1015, 11, 3015);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6016, 'Charlotte', 'White', 1016, 9, 3016);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6017, 'Aiden', 'Harris', 1017, 10, 3017);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6018, 'Amelia', 'Lewis', 1018, 7, 3018);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6019, 'Benjamin', 'Walker', 1019, 12, 3019);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6020, 'Harper', 'Hall', 1020, 8, 3020);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6021, 'Michael', 'Young', 1021, 11, 3021);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6022, 'Evelyn', 'King', 1022, 9, 3022);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6023, 'Alexander', 'Scott', 1023, 10, 3023);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6024, 'Abigail', 'Green', 1024, 13, 3024);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, Address2_ID, cam_age, gu_ID) VALUES (6025, 'Daniel', 'Adams', 1025, 8, 3025);

-- ==================== EVENTS (25 rows) ====================
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7001, 5001, 4001, 2001, DATE '2025-07-01', TIMESTAMP '2025-07-01 09:00:00', INTERVAL '0 01:30:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7002, 5002, 4002, 2002, DATE '2025-07-01', TIMESTAMP '2025-07-01 11:00:00', INTERVAL '0 02:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7003, 5003, 4003, 2003, DATE '2025-07-02', TIMESTAMP '2025-07-02 14:30:00', INTERVAL '0 01:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7004, 5004, 4004, 2004, DATE '2025-07-03', TIMESTAMP '2025-07-03 10:00:00', INTERVAL '0 02:30:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7005, 5005, 4005, 2005, DATE '2025-07-04', TIMESTAMP '2025-07-04 13:00:00', INTERVAL '0 02:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7006, 5006, 4006, 2006, DATE '2025-07-05', TIMESTAMP '2025-07-05 15:00:00', INTERVAL '0 01:45:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7007, 5007, 4007, 2007, DATE '2025-07-06', TIMESTAMP '2025-07-06 09:30:00', INTERVAL '0 02:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7008, 5008, 4008, 2008, DATE '2025-07-07', TIMESTAMP '2025-07-07 16:00:00', INTERVAL '0 01:30:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7009, 5009, 4009, 2009, DATE '2025-07-08', TIMESTAMP '2025-07-08 10:00:00', INTERVAL '0 02:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7010, 5010, 4010, 2010, DATE '2025-07-09', TIMESTAMP '2025-07-09 11:00:00', INTERVAL '0 02:30:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7011, 5011, 4011, 2011, DATE '2025-07-10', TIMESTAMP '2025-07-10 14:00:00', INTERVAL '0 03:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7012, 5012, 4012, 2012, DATE '2025-07-11', TIMESTAMP '2025-07-11 09:00:00', INTERVAL '0 02:30:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7013, 5013, 4013, 2013, DATE '2025-07-12', TIMESTAMP '2025-07-12 15:00:00', INTERVAL '0 02:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7014, 5014, 4014, 2014, DATE '2025-07-13', TIMESTAMP '2025-07-13 10:30:00', INTERVAL '0 02:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7015, 5015, 4015, 2015, DATE '2025-07-14', TIMESTAMP '2025-07-14 13:00:00', INTERVAL '0 02:30:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7016, 5016, 4016, 2016, DATE '2025-07-15', TIMESTAMP '2025-07-15 18:00:00', INTERVAL '0 02:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7017, 5017, 4017, 2017, DATE '2025-07-16', TIMESTAMP '2025-07-16 08:00:00', INTERVAL '0 03:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7018, 5018, 4018, 2018, DATE '2025-07-17', TIMESTAMP '2025-07-17 19:00:00', INTERVAL '0 01:30:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7019, 5019, 4019, 2019, DATE '2025-07-18', TIMESTAMP '2025-07-18 19:30:00', INTERVAL '0 01:30:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7020, 5020, 4020, 2020, DATE '2025-07-19', TIMESTAMP '2025-07-19 10:00:00', INTERVAL '0 02:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7021, 5021, 4021, 2021, DATE '2025-07-20', TIMESTAMP '2025-07-20 09:00:00', INTERVAL '0 01:30:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7022, 5022, 4022, 2022, DATE '2025-07-21', TIMESTAMP '2025-07-21 08:00:00', INTERVAL '0 03:30:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7023, 5023, 4023, 2023, DATE '2025-07-22', TIMESTAMP '2025-07-22 14:00:00', INTERVAL '0 02:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7024, 5024, 4024, 2024, DATE '2025-07-23', TIMESTAMP '2025-07-23 11:00:00', INTERVAL '0 02:30:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7025, 5025, 4025, 2025, DATE '2025-07-24', TIMESTAMP '2025-07-24 15:00:00', INTERVAL '0 02:00:00' DAY TO SECOND);

INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7026, 5010, 4011, 2011, DATE '2025-07-03', TIMESTAMP '2025-07-09 11:00:00', INTERVAL '0 02:30:00' DAY TO SECOND); --ADDED


-- ==================== EQUIPMENT (25 rows) ====================
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8001, 4001, 30, 1.50, 'Ensure proper fit', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8002, 4002, 20, 0.75, 'Keep away from eyes', 1);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8003, 4003, 15, 2.50, 'Adjust straps before use', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8004, 4004, 25, 0.45, 'Use shin guards', 1);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8005, 4005, 20, 0.62, 'Check inflation regularly', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8006, 4006, 16, 0.35, 'String tension critical', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8007, 4007, 12, 0.50, 'Never point at people', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8008, 4008, 18, 0.30, 'No external jewelry', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8009, 4009, 14, 5.00, 'Use proper technique', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8010, 4010, 15, 0.80, 'Follow protocol', 1);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8011, 4011, 10, 3.50, 'Use harness', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8012, 4012, 22, 0.65, 'Wear protective gear', 1);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8013, 4013, 16, 0.20, 'Restring as needed', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8014, 4014, 12, 0.50, 'Sharp utensils', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8015, 4015, 14, 2.00, 'Handle with care', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8016, 4016, 25, 1.50, 'Respect stage', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8017, 4017, 15, 3.00, 'Use proper footwear', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8018, 4018, 20, 0.40, 'Keep organized', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8019, 4019, 18, 0.60, 'Handle carefully', 1);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8020, 4020, 10, 2.50, 'Wet clay warning', 1);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8021, 4021, 28, 1.20, 'Non-slip footwear', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8022, 4022, 20, 2.80, 'Hydration required', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8023, 4023, 12, 0.25, 'No eating pieces', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8024, 4024, 14, 5.50, 'Life jacket mandatory', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES (8025, 4025, 15, 2.00, 'Helmet required', 0);

-- ==================== REGISTRATIONS (25 rows) ====================
INSERT INTO Registration (cam_ID, event_ID) VALUES (6001, 7001);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6002, 7002);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6003, 7003);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6004, 7004);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6005, 7005);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6006, 7006);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6007, 7007);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6008, 7008);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6009, 7009);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6010, 7010);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6011, 7011);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6012, 7012);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6013, 7013);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6014, 7014);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6015, 7015);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6016, 7016);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6017, 7017);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6018, 7018);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6019, 7019);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6020, 7020);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6021, 7021);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6022, 7022);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6023, 7023);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6024, 7024);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6025, 7025);

INSERT INTO Registration (cam_ID, event_ID) VALUES (6010, 7026); -- ADDED

-- ==================== COLLECTIONS (25 rows) ====================
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6001, 'Swim', 7001);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6001, 'Art', 7002);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6002, 'Art', 7002);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6003, 'Hike', 7003);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6004, 'Soccer', 7004);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6005, 'Basketball', 7005);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6006, 'Tennis', 7006);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6007, 'Archery', 7007);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6008, 'Dance', 7008);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6009, 'Music', 7009);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6010, 'Science', 7010);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6011, 'Hike', 7011);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6012, 'Soccer', 7012);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6013, 'Tennis', 7013);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6014, 'Art', 7014);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6015, 'Art', 7015);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6016, 'Dance', 7016);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6017, 'Hike', 7017);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6018, 'Music', 7018);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6019, 'Music', 7019);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6020, 'Art', 7020);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6021, 'Swim', 7021);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6022, 'Hike', 7022);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6023, 'Music', 7023);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6024, 'Swim', 7024);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6025, 'Dance', 7025);

INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6010, 'Leadership', NULL); -- Added
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6010, 'Friendship', NULL); -- Added
