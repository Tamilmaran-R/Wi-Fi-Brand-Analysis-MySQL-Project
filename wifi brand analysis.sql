CREATE DATABASE wifi_analysis_db
USE wifi_analysis_db


CREATE TABLE wifi_brands (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(50),
    country VARCHAR(50))

CREATE TABLE wifi_models (
    model_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_id INT,
    model_name VARCHAR(50),
    speed_mbps INT,
    price DECIMAL(10,2),
    rating DECIMAL(3,2),
    stock INT,
    sold_units INT,
    FOREIGN KEY (brand_id) REFERENCES wifi_brands(brand_id))
    
-----------------------------------  
Total routers sold per brand

select b.brand_name,sum(m.sold_units) as total_sold
from wifi_models as m
join wifi_brands as b on m.brand_id=b.brand_id
group by b.brand_name
order by total_sold desc
----------------------------------
Average rating per brand

select b.brand_name,round(avg(m.rating),2) as average_rating
from  wifi_models as m
join wifi_brands as b on m.brand_id=b.brand_id
group by b.brand_name
order by average_rating desc
----------------------------------------
Average price per brand

select b.brand_name,round(avg(m.price),2) as average_price
from  wifi_models as m
join wifi_brands as b on m.brand_id=b.brand_id
group by b.brand_name
order by average_price desc
-------------------------------------

Top 3 high-speed routers

select model_name,speed_mbps,rating
from wifi_models
order by speed_mbps desc
limit 3

-------------------------------
Best value routers

SELECT model_name, 
       speed_mbps, 
       price, 
       ROUND(speed_mbps / price, 2) AS value_score
FROM wifi_models
ORDER BY value_score DESC
LIMIT 5;
------------------------------------
Count _models per country

select b.country,count(m.model_id) as total_model
from  wifi_models as m
join wifi_brands as b on m.brand_id=b.brand_id
group by b.country
order by total_model desc
-----------------------------------
Brands with average rating above 3

select b.brand_name,round(avg(m.rating),2) as average_rating
from  wifi_models as m
join wifi_brands as b on m.brand_id=b.brand_id
group by b.brand_name
having average_rating>3

------------------------------------
Total stock and sold units by brand

select b.brand_name,
sum(m.stock)as total_stock,
sum(m.sold_units)as total_sold
from wifi_models as m
join wifi_brands as b on m.brand_id=b.brand_id
group by b.brand_name
--------------------------------------------------
fastest model per brand

select b.brand_name,m.model_name,m.speed_mbps as max_speed
from wifi_models as m
join wifi_brands as b on m.brand_id=b.brand_id
where (b.brand_id,m.speed_mbps) in
(select brand_id,max(speed_mbps)
from wifi_models
group by brand_id
)
----------------------------------------------------
slowest model per brand

select b.brand_name,m.model_name,m.speed_mbps as min_speed
from wifi_models as m
join wifi_brands as b on m.brand_id=b.brand_id
where (b.brand_id,m.speed_mbps) in
(select brand_id,min(speed_mbps)
from wifi_models
group by brand_id
)

