.mode "csv"
.separator ","
.header off

.import /Users/kevinkuang/Desktop/CSE111/Project/data/talenti/products.csv talenti
.import /Users/kevinkuang/Desktop/CSE111/Project/data/talenti/reviews.csv talentiReviews
.import /Users/kevinkuang/Desktop/CSE111/Project/data/breyers/products.csv breyers
.import /Users/kevinkuang/Desktop/CSE111/Project/data/breyers/reviews.csv breyersReviews
.import /Users/kevinkuang/Desktop/CSE111/Project/data/hd/products.csv hd
.import /Users/kevinkuang/Desktop/CSE111/Project/data/hd/reviews.csv hdReviews
.import /Users/kevinkuang/Desktop/CSE111/Project/data/bj/products.csv bj
.import /Users/kevinkuang/Desktop/CSE111/Project/data/bj/reviews.csv bjReviews
.import /Users/kevinkuang/Desktop/CSE111/Project/data/combined/products.csv combinedProducts
.import /Users/kevinkuang/Desktop/CSE111/Project/data/combined/reviews.csv combinedReviews

.import /Users/kevinkuang/Desktop/CSE111/Project/data/flavors/products.csv productFlavor
create temporary table temp(pf_productkey, pf_flavorkey);
insert into temp select pf_productkey, pf_flavorkey from productFlavor;
drop table productFlavor;
create table productFlavor(pf_productkey, pf_flavorkey);
insert into productFlavor select pf_productkey, pf_flavorkey from temp;
drop table temp;

.import /Users/kevinkuang/Desktop/CSE111/Project/data/flavors/products.csv flavor
create temporary table temp(f_descriptionname, f_flavorkey);
insert into temp select f_descriptionname, f_flavorkey from flavor;
drop table flavor;
create table flavor(f_descriptionname, f_flavorkey);
insert into flavor select f_descriptionname, f_flavorkey from temp;
drop table temp;

.import /Users/kevinkuang/Desktop/CSE111/Project/data/ingredients/products.csv productIngredient
create temporary table temp(pi_productkey, pi_ingredientkey);
insert into temp select pi_productkey, pi_ingredientkey from productIngredient;
drop table productIngredient;
create table productIngredient(pi_productkey, pi_ingredientkey);
insert into productIngredient select pi_productkey, pi_ingredientkey from temp;
drop table temp;


.import /Users/kevinkuang/Desktop/CSE111/Project/data/ingredients/products.csv ingredient
create temporary table temp(i_ingredientname, i_ingredientkey);
insert into temp select i_ingredientname, i_ingredientkey from ingredient;
drop table ingredient;
create table ingredient(i_ingredientname, i_ingredientkey);
insert into ingredient select i_ingredientname, i_ingredientkey from temp;
drop table temp;