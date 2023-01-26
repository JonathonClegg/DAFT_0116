USE publications;

-- Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication

SELECT t.title_id, 
ta.au_id, 
(ta.royaltyper*(t.royalty/100)) AS advance,
(t.price * s.qty * (t.royalty / 100) * (ta.royaltyper / 100)) AS sales_royalty
FROM
titles t LEFT JOIN titleauthor ta
ON t.title_id=ta.title_id
LEFT JOIN sales s
ON s.title_id=ta.title_id;

-- Step 2: Aggregate the total royalties for each title and author

SELECT summary.title_id, summary.au_id, summary.advance, SUM(summary.sales_royalty) AS aggregated_royalties
FROM
	(SELECT t.title_id, 
	ta.au_id, 
	(ta.royaltyper*(t.royalty/100)) AS advance,
	(t.price * s.qty * (t.royalty / 100) * (ta.royaltyper / 100)) AS sales_royalty
	FROM
	titles t INNER JOIN titleauthor ta
	ON t.title_id=ta.title_id
	INNER JOIN sales s
	ON s.title_id=ta.title_id
    )AS Summary
GROUP BY title_id, au_id;
    
-- Step 3: Calculate the total profits of each author

SELECT summary.au_id, (summary.advance+SUM(summary.sales_royalty)) AS profits
FROM
	(SELECT t.title_id, 
	ta.au_id, 
	(ta.royaltyper*(t.royalty/100)) AS advance,
	(t.price * s.qty * (t.royalty / 100) * (ta.royaltyper / 100)) AS sales_royalty
	FROM
	titles t INNER JOIN titleauthor ta
	ON t.title_id=ta.title_id
	INNER JOIN sales s
	ON s.title_id=ta.title_id
    )AS Summary
GROUP BY title_id, au_id
ORDER BY profits DESC
LIMIT 3;
    
