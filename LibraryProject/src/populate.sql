INSERT IGNORE INTO author(authorId, firstName, lastName)
VALUES
(101, 'Bobby', 'Ewing'),
(102, 'Red', 'Skelton'),
(201, 'Thomas', 'Magnum'),
(202, 'Julie', 'Barnes'),
(203, 'Roger', 'Ramjet'),
(204, 'Mickey', 'Hart'),
(205, 'Grace', 'Slick'),
(206, 'Perry', 'Mason'),
(207, 'Dickey', 'Betts'),
(208, 'Waco', 'Kid'),
(209, 'Roger', 'Thornhill'),
(210, 'Scottie', 'Ferguson'),
(301, 'Barbara', 'Wright'),
(302, 'John', 'Crichton'),
(303, 'Aeon', 'Flux'),
(304, 'Robert', 'Crawley');

INSERT IGNORE INTO library(name, street, city, state)
VALUES
('Main', '42 South Main', 'Fort Collins', 'CO');

INSERT IGNORE INTO publisher(pubId, pubName)
VALUES
(10000, 'Wiley'),
(10001, 'McGraw-Hill'),
(10002, 'Coyote Publishing'),
(10003, 'Amazon'),
(10004, 'Jerrys Ice Cream'),
(10005, 'Buy a Boat'),
(10006, 'Flagstaff Publishing'),
(10007, 'Ram West');

INSERT IGNORE INTO member(memberId, firstName, lastName, DOB)
VALUES
(1000, 'Wiley', 'Coyote', DATE '1961-09-10'),
(1100, 'Bugs', 'Bunny', DATE '1990-06-24'),
(1200, 'Olive', 'Oyl', DATE '1989-07-19'),
(1300, 'Alice', 'Wonderland', DATE '1989-07-19'),
(1400, 'Roger', 'Ramjet', DATE '1985-01-13'),
(1500, 'Larry', 'Lujack', DATE '1940-06-06'),
(1600, 'Thomas', 'Tankengine', DATE '1991-04-01'),
(1700, 'Amber', 'Corwin', DATE '1970-12-01'),
(1800, 'Dworkin', 'Barimen', DATE '1950-12-02'),
(1900, 'Bel', 'Garion', DATE '1983-01-01'),
(2000, 'Pol', 'Gara', DATE '1963-01-10'),
(2001, 'Art', 'Clark', DATE '2001-12-06'),
(2002, 'Edith', 'Crawley', DATE '1962-09-04'),
(2003, 'John', 'Bates', DATE '2001-12-12'),
(2004, 'Thomas', 'Barrow', DATE '2005-05-05'),
(2005, 'John', 'Watson', DATE '1975-02-22'),
(2006, 'Jim', 'Moriarty', DATE '1967-03-12'),
(2007, 'Walter', 'White', DATE '1983-05-14'),
(2008, 'Skyler', 'White', DATE '1983-04-12'),
(2009, 'Dexter', 'Morgan', DATE '1994-07-11'),
(2010, 'Rita', 'Bennett', DATE '2001-11-12'),
(2011, 'Sun', 'Kwon', DATE '1988-10-19'),
(2012, 'John', 'Locke', DATE '2000-01-01'),
(2013, 'Clair', 'Littleton', DATE '2001-02-01'),
(2015, 'Claire', 'Bennet', DATE '2001-03-11'),
(2016, 'Mohinder', 'Suresh', DATE '1993-04-15'),
(2017, 'Chloe', 'Sullivan', DATE '2007-05-16'),
(2018, 'Martha', 'Kent', DATE '1954-02-13'),
(2019, 'Paige', 'Matthews', DATE '1977-03-16'),
(2020, 'Leo', 'Wyatt', DATE '2000-10-01'),
(2021, 'Buffy', 'Summers', DATE '2000-05-26'),
(2022, 'Xander', 'Harris', DATE '2001-06-23');

INSERT IGNORE INTO book(ISBN, title, publishedYear)
VALUES
(964210310001, 'How to Grow Tomatoes', 1963),
(964210310002, 'Mr. Smith Goes to Washington', 2010),
(964210310003, 'Studying is Your Friend', 1955),
(964210310004, 'To Have and To Cherish', 2011),
(964210310005, 'Hal Finds a Home', 2001),
(964210310006, 'Last Train to Clarksville', 1999),
(964210310007, 'How to Digitally Sign', 2003),
(964210310008, 'Sam Needs a Friend', 2013),
(964210310009, 'Downton Abbey', 2005),
(964210310011, 'Database Theory', 2010),
(964210310022, 'Challenging Puzzles', 1988),
(964210310033, 'American Football', 2011),
(964210310034, 'European Football', 2015),
(964210310040, 'Where to Start', 2012),
(964210310054, 'Lacey Discovers Herself', 2013),
(964210310068, 'Mr. Ed', 2009),
(964210310081, 'Escape from Gilligans Island', 2009),
(964210310093, 'Fixing Computers', 2010),
(964210310109, 'Red Burn', 2011),
(964210310206, 'Taks McGrill', 2000),
(964210310300, 'Eating Healthy', 1999),
(964210310401, 'How to Grow Cucumbers', 1945),
(964210310502, 'Gardening Tips', 1973),
(964210310604, 'Using the Library', 1993),
(964210310709, 'Too Many Cooks', 1983),
(964210310800, 'Green is Your Friend', 2000),
(964210310907, 'Cubs Win!', 2005),
(964210311003, 'Missing Tomorrow', 2005);

INSERT IGNORE INTO phone(phoneNumber, type)
VALUES
(9705555000, 'o'),
(9705555010, 'o'),
(9705555020, 'o'),
(9705555030, 'o'),
(9705555040, 'o'),
(9705555050, 'o'),
(9705555060, 'o'),
(9705555070, 'c'),
(9705555080, 'o'),
(9705551000, 'c'),
(9705551010, 'h'),
(9705551100, 'o'),
(3035551200, 'h'),
(3035551210, 'c'),
(9705551400, 'c'),
(9705551600, 'h'),
(9705551800, 'c'),
(9705551900, 'h'),
(9705552000, 'h'),
(9705552010, 'c'),
(9705552001, 'h'),
(9705552020, 'c'),
(9705552300, 'o'),
(9705552400, 'h'),
(9705552401, 'c'),
(9705552403, 'o'),
(9705552402, 'c');

INSERT INTO locatedAt(library, ISBN, num_copies, shelf, floor, num_checked_out) 
VALUES 
('Main', 964210310001, 3, 1, 1, 0),
('Main', 964210310002, 1, 1, 1, 0),
('Main', 964210310003, 1, 1, 1, 0),
('Main', 964210310004, 2, 2, 1, 0),
('Main', 964210310005, 1, 2, 1, 0),
('Main', 964210310006, 1, 2, 1, 0),
('Main', 964210310007, 2, 3, 1, 0),
('Main', 964210310008, 2, 3, 1, 0),
('Main', 964210310009, 2, 3, 1, 0),
('Main', 964210310011, 2, 4, 1, 0),
('Main', 964210310022, 3, 4, 1, 0),
('Main', 964210310033, 3, 4, 1, 0),
('Main', 964210310034, 1, 5, 2, 0),
('Main', 964210310040, 2, 5, 2, 0),
('Main', 964210310054, 2, 5, 2, 0),
('Main', 964210310068, 1, 6, 2, 0),
('Main', 964210310081, 1, 6, 2, 0),
('Main', 964210310093, 1, 6, 2, 0),
('Main', 964210310109, 1, 6, 2, 0),
('Main', 964210310206, 1, 7, 2, 0),
('Main', 964210310300, 2, 7, 2, 0),
('Main', 964210310401, 2, 7, 2, 0),
('Main', 964210310502, 1, 7, 2, 0),
('Main', 964210310604, 2, 8, 2, 0),
('Main', 964210310709, 3, 8, 2, 0),
('Main', 964210310800, 2, 8, 2, 0),
('Main', 964210310907, 7, 8, 2, 0),
('Main', 964210311003, 3, 8, 2, 0)
;

INSERT INTO borrowedBy(memberId, ISBN, library, checkinDate, checkoutDate)
VALUES
(1100, 964210310604, 'Main', DATE '2016-04-13', DATE '2016-04-17'),
(1100, 964210310604, 'Main', DATE '2016-03-09', DATE '2016-03-10'),
(1100, 964210310003, 'Main', DATE '2016-03-23', DATE '2016-03-24'),
(1100, 964210310401, 'Main', DATE '2016-05-14', DATE '2016-05-16'),
(1100, 964210310001, 'Main', DATE '2016-04-27', DATE '2016-04-30'),
(1100, 964210310040, 'Main', DATE '2016-05-16', DATE '2016-05-16'),
(1100, 964210310709, 'Main', DATE '2016-05-18', DATE '2016-05-21'),
(1100, 964210310081, 'Main', DATE '2016-03-15', DATE '2016-03-17'),
(1200, 964210310081, 'Main', DATE '2016-04-10', DATE '2016-04-16'),
(1200, 964210310093, 'Main', DATE '2016-03-27', DATE '2016-03-29'),
(1200, 964210310109, 'Main', DATE '2016-04-15', DATE '2016-04-18'),
(1300, 964210310022, 'Main', DATE '2016-03-09', DATE '2016-03-10'),
(1300, 964210310206, 'Main', DATE '2016-05-11', DATE '2016-05-14'),
(1300, 964210310007, 'Main', DATE '2016-05-11', DATE '2016-05-12'),
(1300, 964210310001, 'Main', DATE '2016-03-28', DATE '2016-04-04'),
(1300, 964210310008, 'Main', DATE '2016-04-20', DATE '2016-04-26'),
(1400, 964210310033, 'Main', DATE '2016-03-26', DATE '2016-03-29'),
(1400, 964210310800, 'Main', DATE '2016-03-04', DATE '2016-03-06'),
(1400, 964210310008, 'Main', DATE '2016-05-24', DATE '2016-05-29'),
(1400, 964210310007, 'Main', DATE '2016-05-06', DATE '2016-05-11'),
(1400, 964210311003, 'Main', DATE '2016-03-05', DATE '2016-03-10'),
(1400, 964210310022, 'Main', DATE '2016-03-04', DATE '2016-03-07'),
(1500, 964210310004, 'Main', DATE '2016-05-14', DATE '2016-05-16'),
(1500, 964210310800, 'Main', DATE '2016-04-02', DATE '2016-04-05'),
(1600, 964210310206, 'Main', DATE '2016-05-21', DATE '2016-05-27'),
(1600, 964210310002, 'Main', DATE '2016-05-04', DATE '2016-05-09'),
(1600, 964210310011, 'Main', DATE '2016-03-20', DATE '2016-03-20'),
(1600, 964210310800, 'Main', DATE '2016-05-10', DATE '2016-05-13'),
(1600, 964210310300, 'Main', DATE '2016-03-22', DATE '2016-03-24'),
(1700, 964210310040, 'Main', DATE '2016-05-18', DATE '2016-05-21'),
(1700, 964210310604, 'Main', DATE '2016-04-17', DATE '2016-04-18'),
(1700, 964210311003, 'Main', DATE '2016-04-17', DATE '2016-04-20'),
(1700, 964210310004, 'Main', DATE '2016-04-05', DATE '2016-04-11'),
(1700, 964210310081, 'Main', DATE '2016-03-05', DATE '2016-03-08'),
(1700, 964210310800, 'Main', DATE '2016-04-22', DATE '2016-04-28'),
(1800, 964210310011, 'Main', DATE '2016-04-25', DATE '2016-04-26'),
(1900, 964210310008, 'Main', DATE '2016-05-01', DATE '2016-05-01'),
(2000, 964210310093, 'Main', DATE '2016-04-12', DATE '2016-04-12'),
(2000, 964210310005, 'Main', DATE '2016-05-17', DATE '2016-05-21'),
(2000, 964210310109, 'Main', DATE '2016-05-09', DATE '2016-05-11'),
(2000, 964210310006, 'Main', DATE '2016-05-08', DATE '2016-05-11'),
(2001, 964210310040, 'Main', DATE '2016-04-22', DATE '2016-04-25'),
(2002, 964210310040, 'Main', DATE '2016-05-22', DATE '2016-05-27'),
(2002, 964210310008, 'Main', DATE '2016-04-21', DATE '2016-04-25'),
(2002, 964210310081, 'Main', DATE '2016-03-04', DATE '2016-03-06'),
(2002, 964210310006, 'Main', DATE '2016-04-27', DATE '2016-05-02'),
(2003, 964210310040, 'Main', DATE '2016-04-09', DATE '2016-04-14'),
(2003, 964210310033, 'Main', DATE '2016-03-14', DATE '2016-03-15'),
(2003, 964210310068, 'Main', DATE '2016-04-12', DATE '2016-04-16'),
(2004, 964210310800, 'Main', DATE '2016-05-13', DATE '2016-05-17'),
(2004, 964210310040, 'Main', DATE '2016-04-27', DATE '2016-05-02'),
(2004, 964210310007, 'Main', DATE '2016-04-21', DATE '2016-04-23'),
(2004, 964210310907, 'Main', DATE '2016-05-09', DATE '2016-05-10'),
(2004, 964210310800, 'Main', DATE '2016-05-24', DATE '2016-05-28'),
(2005, 964210310011, 'Main', DATE '2016-04-20', DATE '2016-04-22'),
(2006, 964210310800, 'Main', DATE '2016-04-04', DATE '2016-04-04'),
(2007, 964210310709, 'Main', DATE '2016-03-13', DATE '2016-03-17'),
(2007, 964210310033, 'Main', DATE '2016-03-19', DATE '2016-03-24'),
(2007, 964210310068, 'Main', DATE '2016-04-19', DATE '2016-04-20'),
(2008, 964210310502, 'Main', DATE '2016-03-12', DATE '2016-03-14'),
(2008, 964210311003, 'Main', DATE '2016-04-04', DATE '2016-04-08'),
(2009, 964210310022, 'Main', DATE '2016-03-24', DATE '2016-03-30'),
(2009, 964210310709, 'Main', DATE '2016-04-12', DATE '2016-04-15'),
(2009, 964210310022, 'Main', DATE '2016-04-10', DATE '2016-04-10'),
(2009, 964210310009, 'Main', DATE '2016-03-20', DATE '2016-03-22'),
(2009, 964210310033, 'Main', DATE '2016-04-30', DATE '2016-05-02'),
(2009, 964210310007, 'Main', DATE '2016-03-07', DATE '2016-03-13'),
(2009, 964210310002, 'Main', DATE '2016-04-12', DATE '2016-04-13'),
(2009, 964210310709, 'Main', DATE '2016-04-30', DATE '2016-05-03'),
(2009, 964210310054, 'Main', DATE '2016-04-29', DATE '2016-05-02'),
(2011, 964210310093, 'Main', DATE '2016-04-20', DATE '2016-04-20'),
(2011, 964210310011, 'Main', DATE '2016-03-09', DATE '2016-03-11'),
(2011, 964210310081, 'Main', DATE '2016-03-15', DATE '2016-03-20'),
(2011, 964210310800, 'Main', DATE '2016-05-29', NULL),
(2011, 964210311003, 'Main', DATE '2016-03-06', DATE '2016-03-08'),
(2011, 964210310040, 'Main', DATE '2016-03-10', DATE '2016-03-16'),
(2012, 964210310009, 'Main', DATE '2016-03-28', DATE '2016-03-29'),
(2012, 964210310006, 'Main', DATE '2016-03-24', DATE '2016-03-28'),
(2012, 964210311003, 'Main', DATE '2016-04-04', DATE '2016-04-09'),
(2012, 964210310008, 'Main', DATE '2016-04-26', DATE '2016-04-28'),
(2012, 964210310002, 'Main', DATE '2016-05-27', NULL),
(2013, 964210310008, 'Main', DATE '2016-04-19', DATE '2016-04-23'),
(2013, 964210310054, 'Main', DATE '2016-03-26', DATE '2016-03-29'),
(2013, 964210310033, 'Main', DATE '2016-05-17', DATE '2016-05-21'),
(2015, 964210310009, 'Main', DATE '2016-03-15', DATE '2016-03-19'),
(2016, 964210310033, 'Main', DATE '2016-04-28', DATE '2016-04-30'),
(2016, 964210310907, 'Main', DATE '2016-04-22', DATE '2016-04-28'),
(2016, 964210310206, 'Main', DATE '2016-05-09', DATE '2016-05-14'),
(2016, 964210310907, 'Main', DATE '2016-03-06', DATE '2016-03-08'),
(2016, 964210310907, 'Main', DATE '2016-03-21', DATE '2016-03-22'),
(2016, 964210310001, 'Main', DATE '2016-04-07', DATE '2016-04-08'),
(2016, 964210310206, 'Main', DATE '2016-05-15', DATE '2016-05-15'),
(2017, 964210310709, 'Main', DATE '2016-04-20', DATE '2016-04-25'),
(2017, 964210310300, 'Main', DATE '2016-05-20', DATE '2016-05-26'),
(2017, 964210310093, 'Main', DATE '2016-03-19', DATE '2016-03-23'),
(2017, 964210310300, 'Main', DATE '2016-05-01', DATE '2016-05-05'),
(2017, 964210310004, 'Main', DATE '2016-03-14', DATE '2016-03-16'),
(2018, 964210310033, 'Main', DATE '2016-03-05', DATE '2016-03-07'),
(2018, 964210310004, 'Main', DATE '2016-03-25', DATE '2016-03-27'),
(2018, 964210310907, 'Main', DATE '2016-03-16', DATE '2016-03-20'),
(2018, 964210310008, 'Main', DATE '2016-05-10', DATE '2016-05-10'),
(2018, 964210310033, 'Main', DATE '2016-04-01', DATE '2016-04-07'),
(2018, 964210310300, 'Main', DATE '2016-04-05', DATE '2016-04-10'),
(2018, 964210310206, 'Main', DATE '2016-03-05', DATE '2016-03-11'),
(2018, 964210310709, 'Main', DATE '2016-04-20', DATE '2016-04-25'),
(2018, 964210310206, 'Main', DATE '2016-05-12', DATE '2016-05-17'),
(2019, 964210310009, 'Main', DATE '2016-03-11', DATE '2016-03-12'),
(2020, 964210310022, 'Main', DATE '2016-04-09', DATE '2016-04-10'),
(2020, 964210310206, 'Main', DATE '2016-05-13', DATE '2016-05-18'),
(2020, 964210310093, 'Main', DATE '2016-04-08', DATE '2016-04-12'),
(2020, 964210310401, 'Main', DATE '2016-05-29', NULL),
(2021, 964210310033, 'Main', DATE '2016-03-14', DATE '2016-03-16'),
(2021, 964210310001, 'Main', DATE '2016-05-21', DATE '2016-05-26'),
(2021, 964210310054, 'Main', DATE '2016-04-29', DATE '2016-04-30'),
(2022, 964210310009, 'Main', DATE '2016-03-25', DATE '2016-03-29'),
(2022, 964210310011, 'Main', DATE '2016-05-03', DATE '2016-05-06'),
(2022, 964210310109, 'Main', DATE '2016-04-16', DATE '2016-04-21'),
(2022, 964210311003, 'Main', DATE '2016-06-01', NULL),
(2022, 964210310081, 'Main', DATE '2016-03-26', DATE '2016-03-30'),
(2022, 964210310093, 'Main', DATE '2016-03-27', DATE '2016-03-29'),
(2022, 964210310502, 'Main', DATE '2016-03-26', DATE '2016-04-01'),
(2022, 964210310003, 'Main', DATE '2016-05-06', DATE '2016-05-09');

INSERT INTO publishedBy(ISBN, pubId)
VALUES
(964210310001, 10006),
(964210310002, 10007),
(964210310003, 10000),
(964210310004, 10003),
(964210310005, 10003),
(964210310006, 10004),
(964210310007, 10004),
(964210310008, 10005),
(964210310009, 10002),
(964210310011, 10001),
(964210310022, 10001),
(964210310033, 10006),
(964210310034, 10003),
(964210310040, 10003),
(964210310054, 10002),
(964210310068, 10001),
(964210310081, 10000),
(964210310093, 10000),
(964210310109, 10000),
(964210310206, 10003),
(964210310300, 10004),
(964210310401, 10006),
(964210310502, 10007),
(964210310604, 10003),
(964210310709, 10006),
(964210310800, 10006),
(964210310907, 10002),
(964210311003, 10001);

INSERT INTO writtenBy(authorId, ISBN)
VALUES
(101, 964210310001),
(208, 964210310001),
(102, 964210310002),
(203, 964210310003),
(201, 964210310003),
(209, 964210310004),
(302, 964210310004),
(304, 964210310004),
(204, 964210310005),
(101, 964210310006),
(102, 964210310007),
(302, 964210310007),
(209, 964210310008),
(210, 964210310008),
(301, 964210310008),
(304, 964210310009),
(207, 964210310011),
(208, 964210310011),
(203, 964210310022),
(202, 964210310033),
(202, 964210310034),
(205, 964210310040),
(203, 964210310040),
(201, 964210310054),
(202, 964210310054),
(210, 964210310068),
(210, 964210310206),
(301, 964210310206),
(207, 964210310300),
(208, 964210310300),
(101, 964210310401),
(203, 964210310401),
(201, 964210310502),
(202, 964210310502),
(201, 964210310604),
(303, 964210310709),
(301, 964210310800),
(302, 964210310800),
(102, 964210310907),
(301, 964210310907),
(204, 964210311003),
(205, 964210311003),
(206, 964210311003),
(207, 964210311003);

INSERT IGNORE INTO authorPhone(authorId, phoneNumber, type)
VALUES
(101, 9705551000, 'c'),
(101, 9705551010, 'h'),
(102, 9705551100, 'o'),
(201, 3035551200, 'h'),
(202, 3035551200, 'h'),
(202, 3035551210, 'c'),
(203, 9705551400, 'c'),
(205, 9705551600, 'h'),
(206, 9705551600, 'h'),
(207, 9705551800, 'c'),
(208, 9705551900, 'h'),
(209, 9705552000, 'h'),
(209, 9705552010, 'c'),
(210, 9705552001, 'h'),
(301, 9705552020, 'c'),
(302, 9705552300, 'o'),
(303, 9705552400, 'h'),
(303, 9705552401, 'c'),
(303, 9705552403, 'o'),
(304, 9705552400, 'h'),
(304, 9705552402, 'c'),
(304, 9705552403, 'o');

INSERT IGNORE INTO publisherPhone(pubId, phoneNumber, type)
VALUES
(10000, 9705555000, 'o'),
(10001, 9705555010, 'o'),
(10002, 9705555020, 'o'),
(10003, 9705555030, 'o'),
(10004, 9705555040, 'o'),
(10005, 9705555050, 'o'),
(10006, 9705555060, 'o'),
(10006, 9705555070, 'c'),
(10007, 9705555080, 'o');


INSERT IGNORE INTO library (name, street, city, state) VALUES
('South Park', '4000 South College', 'Fort Collins', 'CO');


INSERT INTO book (ISBN, title, publishedYear) VALUES
(964210310001, 'How to Grow Tomatoes', 1963),
(964210310002, 'Mr. Smith Goes to Washington', 2010),
(964210310003, 'Studying is Your Friend', 1955),
(964210310004, 'To Have and To Cherish', 2011),
(964210310005, 'Hal Finds a Home', 2001),
(964210310006, 'Last Train to Clarksville', 1999),
(964210310007, 'How to Digitally Sign', 2003),
(964210310008, 'Sam Needs a Friend', 2013),
(964210310009, 'Downton Abbey', 2005),
(964210310011, 'Database Theory', 2010),
(964210310022, 'Challenging Puzzles', 1988),
(964210310033, 'American Football', 2011),
(964210310040, 'Where to Start', 2012),
(964210310054, 'Lacey Discovers Herself', 2013),
(964210310068, 'Mr. Ed', 2009),
(964210310081, 'Escape from Gilligan''s Island', 2009),
(964210310093, 'Fixing Computers', 2010),
(964210310109, 'Red Burn', 2011),
(964210310206, 'Taks McGrill', 2000),
(964210310300, 'Eating Healthy', 1999),
(964210310401, 'How to Grow Cucumbers', 1945),
(964210310502, 'Gardening Tips', 1973),
(964210311604, 'Eating in the Fort', 1993),
(964210311709, 'Green Eggs', 1983),
(964210311800, 'Blue is Your Friend', 2010),
(964210310907, 'Cubs Win!', 2005),
(964210311003, 'Missing Tomorrow', 2005)
ON DUPLICATE KEY UPDATE ISBN = VALUES(ISBN), title = VALUES(title), publishedYear = VALUES(publishedYear);




INSERT IGNORE INTO publishedBy (ISBN, pubId) VALUES
(964210310001, 10006),
(964210310002, 10007),
(964210310003, 10000),
(964210310004, 10003),
(964210310005, 10003),
(964210310006, 10004),
(964210310007, 10004),
(964210310008, 10005),
(964210310009, 10002),
(964210310011, 10001),
(964210310022, 10001),
(964210310033, 10006),
(964210310040, 10003),
(964210310054, 10002),
(964210310068, 10001),
(964210310081, 10000),
(964210310093, 10000),
(964210310109, 10000),
(964210310206, 10003),
(964210310300, 10004),
(964210310401, 10006),
(964210310502, 10007),
(964210311604, 10002),
(964210311709, 10003),
(964210311800, 10002),
(964210310907, 10002),
(964210311003, 10001);


INSERT IGNORE INTO writtenBy (authorId, ISBN) VALUES
(101, 964210310001),
(208, 964210310001),
(102, 964210310002),
(203, 964210310003),
(201, 964210310003),
(209, 964210310004),
(302, 964210310004),
(304, 964210310004),
(204, 964210310005),
(101, 964210310006),
(102, 964210310007),
(302, 964210310007),
(209, 964210310008),
(210, 964210310008),
(301, 964210310008),
(304, 964210310009),
(207, 964210310011),
(208, 964210310011),
(203, 964210310022),
(202, 964210310033),
(205, 964210310040),
(203, 964210310040),
(201, 964210310054),
(202, 964210310054),
(210, 964210310068),
(210, 964210310206),
(301, 964210310206),
(207, 964210310300),
(208, 964210310300),
(101, 964210310401),
(203, 964210310401),
(201, 964210310502),
(202, 964210310502),
(201, 964210311604),
(303, 964210311709),
(201, 964210311709),
(301, 964210311800),
(302, 964210311800),
(102, 964210310907),
(301, 964210310907),
(204, 964210311003),
(205, 964210311003),
(206, 964210311003),
(207, 964210311003);


INSERT IGNORE INTO locatedAt (library, ISBN, num_copies, shelf, floor, num_checked_out) VALUES
('South Park', 964210310001, 1, 8, 3, 0),
('South Park', 964210310002, 1, 8, 3, 0),
('South Park', 964210310003, 1, 8, 3, 0),
('South Park', 964210310004, 1, 8, 3, 0),
('South Park', 964210310005, 1, 8, 3, 0),
('South Park', 964210310006, 1, 8, 3, 0),
('South Park', 964210310007, 3, 7, 3, 0),
('South Park', 964210310008, 3, 7, 3, 0),
('South Park', 964210310009, 1, 7, 3, 0),
('South Park', 964210310011, 1, 7, 3, 0),
('South Park', 964210310022, 2, 7, 3, 0),
('South Park', 964210310033, 3, 7, 3, 0),
('South Park', 964210310040, 1, 4, 2, 0),
('South Park', 964210310054, 1, 4, 2, 0),
('South Park', 964210310068, 1, 4, 2, 0),
('South Park', 964210310081, 1, 4, 2, 0),
('South Park', 964210310093, 1, 4, 2, 0),
('South Park', 964210310109, 1, 4, 2, 0),
('South Park', 964210310206, 1, 4, 2, 0),
('South Park', 964210310300, 1, 4, 2, 0),
('South Park', 964210310401, 1, 3, 2, 0),
('South Park', 964210310502, 1, 3, 2, 0),
('South Park', 964210311604, 2, 3, 2, 0),
('South Park', 964210311709, 1, 3, 2, 0),
('South Park', 964210311800, 2, 3, 2, 0),
('South Park', 964210310907, 7, 3, 2, 0),
('South Park', 964210311003, 2, 3, 2, 0);