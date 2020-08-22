/* challenge 1*/
/*
SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER'
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
*/

/* challenge 2 */
/*
CREATE TABLE challenge2
(
AUTHOR_ID VARCHAR(255),
LAST_NAME VARCHAR(255),
FIRST_NAME VARCHAR(255),
PUBLISHER VARCHAR(255)
)
INSERT INTO challenge2
SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', publishers.pub_name as 'PUBLISHER'
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
*/
/*
SELECT t.stor_id as id_store, t.title_id as id_title, count(*) AS 'C(*)'
FROM (SELECT sales.stor_id, sales.ord_num, sales.title_id, stores.city
	FROM sales
	LEFT JOIN stores
	ON sales.stor_id = stores.stor_id) AS t
GROUP BY title_id;
*/
/*
SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', publishers.pub_name as 'PUBLISHER', count(*) AS 'TITLE COUNT'
	FROM authors
	JOIN titleauthor ON authors.au_id = titleauthor.au_id
	JOIN titles ON titleauthor.title_id = titles.title_id
	JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, pub_name;
*/
/* challenge 3 */
/*
SELECT  authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',SUM(titles.ytd_sales) AS 'TOTAL'
	FROM authors 
	JOIN titleauthor ON authors.au_id = titleauthor.au_id
	JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY SUM(ytd_sales) DESC
LIMIT 3
/* got sorting resolved here: https://dba.stackexchange.com/questions/52476/how-to-get-a-list-result-of-best-selling-items */
/**/
/* challenge 4 */
SELECT  authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',SUM(titles.ytd_sales) AS 'TOTAL'
	FROM authors 
	JOIN titleauthor ON authors.au_id = titleauthor.au_id
	JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY SUM(ytd_sales) DESC
