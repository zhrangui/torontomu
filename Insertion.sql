
-- ==================== ADDRESS (12 rows) ====================
INSERT INTO Address (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1001, '123', 'Maple Ave', 'Toronto', 'ON', 'M1A1A1');
INSERT INTO Address (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1002, '456', 'Oak St', 'North York', 'ON', 'M2B2B2');
INSERT INTO Address (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1003, '789', 'Pine Rd', 'Scarborough', 'ON', 'M3C3C3');
INSERT INTO Address (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1004, '101', 'Elm St', 'Mississauga', 'ON', 'L4L1A1');
INSERT INTO Address (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1005, '202', 'Birch Ave', 'Etobicoke', 'ON', 'M8W1E1');
INSERT INTO Address (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1006, '303', 'Cedar Ln', 'Brampton', 'ON', 'L6S5A1');
INSERT INTO Address (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1007, '404', 'Spruce Dr', 'Markham', 'ON', 'L3P1A1');
INSERT INTO Address (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1008, '505', 'Ash Ct', 'Vaughan', 'ON', 'L4L8L1');
INSERT INTO Address (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1009, '606', 'Willow Way', 'Richmond Hill', 'ON', 'L4C5L1');
INSERT INTO Address (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1010, '707', 'Poplar Pl', 'Aurora', 'ON', 'L4G6V1');
INSERT INTO Address (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1011, '808', 'Fir Rd', 'Newmarket', 'ON', 'L3X1Z1');
INSERT INTO Address (addr_ID, st_no, st_name, city, province, postal_code) VALUES (1012, '909', 'Juniper Sq', 'Bolton', 'ON', 'L7E1M1');

-- ==================== LOCATIONS (12 rows) ====================
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

-- ==================== GUARDIANS (12 rows) ====================
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

-- ==================== BADGES (13 rows) ====================
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
INSERT INTO Badge (badge_name, badge_description) VALUES ('Leadership', 'Demonstrated leadership');
INSERT INTO Badge (badge_name, badge_description) VALUES ('Friendship', 'Helped a friend in need');
INSERT INTO Badge (badge_name, badge_description) VALUES ('Climbing', 'Rock climbing achievement');

-- ==================== ACTIVITIES (12 rows) ====================
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
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4011, 'Rock Climbing', '12+', 10, 'Climbing');
INSERT INTO Activity (activity_ID, activity_name, age_requirement, participant_limit, badge_name) VALUES (4012, 'Volleyball League', '9+', 20, 'Soccer');

-- ==================== COUNSELLORS (12 rows) ====================
INSERT INTO Counsellor (co_ID, co_fname, co_lname, address_ID) VALUES (5001, 'David', 'Brown', 1001);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, address_ID) VALUES (5002, 'Emily', 'White', 1002);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, address_ID) VALUES (5003, 'Frank', 'Johnson', 1003);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, address_ID) VALUES (5004, 'Grace', 'Miller', 1004);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, address_ID) VALUES (5005, 'Henry', 'Davis', 1005);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, address_ID) VALUES (5006, 'Iris', 'Martinez', 1006);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, address_ID) VALUES (5007, 'James', 'Garcia', 1007);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, address_ID) VALUES (5008, 'Karen', 'Rodriguez', 1008);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, address_ID) VALUES (5009, 'Leo', 'Wilson', 1009);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, address_ID) VALUES (5010, 'Mary', 'Anderson', 1010);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, address_ID) VALUES (5011, 'Nathan', 'Taylor', 1011);
INSERT INTO Counsellor (co_ID, co_fname, co_lname, address_ID) VALUES (5012, 'Olivia', 'Thomas', 1012);

-- ==================== CAMPERS (12 rows) ====================
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6001, 'Sam', 'Lee', 1001, 10, 3001);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6002, 'Maya', 'Patel', 1002, 8, 3002);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6003, 'Liam', 'O''Connor', 1003, 12, 3003);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6004, 'Sophia', 'Kumar', 1004, 9, 3004);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6005, 'Noah', 'Lopez', 1005, 11, 3005);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6006, 'Emma', 'Chen', 1006, 7, 3006);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6007, 'Jacob', 'Patel', 1007, 10, 3007);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6008, 'Olivia', 'Anderson', 1008, 13, 3008);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6009, 'Mason', 'Taylor', 1011, 8, 3009);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6010, 'Isabella', 'Martinez', 1006, 11, 3010);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6011, 'Ethan', 'Wilson', 1009, 9, 3011);
INSERT INTO Camper (cam_ID, cam_fname, cam_lname, address_ID, cam_age, gu_ID) VALUES (6012, 'Ava', 'Brown', 1001, 10, 3012);

-- ==================== EVENTS (12 rows) ====================
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7001, 5001, 4001, 2001, DATE '2025-07-01', TIMESTAMP '2025-07-01 09:00:00', INTERVAL '0 01:30:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7002, 5001, 4001, 2001, DATE '2025-07-01', TIMESTAMP '2025-07-01 11:00:00', INTERVAL '0 02:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7003, 5002, 4001, 2003, DATE '2025-07-02', TIMESTAMP '2025-07-02 14:30:00', INTERVAL '0 01:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7004, 5003, 4004, 2004, DATE '2025-07-03', TIMESTAMP '2025-07-03 10:00:00', INTERVAL '0 02:30:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7005, 5003, 4004, 2004, DATE '2025-07-04', TIMESTAMP '2025-07-04 13:00:00', INTERVAL '0 02:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7006, 5004, 4004, 2006, DATE '2025-07-05', TIMESTAMP '2025-07-05 15:00:00', INTERVAL '0 01:45:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7007, 5004, 4004, 2007, DATE '2025-07-06', TIMESTAMP '2025-07-06 09:30:00', INTERVAL '0 02:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7008, 5005, 4004, 2004, DATE '2025-07-07', TIMESTAMP '2025-07-07 16:00:00', INTERVAL '0 01:30:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7009, 5006, 4010, 2010, DATE '2025-07-08', TIMESTAMP '2025-07-08 10:00:00', INTERVAL '0 02:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7010, 5006, 4010, 2010, DATE '2025-07-09', TIMESTAMP '2025-07-09 11:00:00', INTERVAL '0 02:30:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7011, 5007, 4011, 2011, DATE '2025-07-10', TIMESTAMP '2025-07-10 14:00:00', INTERVAL '0 03:00:00' DAY TO SECOND);
INSERT INTO Event (event_ID, co_ID, activity_ID, location_ID, event_date, start_time, duration) VALUES (7012, 5007, 4010, 2010, DATE '2025-07-11', TIMESTAMP '2025-07-11 09:00:00', INTERVAL '0 02:30:00' DAY TO SECOND);

-- ==================== EQUIPMENT (19 rows) ====================
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Swim Life Jackets', 4001, 30, 1.50, 'Ensure proper fit', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Swim Goggles', 4001, 30, 1.50, 'Tighten straps to fit', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Paint Brushes', 4002, 50, 0.75, 'Clean after use', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Acrylic Paint', 4002, 10, 3, 'Seal after use', 1);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Craft Paper', 4002, 30, 3, 'Pre-cut sheets', 1);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Hiking First Aid', 4003, 1, 10, 'Check supplies before hike', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Soccer Shin Pads', 4004, 30, 3, 'Should cover entire shin', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Soccer Ball', 4004, 10, 3, 'Check inflation regularly', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Basketballs', 4005, 10, 5, 'Check inflation regularly', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Tennis Balls', 4006, 30, 0.35, 'Collect all after use', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Tennis Rackets', 4006, 30, 0.35, 'Put in sleeves after use', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Archery Bows', 4007, 10, 4, 'Never point at people', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Archery Arrows', 4007, 50, 4, '3 per archery station', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Bluetooth Speaker', 4008, 1, 15, 'Charge after use', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Musical Instruments', 4009, 30, 4.0, 'Clean instruments thoroughly', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Chemistry Kits', 4010, 30, 30, 'Safely dispose of chemicals', 1);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Harnesses', 4011, 20, 15, 'Tighten straps before use', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Climbing Ropes', 4011, 40, 15, 'Triple check that ropes are secure', 0);
INSERT INTO Equipment (item_name, activity_ID, quantity, weight_per_unit, safety_warning, consumable) VALUES ('Volleyballs', 4012, 10, 3, 'Check inflation regularly', 0);

-- ==================== REGISTRATIONS (36 rows) ====================
-- Event 7001 (Swimming Lessons) - Multiple campers
INSERT INTO Registration (cam_ID, event_ID) VALUES (6002, 7001); 
INSERT INTO Registration (cam_ID, event_ID) VALUES (6006, 7001);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6011, 7001); 

-- Event 7002 (Swimming Lessons) - Multiple campers  
INSERT INTO Registration (cam_ID, event_ID) VALUES (6001, 7002); 
INSERT INTO Registration (cam_ID, event_ID) VALUES (6004, 7002); 
INSERT INTO Registration (cam_ID, event_ID) VALUES (6007, 7002); 
INSERT INTO Registration (cam_ID, event_ID) VALUES (6002, 7002);

-- Event 7003 (Swimming Lessons) - Multiple campers
INSERT INTO Registration (cam_ID, event_ID) VALUES (6005, 7003);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6008, 7003); 
INSERT INTO Registration (cam_ID, event_ID) VALUES (6001, 7003); 
INSERT INTO Registration (cam_ID, event_ID) VALUES (6006, 7003); 

-- Event 7004 (Soccer Training) - Multiple campers
INSERT INTO Registration (cam_ID, event_ID) VALUES (6009, 7004);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6003, 7004);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6010, 7004);

-- Event 7005 (Soccer Training) - Multiple campers
INSERT INTO Registration (cam_ID, event_ID) VALUES (6003, 7005);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6012, 7005);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6004, 7005);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6009, 7005);

-- Event 7006 (Soccer Training) - Multiple campers
INSERT INTO Registration (cam_ID, event_ID) VALUES (6010, 7006);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6005, 7006);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6007, 7006);

-- Event 7007 (Soccer Training) - Multiple campers
INSERT INTO Registration (cam_ID, event_ID) VALUES (6001, 7007);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6008, 7007);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6011, 7007);

-- Event 7008 (Soccer Training) - Multiple campers
INSERT INTO Registration (cam_ID, event_ID) VALUES (6002, 7008);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6012, 7008);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6006, 7008);

-- Event 7009 (Science Lab) - Multiple campers
INSERT INTO Registration (cam_ID, event_ID) VALUES (6001, 7009);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6005, 7009);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6009, 7009);

-- Event 7010 (Science Lab) - Multiple campers
INSERT INTO Registration (cam_ID, event_ID) VALUES (6003, 7010);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6007, 7010);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6010, 7010);

-- Event 7011 (Rock Climbing) - Multiple campers
INSERT INTO Registration (cam_ID, event_ID) VALUES (6008, 7011);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6011, 7011);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6010, 7011);

-- Event 7012 (Science Lab) - Multiple campers
INSERT INTO Registration (cam_ID, event_ID) VALUES (6002, 7012);
INSERT INTO Registration (cam_ID, event_ID) VALUES (6004, 7012);

-- ==================== COLLECTIONS (20 rows) ====================
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6001, 'Swim', 7002);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6001, 'Soccer', 7007);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6001, 'Science', 7009);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6002, 'Swim', 7001);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6002, 'Soccer', 7008);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6002, 'Science', 7012);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6003, 'Soccer', 7004);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6003, 'Science', 7010);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6004, 'Swim', 7002);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6004, 'Soccer', 7005);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6004, 'Science', 7012);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6005, 'Swim', 7003);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6005, 'Soccer', 7006);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6005, 'Science', 7009);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6006, 'Swim', 7001);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6006, 'Soccer', 7008);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6008, 'Climbing', 7011);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6011, 'Climbing', 7011);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6010, 'Climbing', 7011);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6007, 'Swim', 7003);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6007, 'Leadership', NULL);
INSERT INTO Collection (cam_ID, badge_name, event_ID) VALUES (6007, 'Friendship', NULL);
