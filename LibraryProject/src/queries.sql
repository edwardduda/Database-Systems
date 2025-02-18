-- queries.sql

-- Query to print the contents of the borrowedBy table
SELECT * FROM borrowedBy;

-- Query to print members with books currently checked out
SELECT m.lastName, m.firstName, m.memberId, b.title, l.name
FROM member m
JOIN borrowedBy bb ON m.memberId = bb.memberId
JOIN book b ON bb.ISBN = b.ISBN
JOIN locatedAt l ON bb.library = l.name
WHERE bb.checkinDate IS NULL;
