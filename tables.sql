-- drop table talenti;
-- drop table talentiReviews;
-- drop table breyers;
-- drop table breyersReviews;
-- drop table hd;
-- drop table hdReviews;
-- drop table bj;
-- drop table bjReviews;
-- drop table combinedProducts;
-- drop table combinedReviews;
-- -- drop table productFlavor;
-- -- drop table flavor;
-- -- drop table productIngredient;
-- -- drop table ingredient;

create table talenti (
    tp_key char(32) primary key,
    tp_name char(32) not null,
    tp_description char(200) not null,
    tp_rating decimal(5,0),
    tp_rating_count decimal(5,0),
    tp_ingredients char(200) not null
);

create table talentiReviews (
    tr_key char(32) not null,
    tr_author char(32) not null,
    tr_date date not null,
    tr_stars decimal(5,0),
    tr_title char(32) not null,
    tr_helpful_yes decimal(5,0),
    tr_helpful_no decimal(5,0),
    tr_text char(200) not null
);

create table breyers (
    bp_key char(32) primary key,
    bp_name char(32) not null,
    bp_description char(200) not null,
    bp_rating decimal(5,0),
    bp_rating_count decimal(5,0),
    bp_ingredients char(200) not null
);

create table breyersReviews (
    br_key char(32) not null,
    br_author char(32) not null,
    br_date date not null,
    br_stars decimal(5,0),
    br_title char(32) not null,
    br_helpful_yes decimal(5,0),
    br_helpful_no decimal(5,0),
    br_text char(200) not null
);

create table hd (
    hdp_key char(32) primary key,
    hdp_name char(32) not null,
    hdp_description char(200) not null,
    hdp_rating decimal(5,0),
    hdp_rating_count decimal(5,0),
    hdp_ingredients char(200) not null
);

create table hdReviews (
    hdr_key char(32) not null,
    hdr_author char(32) not null,
    hdr_date date not null,
    hdr_stars decimal(5,0),
    hdr_title char(32) not null,
    hdr_helpful_yes decimal(5,0),
    hdr_helpful_no decimal(5,0),
    hdr_text char(200) not null,
    --special for hd
    hdr_taste decimal(5,0),
    hdr_ingredients decimal(5,0),
    hdr_texture decimal(5,0),
    hdr_likes decimal(5,0)
);

create table bj (
    bjp_key char(32) primary key,
    bjp_name char(32) not null,
    --special for bj
    bjp_subhead char(200) not null,
    bjp_description char(200) not null,
    bjp_rating decimal(5,0),
    bjp_rating_count decimal(5,0),
    bjp_ingredients char(200) not null
);

create table bjReviews (
    bjr_key char(32) not null,
    bjr_author char(32) not null,
    bjr_date date not null,
    bjr_stars decimal(5,0),
    bjr_title char(32) not null,
    bjr_helpful_yes decimal(5,0),
    bjr_helpful_no decimal(5,0),
    bjr_text char(200) not null
);

create table combinedProducts (
    cp_brand char(32) not null,
    cp_key char(32) primary key,
    cp_name char(32) not null,
    --special for bj
    cp_subhead char(200) null,
    cp_description char(200) not null,
    cp_rating decimal(5,0),
    cp_rating_count decimal(5,0),
    cp_ingredients char(200) not null
);

create table combinedReviews (
    cr_brand char(32) not null,
    cr_key char(32) not null,
    cr_author char(32) not null,
    cr_date date not null,
    cr_stars decimal(5,0),
    cr_title char(32) not null,
    cr_helpful_yes decimal(5,0),
    cr_helpful_no decimal(5,0),
    cr_text char(200) not null,
    --special for hd
    cr_taste decimal(5,0),
    cr_ingredients decimal(5,0),
    cr_texture decimal(5,0),
    cr_likes decimal(5,0)
);

-- create table productFlavor (
--     pf_productkey char(32) not null,
--     pf_flavorkey char(32) primary key
-- );

-- create table flavor (
--     f_name char(32) not null,
--     f_flavorkey char(32) primary key
-- );

-- create table productIngredient (
--     pi_productkey char(32) not null,
--     pi_flavorkey char(32) primary key
-- );

-- create table ingredient (
--     i_name char(32) not null,
--     i_flavorkey char(32) primary key
-- )