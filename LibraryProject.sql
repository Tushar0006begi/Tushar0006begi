# Bookstore Analysis/ Library Management System Here is one of the most fun SQL projects for beginners in SQL. 
# Recall your school days. You must have come across various books. Work on this project and set up a virtual bookstore with your favorite books.
# Dataset: Imagine you run a chain of bookstores. Create a sample dataset of your favorite books by noting the following details for each book in a table: Book_ID, Book Name, Publisher, ISBN, Edition, Number of pages, Sales, City, and Price.

CREATE DATABASE Library;
USE library;

CREATE TABLE Books(Book_ID INT, 
Book_Name varchar(50),
Publisher VARCHAR(50),
ISBN varchar(50), 
Edition int ,
No_pages int, 
sales decimal,
city varchar(50),
price int);

INSERT INTO Books (Book_ID, Book_Name, Publisher, ISBN, Edition, No_pages, sales, city, price)  
VALUES  
(1, 'The Silent Patient', 'Celestial Press', '9781786892737', 2, 336, 12045.50, 'New York', '25'),  
(2, 'Atomic Habits', 'Penguin Random House', '9780735211292', 1, 320, 45200.75, 'Los Angeles', '30'),  
(3, 'Educated', 'Random House', '9780399590504', 3, 400, 31000.00, 'Chicago', '28'),  
(4, 'Sapiens', 'HarperCollins', '9780062316097', 2, 498, 27500.60, 'San Francisco', '35'),  
(5, 'Becoming', 'Crown Publishing', '9781524763138', 1, 448, 67000.25, 'Washington', '40'),  
(6, 'Where the Crawdads Sing', 'Putnam', '9780735219090', 1, 368, 58500.90, 'Houston', '27'),  
(7, 'The Midnight Library', 'HarperCollins', '9780525559474', 2, 304, 22350.80, 'Dallas', '26'),  
(8, 'Dune', 'Ace Books', '9780441013593', 4, 896, 19800.40, 'Boston', '22'),  
(9, '1984', 'Secker & Warburg', '9780451524935', 5, 328, 33000.60, 'Seattle', '18'),  
(10, 'To Kill a Mockingbird', 'J.B. Lippincott & Co.', '9780061120084', 6, 281, 41250.90, 'Miami', '20'),  
(11, 'The Catcher in the Rye', 'Little, Brown', '9780316769488', 3, 277, 27550.50, 'Atlanta', '22'),  
(12, 'The Great Gatsby', 'Scribner', '9780743273565', 4, 180, 52000.75, 'Denver', '24'),  
(13, 'Pride and Prejudice', 'T. Egerton', '9781503290563', 7, 279, 18750.30, 'Phoenix', '15'),  
(14, 'The Hobbit', 'Allen & Unwin', '9780547928227', 5, 310, 49800.85, 'Philadelphia', '28'),  
(15, 'Moby Dick', 'Harper & Brothers', '9781503280786', 3, 585, 16500.20, 'San Diego', '19');  

-- 1. Quires 
SELECT * FROM Books ORDER BY price DESC LIMIT 1;
-- OR 
SELECT Book_Name,MAX(price) as Max_price FROM Books GROUP BY Book_Name ORDER BY Max_price DESC LIMIT 1;

-- 2. What are the most popular books in each city?
SELECT b1.*  
FROM Books b1  
WHERE sales = (  
    SELECT MAX(b2.sales)  
    FROM Books b2  
    WHERE b2.city = b1.city  
);

-- 3. ch is the most bought book?

SELECT Book_Name,MAX(sales) as MAX_Sales FROM Books GROUP BY Book_name ORDER BY Max_Sales DESC LIMIT 1;
-- OR
SELECT *  
FROM Books  
WHERE sales = (SELECT MAX(sales) FROM Books);

-- 4. Which book is least preferred by the readers?
SELECT * FROM Books ORDER BY sales ASC LIMIT 1;
-- OR
SELECT *  
FROM Books  
WHERE sales = (SELECT MIN(sales) FROM Books);



