-- Determine how many activities each camper did with each counselor, list the activity.
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
    a.activity_name
ORDER BY 
    c.cam_fname,
    co.co_fname,
    a.activity_name;


-- List the number of each badge that was earned - the camp director needs to know how many of each badge to bring to the closing ceremonies
SELECT
    b.badge_name AS BadgeName,
    COUNT(*) AS Count
FROM
    Badge b
    JOIN Collection c ON c.badge_name = b.badge_name
GROUP BY
    b.badge_name;


-- For a given camper (ID = 6007), display the badges they've earned and which activity it was earned through (if applicable)

SELECT
    c.cam_id as cam_ID,
    c.cam_fname as FName,
    b.badge_name AS BadgeName,
    a.activity_name AS ActivityName,
    e.event_date AS "Date"
FROM
    Camper c
    JOIN Collection col ON col.cam_id = c.cam_id
    LEFT JOIN Event e ON e.event_id = col.event_id
    LEFT JOIN Activity a ON a.activity_id = e.activity_id
    LEFT JOIN Badge b ON b.badge_name = col.badge_name
WHERE
    c.cam_id = 6007;
    
    
    
    
-- Determine which activities had most and least registrations throughout the week: which activities were popular and
-- which activities should be discontinued in the future due to low registration.
-- Most popular event at the top, least popular at the bottom.

SELECT
    a.activity_name AS EventName,
    COUNT(r.cam_id) AS "# Participants"
FROM
    Registration r
    JOIN Event e ON e.event_id = r.event_id
    JOIN Activity a ON a.activity_id = e.activity_id
GROUP BY
    a.activity_name
ORDER BY
    "# Participants" DESC;


-- Create a mailing list to send advertisement pamphlets. Pamphlets should have the name of a recipient (camper or counsellor)
-- and their full address. If multiple people (campers and/or counsellors), each should receive a pamphlet.

SELECT DISTINCT * 
FROM (SELECT
    cam_fname AS FirstName,
    cam_lname AS LastName,
    st_no || ' ' || st_name AS Street,
    city AS City,
    province AS Province,
    postal_code AS "Postal Code"
FROM
    Camper c
    JOIN Address a
    ON c.address_id = a.addr_id
UNION
SELECT
    co_fname AS FirstName,
    co_lname AS LastName,
    st_no || ' ' || st_name AS Street,
    city AS City,
    province AS Province,
    postal_code AS "Postal Code"
FROM
    Counsellor co
    JOIN Address a
    ON co.address_id = a.addr_id)
ORDER BY FirstName, LastName;


-- Perhaps the mail should be addressed to the guardian instead of the camper. To save on costs, the admin staff wants to only send
-- one pamphlet to an address if multiple people live there. If a camper lives there, use the guardian's name, otherwise use the
-- counsellor's name.

-- In our given dataset, no campers live at addr_id 1010 or 1012, indicated by the COUNSELLOR identifier for person_name


SELECT
  a.addr_id,
  a.st_no || ' ' || a.st_name AS Street,
  a.city AS City,
  a.province AS Province,
  a.postal_code AS "Postal Code",
  COALESCE(g.gu_fname ||  g.gu_lname, 'COUNSELLOR ' || co.co_fname || co.co_lname) AS person_name
FROM Address a
LEFT JOIN Camper   ca  ON ca.address_id     = a.addr_id
LEFT JOIN Guardian  g  ON g.gu_ID           = ca.gu_ID
LEFT JOIN Counsellor co ON co.address_id  = a.addr_id
-- keep only addresses that have at least one camper or counsellor
WHERE ca.cam_ID IS NOT NULL OR co.co_id IS NOT NULL
ORDER BY a.addr_id;



