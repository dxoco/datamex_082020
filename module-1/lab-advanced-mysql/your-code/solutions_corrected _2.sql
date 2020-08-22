/* Step 1 */
/*
SELECT  authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',titles.title AS 'TITLE',
titles.price AS 'price', sales.qty AS '* qty', titles.royalty AS '* royalty /100', titleauthor.royaltyper AS '* royalty per /100',
titles.price * sales.qty * titles.royalty  * titleauthor.royaltyper * 0.0001 AS 'sales_royalty'
	FROM authors 
	JOIN titleauthor ON authors.au_id = titleauthor.au_id
	JOIN titles ON titleauthor.title_id = titles.title_id
    JOIN sales ON titles.title_id = sales.title_id
ORDER BY sales_royalty DESC
*/
/* Step 2 */
/*
SELECT  authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',titles.title AS 'TITLE',
titles.price AS 'price', sales.qty AS '* qty', titles.royalty AS '* royalty /100', titleauthor.royaltyper AS '* royalty per /100',
titles.price * sales.qty * titles.royalty  * titleauthor.royaltyper * 0.0001 AS 'sales_royalty'
	FROM authors 
	JOIN titleauthor ON authors.au_id = titleauthor.au_id
	JOIN titles ON titleauthor.title_id = titles.title_id
    JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id, titleauthor.title_id
*/
/* step 3 */
/*
CREATE TEMPORARY TABLE temp_moneys_2
SELECT  authors.au_id as 'AUTHOR_ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',titles.title AS 'TITLE',
titles.price AS 'price', sales.qty AS '* qty', titles.royalty AS '* royalty /100', titleauthor.royaltyper AS '* royalty per /100', titles.advance AS 'advance',
titles.price * sales.qty * titles.royalty  * titleauthor.royaltyper * 0.0001 + titles.advance AS 'moneys'
	FROM authors 
	JOIN titleauthor ON authors.au_id = titleauthor.au_id
	JOIN titles ON titleauthor.title_id = titles.title_id
    JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
*/
/*
select * from temp_moneys_2
*/

SELECT temp_moneys_2.AUTHOR_ID AS 'AUTHOR_ID', SUM(temp_moneys_2.moneys) AS 'total moneys'
FROM temp_moneys_2
GROUP BY temp_moneys_2.AUTHOR_ID DESC


/* failing to sum by author_id on temporary table */