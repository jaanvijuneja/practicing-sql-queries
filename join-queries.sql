-- Display authors who haven't written any books.

select a.author_name
from books as b
right join authors as a
on b.author = a.author_name
where b.title IS NULL;

-- Determine the average price of books for each nationality.

select a.nationality, avg(b.price)
from books as b
join authors as a
on b.author = a.author_name
group by a.nationality;

-- Find all books along with their author's name and nationality.

select distinct b.title, a.author_name, a.nationality 
from books as b
inner join
authors as a
on b.author = a.author_name;

-- Determine how many books each author has written and include the author's name in the result.

select b.author, count(b.title)
from books as b
inner join
authors as a
on b.author = a.author_name
group by b.author;

-- List all authors, their book titles, and genres, even if they have not written any book.

select a.author_name, b.title, b.genre
from authors as a
full join
books as b
on a.author_name = b.author;

-- For each genre, find the author who has written the most books and list the titles of those books.

select a.author, a.genre
FROM (select tablec.author, tablec.genre, tablec.noofbooks
from (select genre, author, count(title) as noofbooks
from books
group by genre, author) tablec
inner join
(select genre, max(noofbooks) as maxbooks from 
(select genre, author, count(title) as noofbooks
from books
group by genre, author) tablea
group by genre) tableb
on tableb.genre = tablec.genre and tableb.maxbooks = tablec.noofbooks) a;

-- Find the nationality that represents the highest average book price, including at least 2 authors from that nationality in your result set.

select tablea.nationality, count(tablea.author), max(tablea.avgprice) as maxt
from
(select a.nationality, b. author, avg(b.price) as avgprice
from authors as a
inner join 
books as b
on a.author_name = b.author
group by a.nationality, b.author) tablea
group by tablea.nationality
having count(tablea.author) > 1;

-- Using a LEFT JOIN, identify authors who have no books in the books table and list their nationalities.

select a.author_name, a.nationality
from authors as a
left join books as b
on a.author_name = b.author
where b.title is Null;

-- Show the average book price and total number of books for each author, but only for authors who have written books costing more than $15

select author, count(title), avg(price)
from books
where price > 15
group by author;

-- Find the book with the highest price for each author, including authors who have not written any books.

select au.author_name, tablec.title, tablec.mp
from
authors as au
left join
(select a.author, a.title, tableb.maxprice as mp
from books as a
inner join
(select author, max(price) as maxprice
from books
group by author) tableb
on a.author = tableb.author and a.price = tableb.maxprice) tablec
on au.author_name = tablec.author;

-- Retrieve a list of book titles along with the names of their authors.

select b.title, a.author_name
from books as b
inner join authors as a
on b.author  = a.author_name;

-- Display all authors and the titles of their books. Include authors who haven't written any books in the list.

select a.author_name, b.title
from authors as a
left join
books as b
on a.author_name = b.author;

-- Show all book titles along with their authors, including books that do not have a corresponding author in the authors table.

select a.author_name, b.title
from authors as a
right join
books as b
on a.author_name = b.author;

-- (Note: MySQL does not directly support FULL OUTER JOIN, but you can achieve this using a combination of LEFT and RIGHT JOINs). List all books and all authors, showing the pairing where they exist.

SELECT a.author_name, b.title
FROM authors a
LEFT JOIN books b ON a.author_name = b.author

UNION

SELECT a.author_name, b.title
FROM authors a
RIGHT JOIN books b ON a.author_name = b.author;

-- List all books along with their authors, but only include books in the 'Fantasy' genre and authors who are 'British'.

select a.author_name, b.title
from authors as a
inner join
books as b
on a.author_name = b.author
where a.nationality = 'British' and b.genre = 'Fantasy';

-- Calculate the total number of books written by each author and display the author's name along with the count.

select a.author_name, count(b.title)
from authors as a
left join
books as b
on a.author_name = b.author
group by a.author_name;

-- Select all authors who have written more than 2 books.

select a.author_name
from authors as a
inner join 
books as b
on a.author_name = b.author
group by a.author_name
having count(b.title) > 2;

-- to find books

select title from books
where author in 
(select a.author_name
from authors as a
inner join 
books as b
on a.author_name = b.author
group by a.author_name
having count(b.title) > 2);