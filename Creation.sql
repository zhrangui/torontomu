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
   EXECUTE IMMEDIATE 'DROP TABLE Address';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- ==================== CREATE TABLES ====================
CREATE TABLE Address (
    addr_ID NUMBER(10),
    st_no VARCHAR2(10) NOT NULL,
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
    address_ID NUMBER(10) NOT NULL,
    CONSTRAINT counsellors_pk PRIMARY KEY (co_ID),
    CONSTRAINT counsellors_address_fk FOREIGN KEY (address_ID) REFERENCES Address(addr_ID)
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
    item_name VARCHAR2(30),
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
