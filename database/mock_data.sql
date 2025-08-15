-- Mock data for Downtown Ottawa places
-- Realistic places with comprehensive data for AI testing

-- Insert restaurants
INSERT INTO places (name, place_type, cuisine, specialities, location, neighborhood, operating_hours, rating, price_range, sales_history, menu, reviews, features, phone, website, description) VALUES

-- ByWard Market Restaurants
('Savana Cafe', 'restaurant', 'Lebanese', ARRAY['shawarma', 'falafel', 'hummus'], '431 Rideau St, Ottawa, ON', 'ByWard Market', 
'{"monday": {"open": "11:00", "close": "23:00"}, "tuesday": {"open": "11:00", "close": "23:00"}, "wednesday": {"open": "11:00", "close": "23:00"}, "thursday": {"open": "11:00", "close": "23:00"}, "friday": {"open": "11:00", "close": "02:00"}, "saturday": {"open": "11:00", "close": "02:00"}, "sunday": {"open": "12:00", "close": "22:00"}}',
4.4, 2, 
'{"2024-01": {"revenue": 52000, "top_items": ["chicken_shawarma", "beef_shawarma", "falafel_plate"]}, "2024-02": {"revenue": 48000, "top_items": ["chicken_shawarma", "mixed_grill", "hummus_plate"]}}',
'{"categories": {"appetizers": [{"name": "Hummus Plate", "price": 8.99, "description": "Fresh hummus with pita bread"}, {"name": "Falafel (6 pcs)", "price": 9.99, "description": "Crispy chickpea fritters"}], "mains": [{"name": "Chicken Shawarma", "price": 14.99, "description": "Tender chicken with garlic sauce"}, {"name": "Beef Shawarma", "price": 15.99, "description": "Seasoned beef with tahini"}, {"name": "Mixed Grill", "price": 24.99, "description": "Combination of grilled meats"}], "drinks": [{"name": "Lebanese Tea", "price": 3.99}, {"name": "Ayran", "price": 3.50}]}}',
'[{"rating": 5, "text": "Best shawarma in Ottawa! Always fresh and delicious.", "date": "2024-02-15", "sentiment": "positive"}, {"rating": 4, "text": "Great food but can get busy during lunch hours.", "date": "2024-02-10", "sentiment": "positive"}, {"rating": 3, "text": "Good flavors but portion sizes have gotten smaller.", "date": "2024-01-28", "sentiment": "mixed"}]',
ARRAY['halal', 'late_night', 'takeout', 'delivery'], '613-241-7676', 'https://savanacafe.ca', 'Authentic Lebanese cuisine in the heart of ByWard Market'),

('Primo Piatto', 'restaurant', 'Italian', ARRAY['pasta', 'pizza', 'risotto'], '350 Sparks St, Ottawa, ON', 'Centretown',
'{"monday": {"open": "17:00", "close": "22:00"}, "tuesday": {"open": "17:00", "close": "22:00"}, "wednesday": {"open": "17:00", "close": "22:00"}, "thursday": {"open": "17:00", "close": "22:00"}, "friday": {"open": "17:00", "close": "23:00"}, "saturday": {"open": "17:00", "close": "23:00"}, "closed_days": ["sunday"]}',
4.6, 3,
'{"2024-01": {"revenue": 78000, "top_items": ["osso_buco_risotto", "lobster_ravioli", "tiramisu"]}, "2024-02": {"revenue": 82000, "top_items": ["seafood_linguine", "osso_buco_risotto", "panna_cotta"]}}',
'{"categories": {"appetizers": [{"name": "Burrata", "price": 18.00, "description": "Fresh burrata with prosciutto"}, {"name": "Calamari Fritti", "price": 16.00, "description": "Crispy squid with marinara"}], "mains": [{"name": "Osso Buco Risotto", "price": 34.00, "description": "Braised veal shank with saffron risotto"}, {"name": "Lobster Ravioli", "price": 28.00, "description": "House-made pasta with lobster filling"}, {"name": "Seafood Linguine", "price": 26.00, "description": "Fresh pasta with mixed seafood"}], "desserts": [{"name": "Tiramisu", "price": 12.00}, {"name": "Panna Cotta", "price": 10.00}]}}',
'[{"rating": 5, "text": "Exceptional Italian fine dining. The osso buco is phenomenal!", "date": "2024-02-20", "sentiment": "positive"}, {"rating": 4, "text": "Beautiful atmosphere and excellent service. A bit pricey but worth it.", "date": "2024-02-18", "sentiment": "positive"}]',
ARRAY['fine_dining', 'wine_list', 'romantic', 'reservations_recommended'], '613-238-2121', 'https://primopiatto.ca', 'Upscale Italian dining with authentic flavors'),

('Beckta Dining & Wine', 'restaurant', 'Canadian', ARRAY['farm_to_table', 'wine_pairing', 'seasonal_menu'], '150 Elgin St, Ottawa, ON', 'Centretown',
'{"tuesday": {"open": "17:30", "close": "22:00"}, "wednesday": {"open": "17:30", "close": "22:00"}, "thursday": {"open": "17:30", "close": "22:00"}, "friday": {"open": "17:30", "close": "22:00"}, "saturday": {"open": "17:30", "close": "22:00"}, "closed_days": ["sunday", "monday"]}',
4.7, 4,
'{"2024-01": {"revenue": 95000, "top_items": ["duck_confit", "beef_tenderloin", "sommelier_selection"]}, "2024-02": {"revenue": 98000, "top_items": ["arctic_char", "lamb_rack", "cheese_course"]}}',
'{"categories": {"appetizers": [{"name": "Oysters (6)", "price": 24.00, "description": "Fresh Atlantic oysters"}, {"name": "Foie Gras", "price": 32.00, "description": "Pan-seared with brioche"}], "mains": [{"name": "Duck Confit", "price": 38.00, "description": "Duck leg with seasonal vegetables"}, {"name": "Beef Tenderloin", "price": 48.00, "description": "AAA Canadian beef with truffle jus"}, {"name": "Arctic Char", "price": 42.00, "description": "Wild char with quinoa risotto"}], "wine": [{"name": "Sommelier Selection", "price": "market", "description": "Curated wine pairings"}]}}',
'[{"rating": 5, "text": "Outstanding fine dining experience. Every dish was perfection.", "date": "2024-02-22", "sentiment": "positive"}, {"rating": 5, "text": "Incredible wine selection and knowledgeable staff.", "date": "2024-02-15", "sentiment": "positive"}]',
ARRAY['fine_dining', 'wine_list', 'romantic', 'special_occasion', 'valet_parking'], '613-238-7063', 'https://beckta.com', 'Award-winning fine dining restaurant'),

-- Cafes
('Bridgehead Coffee', 'cafe', 'Coffee', ARRAY['fair_trade_coffee', 'pastries', 'light_meals'], '150 Elgin St, Ottawa, ON', 'Centretown',
'{"monday": {"open": "07:00", "close": "19:00"}, "tuesday": {"open": "07:00", "close": "19:00"}, "wednesday": {"open": "07:00", "close": "19:00"}, "thursday": {"open": "07:00", "close": "19:00"}, "friday": {"open": "07:00", "close": "19:00"}, "saturday": {"open": "08:00", "close": "18:00"}, "sunday": {"open": "08:00", "close": "18:00"}}',
4.2, 2,
'{"2024-01": {"revenue": 35000, "top_items": ["house_blend", "matcha_latte", "croissant"]}, "2024-02": {"revenue": 38000, "top_items": ["cold_brew", "matcha_latte", "avocado_toast"]}}',
'{"categories": {"coffee": [{"name": "House Blend", "price": 2.75, "description": "Our signature roast"}, {"name": "Matcha Latte", "price": 4.50, "description": "Premium ceremonial matcha"}, {"name": "Cold Brew", "price": 3.25, "description": "Smooth and refreshing"}], "food": [{"name": "Avocado Toast", "price": 8.99, "description": "Multigrain bread with fresh avocado"}, {"name": "Croissant", "price": 3.50, "description": "Buttery French pastry"}, {"name": "Granola Bowl", "price": 7.99, "description": "House-made granola with yogurt"}]}}',
'[{"rating": 4, "text": "Great coffee and the matcha latte is excellent. Good atmosphere for work.", "date": "2024-02-18", "sentiment": "positive"}, {"rating": 3, "text": "Decent coffee but can get quite crowded during peak hours.", "date": "2024-02-12", "sentiment": "mixed"}]',
ARRAY['wifi', 'laptop_friendly', 'fair_trade', 'vegan_options', 'outdoor_seating'], '613-594-9442', 'https://bridgehead.ca', 'Local coffee roaster with ethical sourcing'),

('Happy Goat Coffee', 'cafe', 'Coffee', ARRAY['specialty_coffee', 'fresh_roasted', 'breakfast'], '35 Laurier Ave E, Ottawa, ON', 'Sandy Hill',
'{"monday": {"open": "07:00", "close": "18:00"}, "tuesday": {"open": "07:00", "close": "18:00"}, "wednesday": {"open": "07:00", "close": "18:00"}, "thursday": {"open": "07:00", "close": "18:00"}, "friday": {"open": "07:00", "close": "18:00"}, "saturday": {"open": "08:00", "close": "17:00"}, "sunday": {"open": "08:00", "close": "17:00"}}',
4.5, 2,
'{"2024-01": {"revenue": 28000, "top_items": ["espresso_blend", "breakfast_sandwich", "muffins"]}, "2024-02": {"revenue": 31000, "top_items": ["cortado", "bagel_sandwich", "danish"]}}',
'{"categories": {"coffee": [{"name": "Espresso Blend", "price": 2.50}, {"name": "Cortado", "price": 3.75}, {"name": "Pour Over", "price": 4.25, "description": "Single origin options available"}], "food": [{"name": "Breakfast Sandwich", "price": 6.99, "description": "Egg, cheese, choice of meat"}, {"name": "Bagel Sandwich", "price": 7.50, "description": "Fresh bagel with cream cheese"}, {"name": "Danish", "price": 3.25, "description": "Flaky pastry with fruit filling"}]}}',
'[{"rating": 5, "text": "Best coffee roaster in Ottawa! The pour-over is incredible.", "date": "2024-02-20", "sentiment": "positive"}, {"rating": 4, "text": "Quality coffee and friendly staff. Limited seating though.", "date": "2024-02-14", "sentiment": "positive"}]',
ARRAY['wifi', 'fresh_roasted', 'local', 'takeout', 'bicycle_parking'], '613-231-2233', 'https://happygoat.ca', 'Local coffee roastery with exceptional beans'),

-- Bars
('The Highlander Pub', 'bar', 'Pub Food', ARRAY['craft_beer', 'fish_and_chips', 'live_music'], '187 Rideau St, Ottawa, ON', 'ByWard Market',
'{"monday": {"open": "11:30", "close": "02:00"}, "tuesday": {"open": "11:30", "close": "02:00"}, "wednesday": {"open": "11:30", "close": "02:00"}, "thursday": {"open": "11:30", "close": "02:00"}, "friday": {"open": "11:30", "close": "02:00"}, "saturday": {"open": "11:30", "close": "02:00"}, "sunday": {"open": "11:30", "close": "02:00"}}',
4.1, 2,
'{"2024-01": {"revenue": 65000, "top_items": ["guinness", "fish_and_chips", "chicken_wings"]}, "2024-02": {"revenue": 68000, "top_items": ["local_ipa", "shepherd_pie", "nachos"]}}',
'{"categories": {"beer": [{"name": "Guinness", "price": 7.50}, {"name": "Local IPA", "price": 6.75}, {"name": "Beau''s Lug-Tread", "price": 6.25}], "food": [{"name": "Fish and Chips", "price": 16.99, "description": "Beer-battered cod with fries"}, {"name": "Shepherd''s Pie", "price": 14.99, "description": "Traditional recipe with ground lamb"}, {"name": "Chicken Wings", "price": 12.99, "description": "Choice of sauce, served with vegetables"}]}}',
'[{"rating": 4, "text": "Classic pub atmosphere with good beer selection. Live music on weekends!", "date": "2024-02-17", "sentiment": "positive"}, {"rating": 3, "text": "Food is decent, can get very loud when there''s live music.", "date": "2024-02-10", "sentiment": "mixed"}]',
ARRAY['live_music', 'sports_tv', 'late_night', 'outdoor_patio', 'group_friendly'], '613-233-4262', 'https://thehighlanderpub.com', 'Traditional Scottish pub with live entertainment'),

('Chateau Lafayette', 'bar', 'Cocktails', ARRAY['craft_cocktails', 'whiskey', 'intimate_setting'], '42 York St, Ottawa, ON', 'ByWard Market',
'{"tuesday": {"open": "17:00", "close": "02:00"}, "wednesday": {"open": "17:00", "close": "02:00"}, "thursday": {"open": "17:00", "close": "02:00"}, "friday": {"open": "17:00", "close": "02:00"}, "saturday": {"open": "17:00", "close": "02:00"}, "closed_days": ["sunday", "monday"]}',
4.3, 3,
'{"2024-01": {"revenue": 42000, "top_items": ["old_fashioned", "whiskey_flight", "cheese_board"]}, "2024-02": {"revenue": 45000, "top_items": ["negroni", "manhattan", "charcuterie"]}}',
'{"categories": {"cocktails": [{"name": "Old Fashioned", "price": 14.00, "description": "House bourbon with maple syrup"}, {"name": "Negroni", "price": 13.00, "description": "Classic Italian aperitif"}, {"name": "Manhattan", "price": 15.00, "description": "Rye whiskey with sweet vermouth"}], "small_plates": [{"name": "Cheese Board", "price": 18.00, "description": "Selection of Canadian cheeses"}, {"name": "Charcuterie", "price": 22.00, "description": "Cured meats and accompaniments"}]}}',
'[{"rating": 5, "text": "Incredible cocktails and knowledgeable bartenders. Hidden gem!", "date": "2024-02-19", "sentiment": "positive"}, {"rating": 4, "text": "Great atmosphere for a date night. Cocktails are expertly crafted.", "date": "2024-02-16", "sentiment": "positive"}]',
ARRAY['craft_cocktails', 'romantic', 'intimate', 'late_night', 'whiskey_selection'], '613-241-4747', NULL, 'Intimate cocktail lounge with expertly crafted drinks'),

-- Clubs
('Ritual Nightclub', 'club', 'Dance', ARRAY['electronic_music', 'dj_nights', 'bottle_service'], '137 Besserer St, Ottawa, ON', 'Sandy Hill',
'{"friday": {"open": "22:00", "close": "03:00"}, "saturday": {"open": "22:00", "close": "03:00"}, "closed_days": ["sunday", "monday", "tuesday", "wednesday", "thursday"]}',
3.8, 3,
'{"2024-01": {"revenue": 85000, "top_items": ["bottle_service", "vodka_red_bull", "cover_charge"]}, "2024-02": {"revenue": 92000, "top_items": ["champagne_service", "premium_vodka", "vip_table"]}}',
'{"categories": {"drinks": [{"name": "Vodka Red Bull", "price": 12.00}, {"name": "Premium Vodka Bottle", "price": 350.00}, {"name": "Champagne Service", "price": 400.00}], "services": [{"name": "VIP Table", "price": 500.00, "description": "Reserved table with bottle service"}, {"name": "Cover Charge", "price": 20.00, "description": "Entry fee Friday/Saturday"}]}}',
'[{"rating": 4, "text": "Great music and atmosphere! Gets packed on weekends.", "date": "2024-02-18", "sentiment": "positive"}, {"rating": 2, "text": "Overpriced drinks and aggressive bouncers. Music was good though.", "date": "2024-02-11", "sentiment": "mixed"}]',
ARRAY['electronic_music', 'late_night', 'dance_floor', 'bottle_service', 'dress_code'], '613-562-7488', 'https://ritualnightclub.ca', 'Premier nightclub with electronic music and VIP service'),

('Mercury Lounge', 'club', 'Live Music', ARRAY['live_bands', 'indie_music', 'craft_beer'], '56 ByWard Market Square, Ottawa, ON', 'ByWard Market',
'{"wednesday": {"open": "20:00", "close": "02:00"}, "thursday": {"open": "20:00", "close": "02:00"}, "friday": {"open": "20:00", "close": "02:00"}, "saturday": {"open": "20:00", "close": "02:00"}, "closed_days": ["sunday", "monday", "tuesday"]}',
4.0, 2,
'{"2024-01": {"revenue": 35000, "top_items": ["local_beer", "cover_charge", "band_merchandise"]}, "2024-02": {"revenue": 38000, "top_items": ["craft_cocktails", "live_show_tickets", "local_beer"]}}',
'{"categories": {"drinks": [{"name": "Local Beer", "price": 6.50}, {"name": "Craft Cocktail", "price": 10.00}, {"name": "Shot Special", "price": 5.00}], "entertainment": [{"name": "Live Show Ticket", "price": 15.00, "description": "Entry to live music performances"}, {"name": "Band Merchandise", "price": "varies", "description": "T-shirts, vinyl, CDs"}]}}',
'[{"rating": 4, "text": "Love the live music scene here. Great place to discover new bands.", "date": "2024-02-20", "sentiment": "positive"}, {"rating": 4, "text": "Intimate venue with good sound quality. Drinks are reasonably priced.", "date": "2024-02-15", "sentiment": "positive"}]',
ARRAY['live_music', 'indie_scene', 'intimate_venue', 'late_night', 'all_ages_shows'], '613-789-5324', 'https://mercurylounge.ca', 'Intimate venue featuring local and touring indie bands');

-- Add a few more diverse options
INSERT INTO places (name, place_type, cuisine, specialities, location, neighborhood, operating_hours, rating, price_range, sales_history, menu, reviews, features, phone, website, description) VALUES

('Coconut Lagoon', 'restaurant', 'Indian', ARRAY['curry', 'tandoor', 'vegetarian'], '853 St Laurent Blvd, Ottawa, ON', 'ByWard Market',
'{"monday": {"open": "17:00", "close": "22:00"}, "tuesday": {"open": "17:00", "close": "22:00"}, "wednesday": {"open": "17:00", "close": "22:00"}, "thursday": {"open": "17:00", "close": "22:00"}, "friday": {"open": "17:00", "close": "23:00"}, "saturday": {"open": "17:00", "close": "23:00"}, "sunday": {"open": "17:00", "close": "22:00"}}',
4.3, 2,
'{"2024-01": {"revenue": 45000, "top_items": ["butter_chicken", "lamb_biryani", "garlic_naan"]}, "2024-02": {"revenue": 47000, "top_items": ["tikka_masala", "vegetable_korma", "mango_lassi"]}}',
'{"categories": {"appetizers": [{"name": "Samosas", "price": 6.99}, {"name": "Pakoras", "price": 8.99}], "mains": [{"name": "Butter Chicken", "price": 16.99}, {"name": "Lamb Biryani", "price": 19.99}, {"name": "Vegetable Korma", "price": 14.99}], "breads": [{"name": "Garlic Naan", "price": 4.99}, {"name": "Basmati Rice", "price": 3.99}]}}',
'[{"rating": 4, "text": "Authentic flavors and generous portions. Great vegetarian options!", "date": "2024-02-16", "sentiment": "positive"}]',
ARRAY['vegetarian_friendly', 'spicy_options', 'takeout', 'delivery', 'family_friendly'], '613-789-3399', 'https://coconutlagoon.ca', 'Authentic South Indian cuisine with extensive vegetarian menu'),

('Local Public Eatery', 'restaurant', 'Canadian', ARRAY['burgers', 'craft_beer', 'brunch'], '555 Bank St, Ottawa, ON', 'Centretown',
'{"monday": {"open": "11:00", "close": "23:00"}, "tuesday": {"open": "11:00", "close": "23:00"}, "wednesday": {"open": "11:00", "close": "23:00"}, "thursday": {"open": "11:00", "close": "01:00"}, "friday": {"open": "11:00", "close": "01:00"}, "saturday": {"open": "10:00", "close": "01:00"}, "sunday": {"open": "10:00", "close": "23:00"}}',
4.2, 2,
'{"2024-01": {"revenue": 78000, "top_items": ["local_burger", "beer_flight", "eggs_benedict"]}, "2024-02": {"revenue": 82000, "top_items": ["poutine", "fish_tacos", "caesar"]}}',
'{"categories": {"mains": [{"name": "Local Burger", "price": 16.99, "description": "House-ground beef with local toppings"}, {"name": "Fish Tacos", "price": 15.99}, {"name": "Poutine", "price": 12.99, "description": "Quebec-style with cheese curds"}], "brunch": [{"name": "Eggs Benedict", "price": 14.99}, {"name": "Pancakes", "price": 11.99}], "drinks": [{"name": "Beer Flight", "price": 12.00, "description": "4 local craft beers"}, {"name": "Caesar", "price": 8.99, "description": "Canadian classic cocktail"}]}}',
'[{"rating": 4, "text": "Great casual spot with excellent brunch. The local burger is a must-try!", "date": "2024-02-14", "sentiment": "positive"}]',
ARRAY['brunch', 'craft_beer', 'casual_dining', 'patio', 'local_ingredients'], '613-231-1010', 'https://localpublic.ca', 'Casual eatery featuring local ingredients and craft beer');
