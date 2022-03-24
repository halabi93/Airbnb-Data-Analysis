DROP TABLE IF EXISTS communities CASCADE;
DROP TABLE IF EXISTS listing CASCADE;
DROP TABLE IF EXISTS airbnb_loc CASCADE;


CREATE TABLE communities (
    community_area serial,
    neighborhood varchar(30),
	PRIMARY KEY(neighborhood)
);

CREATE TABLE listing (
    "id" int PRIMARY KEY NOT NULL,
    host_id int NOT NULL,
    host_name text NOT NULL,
    room_type text NOT NULL,
    price money   NOT NULL,
    minimum_nights int   NOT NULL,
    number_of_reviews int   NOT NULL,
    last_review date   NOT NULL,
    reviews_per_month float   NOT NULL,
    calculated_host_listings_count int   NOT NULL,
    availability_365 int   NOT NULL
);

CREATE TABLE airbnb_loc (
    "id" int PRIMARY KEY NOT NULL,
    address text   NOT NULL,
    neighborhood varchar(30)  NOT NULL,
    latitude float   NOT NULL,
    longitude float   NOT NULL
);

ALTER TABLE "airbnb_loc" ADD CONSTRAINT "fk_airbnb_loc_id" FOREIGN KEY("id")
REFERENCES "listing" ("id");

ALTER TABLE "airbnb_loc" ADD CONSTRAINT "fk_airbnb_loc_neighborhood" FOREIGN KEY("neighborhood")
REFERENCES "communities" 

	
select * from communities
select * from listing
select * from airbnb_loc