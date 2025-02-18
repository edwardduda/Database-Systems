-- Create member table
CREATE TABLE member(
    memberId INT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    PRIMARY KEY(memberId)
);

-- Create book table
CREATE TABLE book(
    ISBN VARCHAR(40) NOT NULL,
    title VARCHAR(50) NOT NULL,
    publishedYear INT NOT NULL,
    PRIMARY KEY(ISBN)
);

-- Create publisher table
CREATE TABLE publisher(
    pubId INT NOT NULL,
    pubName VARCHAR(50) NOT NULL,
    PRIMARY KEY(pubId)
);

-- Create publishedBy table
CREATE TABLE publishedBy(
    ISBN VARCHAR(40),
    pubId INT,
    FOREIGN KEY (ISBN) REFERENCES book(ISBN),
    FOREIGN KEY (pubId) REFERENCES publisher(pubId)
);

-- Create author table
CREATE TABLE author(
    authorId INT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    PRIMARY KEY(authorId)
);

-- Create writtenBy table
CREATE TABLE writtenBy(
    authorId INT,
    ISBN VARCHAR(40),
    FOREIGN KEY (ISBN) REFERENCES book(ISBN),
    FOREIGN KEY (authorId) REFERENCES author(authorId)
);

-- Create phone table
CREATE TABLE phone(
    phoneNumber VARCHAR(40) NOT NULL,
    type VARCHAR(10),
    PRIMARY KEY(phoneNumber)
);

-- Create publisherPhone table
CREATE TABLE publisherPhone(
    pubId INT,
    phoneNumber VARCHAR(40),
    type  VARCHAR(10),
    FOREIGN KEY (pubId) REFERENCES publisher(pubId),
    FOREIGN KEY (phoneNumber) REFERENCES phone(phoneNumber)
);

-- Create authorPhone table
CREATE TABLE authorPhone(
    authorId INT NOT NULL,
    phoneNumber VARCHAR(40) NOT NULL,
    type VARCHAR(10) NOT NULL,
    FOREIGN KEY (authorId) REFERENCES author(authorId),
    FOREIGN KEY (phoneNumber) REFERENCES phone(phoneNumber)
);

-- Create library table
CREATE TABLE library(
    name VARCHAR(30) NOT NULL,
    state VARCHAR(30) NOT NULL,
    street VARCHAR(30) NOT NULL,
    city VARCHAR(30) NOT NULL,
    PRIMARY KEY(name)
);

-- Create locatedAt table
CREATE TABLE locatedAt (
    library VARCHAR(30),
    ISBN VARCHAR(40),
    num_copies INT NOT NULL,
    shelf INT NOT NULL,
    floor INT NOT NULL,
    num_checked_out INT NOT NULL,
    FOREIGN KEY (library) REFERENCES library(name),
    FOREIGN KEY (ISBN) REFERENCES book(ISBN),
    PRIMARY KEY (library, ISBN)
);

-- Create borrowedBy table
CREATE TABLE borrowedBy(
    memberId INT,
    ISBN VARCHAR(40),
    library VARCHAR(30),
    checkinDate DATE NULL,
    checkoutDate DATE,
    FOREIGN KEY (memberId) REFERENCES member(memberId),
    FOREIGN KEY (library, ISBN) REFERENCES locatedAt(library, ISBN)
);

-- Create audit table
CREATE TABLE audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(50),
    action VARCHAR(10),
    action_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);
