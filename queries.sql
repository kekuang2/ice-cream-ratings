---------------------------- POST -------------------------
--1 inserting an authors own review of a brand
insert into bjReviews values("0_bj", "rusu", "11/15/21", "1", "Awful", '2', '10', 'Tasted awful i hated it.');
insert into combinedReviews values("bj", "0_bj", "rusu", "11/15/21", "1", "Awful", '2', '10', 'Tasted awful i hated it.', NULL, NULL, NULL, NULL);
--2 insert a new product
insert into hd values("70_hd","Neopolitan Rusu Style", "CSE-111 flavored icecream", "4.2", "100", "CREAM, MILK, SUGAR, DATABASE, MATH");
insert into combinedProducts values("hd", "70_hd","Neopolitan Rusu Style", "CSE-111 flavored icecream","Awesome database flavoring", "4.2", "100", "CREAM, MILK, SUGAR, DATABASE, MATH");

---------------------------- PUT -------------------------

--3updates the number of ratings
update bj set bjp_rating_count = '209' where bjp_key = '0_bj';
update combinedProducts set cp_rating_count = '209' where cp_key = '0_bj';
--4 updates the rating score
update bj set bjp_rating = '3.8' where bjp_key = '0_bj';
update combinedProducts set cp_rating = '3.8' where cp_key = '0_bj';
--5 updates empty authors as Anonymous
update hdReviews set hdr_author = "Anonymous" where hdr_author = '';
update combinedReviews set cr_author = "Anonymous" where cr_author = '';

---------------------------- DELETE -------------------------

--6 deleting review
delete from bjReviews where bjr_author = "rusu";
delete from combinedReviews where bjr_author = "rusu";
--7 deleting product
delete from hd where hdp_key = "70_hd";
delete from combinedProducts where cp_key = "70_hd";

---------------------------- GET -------------------------


--8 looking for a specific brand, like breyer's 
select cp_name
from combinedProducts
where cp_brand is 'breyers'
group by cp_name;

--9 does not like ben and jerry's
select cp_brand, cp_name
from combinedProducts
where cp_brand is not 'bj'
group by cp_brand, cp_name;

--10 is allergic to peanut
select cp_brand, cp_name
from combinedProducts
where cp_ingredients not like '%peanut%'
group by cp_brand, cp_name;

--11 looking for ben and jerry's ice cream described as chocolate
select bjp_name
from bj
where bjp_subhead like "%chocolate%"
group by bjp_name;

--12 flavors that are above a 4 rating and has at least 100 reviews
select cp_brand, cp_name
from combinedProducts
where cp_rating >= 4
and cp_rating_count >= 100
group by cp_brand, cp_name;

--13 avg rating for a brand
select cp_brand, round(avg(cp_rating), 1) as rating
from combinedProducts
group by cp_brand;

--14 number of flavors for each brand
select cp_brand, count(cp_name)
from combinedProducts
group by cp_brand;

--15 number of reviews for each brand
select cr_brand, count(cr_key)
from combinedReviews
group by cr_brand;

--16 looks for the least helpful review across all brands
select cp_brand, cp_name, cr_author, cr_date, max(cr_helpful_no), cr_text
from combinedProducts, combinedReviews
where cp_key = cr_key
group by cp_brand

--17 looks for the most helpful review across all brands
select cp_brand, cp_name, cr_author, cr_date, max(cr_helpful_yes), cr_text
from combinedProducts, combinedReviews
where cp_key = cr_key
group by cp_brand

--18 reviews of flavors that are above a 3 rating and has at least 150 reviews
select cp_brand, cp_name, cr_author, cr_text
from combinedProducts, combinedReviews
where cp_key = cr_key
and cp_rating >= 3
and cp_rating_count >= 150
and cr_stars = 1
group by cp_brand, cp_name;

--19 gets the average scores for the special Haagen-Daaz review categories
select hdp_name, round(avg(hdr_taste), 1) as taste, round(avg(hdr_ingredients), 1) as ingredients, round(avg(hdr_texture), 1) as texture
from hd, hdReviews
where hdp_key = hdr_key
group by hdp_name;

--20 flavors with ratings that have improved in the last year
select cp_brand, cp_name, round(avg(cr1.cr_stars), 1) as recent, round(avg(cr2.cr_stars), 1) as previous
from combinedProducts, combinedReviews as cr1, combinedReviews as cr2
where cp_key = cr1.cr_key
and cr1.cr_key = cr2.cr_key
and cr1.cr_date like "%/20"
and cr2.cr_date not like "%/20"
group by cp_brand, cp_name
having recent > previous;