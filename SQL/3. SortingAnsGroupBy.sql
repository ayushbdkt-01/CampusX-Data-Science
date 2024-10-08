show databases;
use campusx;
show tables;
select * from smartphones;

-- top 5 samsung smartphones with largest screenSize
select * from smartphones 
where brand_name='samsung'
order by screen_size desc
Limit 5;

-- sort smartphones by total number of cameras
select model, num_front_cameras+num_rear_cameras as "Total_Cameras" from smartphones
order by Total_Cameras desc;

-- sort smartphones by PPI (calculare PPI)
select model, round(sqrt(resolution_width*resolution_width+resolution_height*resolution_height)/screen_size,2) as "PPI" from campusx.smartphones
order by PPI desc;

-- second largest battery_capacity wala phone
select model, battery_capacity from smartphones
order by battery_capacity desc
limit 1,1; -- limit x,y = start from xth row and print mext y rows

-- find name and rating of the worst rated apple smartphones
select model, rating from smartphones
where brand_name="Apple"
order by rating 
limit 1;

-- sort all phones alphabetically and then by rating in descending order
select * from smartphones
order by brand_name asc, rating desc;

-- sort all phones alphabetically and then by price in ascending order
select * from smartphones
order by brand_name asc, price asc;










-- group smartphones by brand and get count, avg price, maxRating, avg screenSize and avg batteryCapacity
select brand_name, count(*), 
round(avg(price)) as "AvgPrice", 
max(rating) as "MaxRating", 
round(avg(screen_size),2) as "AvgScreenSize", 
round(avg(battery_capacity)) as "AvgBatteryCapacity" from smartphones
group by brand_name;

-- as WHERE works with SELECT (filtering rows)
-- similarly HAVING works with GROUP BY (filtering aggeregate functions)

-- group smartphones by nfc and get avg price and avg rating
select has_nfc,
round(avg(price)) as "AvgPrice",
round(avg(rating)) as "AvgRating"from smartphones
group by has_nfc;

-- group smartphones by expandedMemoryAvailable and get the avgPrice
select extended_memory_available,
round(avg(price)) as "AvgPrice"
from smartphones
group by extended_memory_available;

-- grouping smartphones by 2 columns makes cardinalProduct of Columns

-- group the smartphone by brand and processor and get the number of Models and avg PrimaryCameraResolution (rear)
select brand_name, processor_brand,
count(*) as "NoOfPhones",
round(avg(primary_camera_rear)) as "AvgResolution"
from smartphones
group by brand_name, processor_brand;

-- get top 5 costly brands
select brand_name,
round(avg(price)) as "AvgPrice"
from smartphones
group by brand_name
order by AvgPrice desc
limit 5; 

-- which brand makes the smallest screen size
select brand_name,
round(avg(screen_size)) as "AvgSize"
from smartphones
group by brand_name
order by AvgSize asc
limit 1; 

-- find the brand with maxNumbers of 5G and NFC phones
select brand_name, count(*) as "Count"
from smartphones
where has_5g="True" and has_ir_blaster="True"
group by brand_name
order by count desc
limit 1;

-- get all 5G samsung phones and their avgPrice for NFC and non-NFC variants
select has_nfc, avg(price) as "AvgPrice"
from smartphones
where brand_name="Samsung" and has_5g="True"
group by has_nfc;

-- find the most costiliest phone 
select model, price 
from smartphones
order by price desc
limit 1;

-- count(*) gives the number of rows

-- give brands and avgPrice of brands where there is >40 phones of the brand
select brand_name, count(*) as "Count", round(avg(price)) as "AvgPrice"
from smartphones
group by brand_name having count(*)>40
order by  avgPrice desc;

-- find the avg rating of brands which have >20 phones 
select brand_name,count(*) as "Count", avg(rating) as "AvgRating"
from smartphones
group by brand_name having count(*)>40
order by avgRating desc;

-- find the top 3 brands with the highest avg_ram having a refresh_rate >=90hz and there should be fast charging and do not consider the brands with less than 10 phones
select brand_name, count(*) as"Count", avg(ram_capacity) as "AvgRam"
from smartphones 
where refresh_rate>=90 and fast_charging_available=1
group by brand_name having Count>10
order by AvgRam desc
limit 3; 

-- find avgPrice of all phone brands with avgRating>70 and NumOfPhones>10 among all 5G phones
select brand_name, count(*) as "Count", avg(Rating) as "AvgRating",avg(Price) as "AvgPrice"
from smartphones
where has_5g="True"
group by brand_name having Count>10 and AvgRating>70
order by AvgRating desc;