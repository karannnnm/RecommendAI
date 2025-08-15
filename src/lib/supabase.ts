import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseKey = import.meta.env.VITE_SUPABASE_ANON_KEY

export const supabase = createClient(supabaseUrl, supabaseKey)

// Operating hours structure
export type OperatingHours = {
  monday?: { open: string; close: string };
  tuesday?: { open: string; close: string };
  wednesday?: { open: string; close: string };
  thursday?: { open: string; close: string };
  friday?: { open: string; close: string };
  saturday?: { open: string; close: string };
  sunday?: { open: string; close: string };
  closed_days?: string[];
};

// Menu item structure
export type MenuItem = {
  name: string;
  price: number | string;
  description?: string;
};

// Menu structure
export type Menu = {
  categories: {
    [category: string]: MenuItem[];
  };
};

// Review structure
export type Review = {
  rating: number;
  text: string;
  date: string;
  sentiment: 'positive' | 'negative' | 'mixed';
};

// Sales history structure
export type SalesHistory = {
  [month: string]: {
    revenue: number;
    top_items: string[];
  };
};

// Main Place type (replacing Restaurant)
export type Place = {
  id: string;
  name: string;
  place_type: 'restaurant' | 'bar' | 'cafe' | 'club';
  cuisine?: string;
  specialities?: string[];
  location: string;
  neighborhood?: string;
  operating_hours?: OperatingHours;
  rating?: number;
  price_range?: 1 | 2 | 3 | 4;
  sales_history?: SalesHistory;
  menu?: Menu;
  reviews?: Review[];
  features?: string[];
  phone?: string;
  website?: string;
  description?: string;
  created_at?: string;
  updated_at?: string;
};

// For backward compatibility and easy migration
export type Restaurant = Place;