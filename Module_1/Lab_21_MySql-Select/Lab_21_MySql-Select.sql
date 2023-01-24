-- AUTHOR ID - the ID of the author
-- LAST NAME - author last name
-- FIRST NAME - author first name
-- TITLE - name of the published title
-- PUBLISHER - name of the publisher where the title was published
-- CHALLENGE 1
USE publications;
CREATE TABLE Challenge1 AS
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name from
authors LEFT join titleauthor
on authors.au_id=titleauthor.au_id
left join titles
on titleauthor.title_id=titles.title_id
left join publishers
on titles.pub_id=publishers.pub_id;

-- Challenge 2
-- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.

SELECT pub_name as publisher, concat(au_fname, " ", au_lname) as name, count(DISTINCT title) from Challenge1
Group by name, pub_name
ORDER by publisher desc;

-- Challenge 3
-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
-- AUTHOR ID - the ID of the author
-- LAST NAME - author last name
-- FIRST NAME - author first name
-- TOTAL - total number of titles sold from this author
-- Your output should be ordered based on TOTAL from high to low.
-- Only output the top 3 best selling authors.

CREATE TABLE Challenge3 AS
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, sales.ord_num, sales.qty from
authors LEFT join titleauthor
on authors.au_id=titleauthor.au_id
left join titles
on titleauthor.title_id=titles.title_id
left join sales
on titles.title_id=sales.title_id;

SELECT au_id, concat(au_fname, " ", au_lname) as name, sum(qty) from Challenge3
Group by name
ORDER BY sum(qty) DESC
LIMIT 3;

-- Challenge 4
-- Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). Also order your results based on TOTAL from high to low.

UPDATE Challenge3
SET qty=0
WHERE qty IS NULL;

SELECT au_id, concat(au_fname, " ", au_lname) as name, sum(qty) from Challenge3
Group by name
ORDER BY sum(qty) DESC;

