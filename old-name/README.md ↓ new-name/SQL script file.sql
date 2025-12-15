CREATE DATABASE libraryrecord;
USE libraryrecord;

CREATE TABLE Members(
memberid INT PRIMARY KEY,
name VARCHAR(50),
Email VARCHAR(100)
);

INSERT INTO Members
(memberid, name, Email)
VALUES
(1,"fahad","fahad123@gmail.com"),
(2,"ahamd","ahamd335@gmail.com"),
(3,"amna","amna12@gmail.com");
SELECT*FROM members;

CREATE TABLE books(
bookid INT PRIMARY KEY,
title VARCHAR(50),
arthur VARCHAR(50),
genre VARCHAR(50)
);

INSERT INTO books
(bookid,title,arthur,genre)
VALUES
(1,"Harrypotter","Rowling","Fantasy"),
(2,"Alchemist","Coelho","Fiction"),
(3,"Mockingbird","Harperlee","Drama"),
(4,"Sherlockholmes","Conandoyle","Mystery");
SELECT*FROM books;

CREATE TABLE borrowrecord(
memberid INT,
bookid INT,
borrowdate DATE,
giveback DATE
);

INSERT INTO borrowrecord
(memberid,bookid,borrowdate,giveback)
VALUES
(1,1,'2025-10-23','2025-10-26'),
(2,2,'2025-11-10','2025-11-15'),
(3,3,'2025-11-17','2025-11-22'),
(4,4,'2025-12-10','2025-12-14');
SELECT*FROM borrowrecord;
SELECT members.name,books.title
from borrowrecord
JOIN members ON borrowrecord.memberid=members.memberid
JOIN books ON borrowrecord.bookid=books.bookid;

SELECT books.title
FROM borrowrecord
JOIN books ON borrowrecord.bookid=books.bookid
WHERE borrowrecord.giveback IS NULL;

SELECT members.name
FROM borrowrecord
JOIN members ON borrowrecord.memberid=members.memberid
JOIN books ON borrowrecord.bookid=books.bookid 
WHERE books.genre="computer science";
UPDATE books
SET genre ="computer science"
WHERE bookid = 1;

SELECT count(bookid)
FROM books;
SELECT count(memberid)
FROM borrowrecord;
SELECT 
count(books.genre)
FROM borrowrecord
JOIN books ON borrowrecord.bookid = books.bookid
GROUP BY books.genre;
SELECT 
Members.name,
COUNT(borrowrecord.bookid) 
FROM borrowrecord
JOIN Members ON borrowrecord.memberid = Members.memberid
GROUP BY Members.memberid, Members.name
HAVING COUNT(borrowrecord.bookid) > 1;




