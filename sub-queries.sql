# Find the titles of books that have a price higher than the average price of all books.

select title from books where price >
(select avg(price) from books);

# Select all authors who have written more books than the average number of books per author.

select author, count(title) from books
group by author
having count(title) > (select count(*)/count(distinct author) from books);

# Retrieve the details of the oldest author and their books.

select title from books where author = 
(select author_name from authors where birth_year = 
(select min(birth_year) from authors));

# List the books written by the author with the highest number of books in the database.

select max(no_of_books) from 
(select b.author,count(b.title) as no_of_books from books as b
group by b.author) as ab;


# Create a list showing each genre and the average price of books in that genre then use this list to find genres where the average price is greater than the overall average price of all books.

select genre, avg(price) from books
group by genre
having avg(price) > (select avg(price) from books);

# Select author names along with the count of books they have written 

select author,count(title) from books
group by author;

# Find the author that have a higher price.

select author, max(price)
from books
group by author;

# Get the titles of books whose author was born before 1900

select author, title from books where author IN
(select author_name from authors
where birth_year < 1900);

# List the authors who are either British or American and have written a book in the database.

select distinct author from books where author IN
(select author_name from authors
where nationality IN ('British', 'American'));

# Find the names of authors who have written a book in the 'Fantasy' genre.

select distinct author from books
where genre = 'Fantasy';