use stylecraze;

select * from wp_weightloss_lead where email = 'sharma99@incnut.com';


SELECT * FROM wp_posts
LEFT JOIN wp_term_relationships ON
(wp_posts.ID = wp_term_relationships.object_id)
LEFT JOIN wp_term_taxonomy ON
(wp_term_relationships.term_taxonomy_id = wp_term_taxonomy.term_taxonomy_id)
WHERE wp_posts.post_status = 'publish'
AND wp_posts.post_type = 'post'
AND wp_term_taxonomy.taxonomy = 'category'
AND wp_term_taxonomy.term_id = 17453
ORDER BY post_date DESC;

SELECT ID, post_name FROM wp_posts
LEFT JOIN wp_term_relationships ON
(wp_posts.ID = wp_term_relationships.object_id)
LEFT JOIN wp_term_taxonomy ON
(wp_term_relationships.term_taxonomy_id = wp_term_taxonomy.term_taxonomy_id)
WHERE wp_posts.post_status = 'publish'
AND wp_posts.post_type = 'post'
AND wp_term_taxonomy.taxonomy = 'category'
AND wp_term_taxonomy.term_id = 17453
ORDER BY post_date DESC;


SELECT 
t1.ID,
t1.post_title,
t1.post_name,
t1.post_date,
t1.post_modified,
t1.post_author,
t1.comment_count,
t2.display_name,
t2.user_email,
LENGTH(t1.post_content) - LENGTH(REPLACE(t1.post_content, ' ', ''))+1 AS "word_count",
(SELECT group_concat(wp_terms.name separator ', ') 
	FROM wp_terms 
	INNER JOIN wp_term_taxonomy on wp_terms.term_id = wp_term_taxonomy.term_id 
	INNER JOIN wp_term_relationships wpr on wpr.term_taxonomy_id = wp_term_taxonomy.term_taxonomy_id 
	WHERE taxonomy= 'category' and t1.ID = wpr.object_id 
) AS "Categories" 
FROM wp_posts t1 
RIGHT JOIN wp_users t2 
ON t1.post_author = t2.ID 
WHERE t1.post_type='post' AND t1.post_status='publish';