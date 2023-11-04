# Display authors who haven't written any books.

select a.author_name
from books as b
right join authors as a
on b.author = a.author_name
where b.title IS NULL;

# Determine the average price of books for each nationality.

select a.nationality, avg(b.price)
from books as b
join authors as a
on b.author = a.author_name
group by a.nationality;

# Find all books along with their author's name and nationality.

select distinct b.title, a.author_name, a.nationality 
from books as b
inner join
authors as a
on b.author = a.author_name;

# Determine how many books each author has written and include the author's name in the result.

select b.author, count(b.title)
from books as b
inner join
authors as a
on b.author = a.author_name
group by b.author;

# List all authors, their book titles, and genres, even if they have not written any book.

select a.author_name, b.title, b.genre
from authors as a
full join
books as b
on a.author_name = b.author;

