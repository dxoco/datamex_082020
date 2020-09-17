/* Step 1 */
/*
CREATE TEMPORARY TABLE temp_money_1
SELECT  authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',titles.title AS 'TITLE ID',
titles.price AS 'price', sales.qty AS '* qty', titles.royalty AS '* royalty /100', titleauthor.royaltyper AS '* royalty per /100',
titles.price * sales.qty * titles.royalty  * titleauthor.royaltyper * 0.0001 AS 'sales_royalty'
	FROM titles 
	JOIN titleauthor ON titles.title_id = titleauthor.title_id
	JOIN authors ON titleauthor.au_id = authors.au_id
    JOIN sales ON titles.title_id = sales.title_id
ORDER BY sales_royalty DESC
*/
/* Step 2 */
/*
CREATE TEMPORARY TABLE temp_money_2
SELECT  authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',titles.title AS 'TITLE',
titles.price AS 'price', sales.qty AS '* qty', SUM(ROYALTY) 'ROYALTIES',
titles.price * sales.qty * titles.royalty  * titleauthor.royaltyper * 0.0001 AS 'sum_royalties'
	FROM titles 
	JOIN titleauthor ON titles.title_id = titleauthor.title_id
	JOIN authors ON titleauthor.au_id = authors.au_id
    JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id, titleauthor.title_id
*/
/* step 3 */
/*
 SELECT temp_money_3.au_id 'AUTHOR ID', SUM(temp_money_3.advance + ROYALTIES) 'PROFITS'
 FROM ( SELECT temp_money_2.title_id, temp_money_2.au_id, temp_money_2.advance, SUM(ROYALTY) 'ROYALTIES'
	FROM ( SELECT titles.title_id, authors.au_id, titles.advance, (titles.price * sales.qty * titles.royalty * titleauthor.royaltyper * 0.0001) 'ROYALTY'
			FROM titles
			JOIN titleauthor ON titles.title_id = titleauthor.title_id
			JOIN sales ON titles.title_id = sales.title_id
			JOIN authors ON titleauthor.au_id = authors.au_id
        ) AS temp_money_2
        GROUP BY au_id, title_id
    ) AS temp_money_3
GROUP BY temp_money_3.au_id
ORDER BY PROFITS DESC
LIMIT 3;
*/