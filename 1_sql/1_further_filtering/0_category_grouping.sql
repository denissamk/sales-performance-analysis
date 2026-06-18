--GROUPING ALL 72 PRODUCT CATEGORIES INTO 12 PRODUCT MACRO-CATEGORIES FOR A CLEANER ANALYSIS

--IDENTIFYING ALL OF THE CATEGORIES
SELECT
	DISTINCT product_category
FROM
	dim_product
ORDER BY
	1;

--INSERTING A NEW "macro_category" COLUMN to dim_product table
ALTER TABLE
	dim_product
ADD COLUMN
	macro_category VARCHAR(50);

--FILL THE "macro_category" COLUMN VALUES
UPDATE 
	dim_product
SET
	macro_category =
	CASE
	    -- Electronics & Technology
	    WHEN product_category IN (
	        'air_conditioning',
	        'audio',
	        'cine_photo',
	        'computers',
	        'computers_accessories',
	        'consoles_games',
	        'electronics',
	        'fixed_telephony',
	        'small_appliances',
	        'small_appliances_home_oven_and_coffee',
	        'tablets_printing_image',
	        'telephony'
	    ) THEN 'Electronics & Technology'
	
	    -- Home & Furniture
	    WHEN product_category IN (
	        'bed_bath_table',
	        'furniture_bedroom',
	        'furniture_decor',
	        'furniture_living_room',
	        'furniture_mattress_and_upholstery',
	        'home_appliances',
	        'home_appliances_2',
	        'home_comfort_2',
	        'home_confort',
	        'housewares',
	        'kitchen_dining_laundry_garden_furniture',
	        'la_cuisine'
	    ) THEN 'Home & Furniture'
	
	    -- Fashion & Accessories
	    WHEN product_category IN (
	        'fashio_female_clothing',
	        'fashion_bags_accessories',
	        'fashion_childrens_clothes',
	        'fashion_male_clothing',
	        'fashion_shoes',
	        'fashion_sport',
	        'fashion_underwear_beach',
	        'luggage_accessories',
	        'watches_gifts'
	    ) THEN 'Fashion & Accessories'
	
	    -- Beauty & Health
	    WHEN product_category IN (
	        'health_beauty',
	        'perfumery',
	        'diapers_and_hygiene'
	    ) THEN 'Beauty & Health'
	
	    -- Sports, Toys & Leisure
	    WHEN product_category IN (
	        'sports_leisure',
	        'toys',
	        'cool_stuff',
	        'party_supplies'
	    ) THEN 'Sports, Toys & Leisure'
	
	    -- Books, Media & Entertainment
	    WHEN product_category IN (
	        'books_general_interest',
	        'books_imported',
	        'books_technical',
	        'cds_dvds_musicals',
	        'dvds_blu_ray',
	        'music',
	        'musical_instruments'
	    ) THEN 'Books, Media & Entertainment'
	
	    -- Food & Beverage
	    WHEN product_category IN (
	        'food',
	        'food_drink',
	        'drinks'
	    ) THEN 'Food & Beverage'
	
	    -- Baby & Kids
	    WHEN product_category IN (
	        'baby'
	    ) THEN 'Baby & Kids'
	
	    -- Automotive
	    WHEN product_category IN (
	        'auto'
	    ) THEN 'Automotive'
	
	    -- Construction, Garden & Tools
	    WHEN product_category IN (
	        'construction_tools_construction',
	        'construction_tools_lights',
	        'construction_tools_safety',
	        'costruction_tools_garden',
	        'costruction_tools_tools',
	        'garden_tools',
	        'home_construction'
	    ) THEN 'Construction, Garden & Tools'
	
	    -- Business & Office
	    WHEN product_category IN (
	        'office_furniture',
	        'stationery',
	        'industry_commerce_and_business',
	        'agro_industry_and_commerce',
	        'market_place'
	    ) THEN 'Business & Office'
	
	    -- Specialty & Other
	    WHEN product_category IN (
	        'art',
	        'arts_and_craftmanship',
	        'christmas_supplies',
	        'flowers',
	        'pet_shop',
	        'security_and_services',
	        'signaling_and_security',
	        'Unknown'
	    ) THEN 'Specialty & Other'
	END