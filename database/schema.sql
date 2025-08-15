-- Tasty Treasures Database Schema
-- Updated schema for places (restaurants, bars, cafes, clubs) in Downtown Ottawa

-- Drop existing table if it exists
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS places;

-- Create the main places table
CREATE TABLE places (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  place_type TEXT NOT NULL CHECK (place_type IN ('restaurant', 'bar', 'cafe', 'club')),
  cuisine TEXT, -- e.g., 'Italian', 'Japanese', 'Lebanese', 'Canadian'
  specialities TEXT[], -- Array: ['shawarma', 'pasta', 'craft_beer', 'live_music']
  location TEXT NOT NULL, -- Full address
  neighborhood TEXT, -- 'ByWard Market', 'Centretown', 'Glebe', etc.
  
  -- Structured operating hours
  operating_hours JSONB DEFAULT '{}', 
  -- Format: {"monday": {"open": "09:00", "close": "22:00"}, "tuesday": {...}, "closed_days": ["sunday"]}
  
  rating DECIMAL(3,2) CHECK (rating >= 0 AND rating <= 5), -- 0.00 to 5.00
  price_range INTEGER CHECK (price_range BETWEEN 1 AND 4), -- 1=budget, 4=expensive
  
  -- Sales history for AI predictions
  sales_history JSONB DEFAULT '{}',
  -- Format: {"2024-01": {"revenue": 45000, "top_items": [...]}, "2024-02": {...}}
  
  -- Menu structure
  menu JSONB DEFAULT '{}',
  -- Format: {"categories": {"appetizers": [...], "mains": [...], "drinks": [...]}}
  
  -- Reviews for sentiment analysis
  reviews JSONB DEFAULT '[]',
  -- Format: [{"rating": 4, "text": "Great food!", "date": "2024-01-15", "sentiment": "positive"}]
  
  -- Additional features/amenities
  features TEXT[], -- ['outdoor_seating', 'wifi', 'live_music', 'vegan_options', 'late_night']
  
  -- Contact and additional info
  phone TEXT,
  website TEXT,
  description TEXT,
  
  -- Timestamps
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Create indexes for better query performance
CREATE INDEX idx_places_type ON places(place_type);
CREATE INDEX idx_places_neighborhood ON places(neighborhood);
CREATE INDEX idx_places_rating ON places(rating);
CREATE INDEX idx_places_price_range ON places(price_range);
CREATE INDEX idx_places_features ON places USING GIN(features);
CREATE INDEX idx_places_specialities ON places USING GIN(specialities);
CREATE INDEX idx_places_menu ON places USING GIN(menu);

-- Create a function to update the updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create trigger to automatically update updated_at
CREATE TRIGGER update_places_updated_at 
    BEFORE UPDATE ON places 
    FOR EACH ROW 
    EXECUTE FUNCTION update_updated_at_column();

-- Create a view for currently open places (example of helping n8n with simpler queries)
CREATE OR REPLACE VIEW currently_open_places AS
SELECT p.*, 
       CASE 
         WHEN operating_hours ? LOWER(TO_CHAR(NOW(), 'day'))
         THEN true 
         ELSE false 
       END as is_open
FROM places p;

-- Sample query helpers (comments for n8n prompt reference)
-- Find places by type: SELECT * FROM places WHERE place_type = 'restaurant';
-- Find by cuisine: SELECT * FROM places WHERE cuisine ILIKE '%italian%';
-- Find with features: SELECT * FROM places WHERE features @> ARRAY['wifi'];
-- Find by menu item: SELECT * FROM places WHERE menu @> '{"items": [{"name": "shawarma"}]}';
-- Find by neighborhood: SELECT * FROM places WHERE neighborhood = 'ByWard Market';
-- Find by rating range: SELECT * FROM places WHERE rating >= 4.0;
-- Find by price range: SELECT * FROM places WHERE price_range <= 2;
