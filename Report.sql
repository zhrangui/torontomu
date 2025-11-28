-- Create a report that lists the number of times each camper did an activity with a counsellor 
-- (GROUP)

-- Camper         Counsellor      # Occurences 
-- Timmy           Joe                 3 
-- Timmy           Sam               1 
-- Sally             Joe                 2

SELECT
    c.cam_fname AS Camper,
    co.co_fname AS Counsellor,
    a.activity_name AS Activity,
    COUNT(*) AS Occurrences
FROM
    Camper c
    JOIN Registration r ON r.cam_id = c.cam_id
    JOIN Event e on e.event_id = r.event_id
    JOIN Counsellor co ON co.co_id= e.co_id
    JOIN Activity a ON a.activity_id = e.activity_id
GROUP BY
    c.cam_fname,
    co.co_fname,
    a.activity_name;

-- List the number of each badge that was earned - the camp director needs to know how many of each badge to bring to the closing ceremonies 
-- BadgeName	Count

-- First_Aid	7 
-- Fire_Starter	3 
-- Water_Safety	10

-- For a given camper, display the names of each badge, the name of the activity they earned it from, and the date of the event. (complex joining between camper, collection, event, and activity) 

-- BadgeName		ActivityName		Date 
-- First_Aid		Morning Hike		2025-07-03 
-- Water_Safety		Canoe			2025-07-04

-- Determine which event(s) had the most campers attend. Which event(s) had the least campers attend? (count # of entries in REGISTRATION table, grouping by event_id → get corresponding name from EVENT table) 

-- EventName		# Participants 
-- Water Polo		14 

-- EventName		# Participants 
-- Arts & Crafts		2 

-- Create a mailing list for all the people involved with camp. Only need to send a letter to unique addresses (UNION between campers and counsellors, unique addresses) 