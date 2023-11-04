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


