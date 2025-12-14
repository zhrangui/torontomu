SELECT c.criminal_ID "Criminal ID", last || ' ' || first "Criminal full name", crime_id "Crime ID", classification "Crime classification", status "Crime status"
FROM
cj_crimes c
JOIN cj_criminals cl on c.criminal_id=cl.criminal_id;


SELECT 
    cl.criminal_id AS "Criminal ID",
    cl.last || ' ' || cl.first AS "Criminal Name",
    COUNT(c.crime_id) AS "Total Number of Crimes"
FROM 
    cj_criminals cl
    JOIN cj_crimes c ON cl.criminal_id = c.criminal_id
GROUP BY 
    cl.criminal_id, cl.last, cl.first
HAVING 
    COUNT(c.crime_id) > 1
ORDER BY 
    "Total Number of Crimes";

SELECT officer_id "Officer ID", last || ' ' || first "Officer name", precinct "Precinct",
CASE SUBSTR(precinct, 2, 1)
WHEN 'A' THEN 'Downtown'
WHEN 'B' THEN 'West Side' 
WHEN 'C' THEN 'East Side' 
ELSE 'Unknown'
END "Community"
FROM cj_officers
