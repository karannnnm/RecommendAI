import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseKey = import.meta.env.VITE_SUPABASE_ANON_KEY

export const supabase = createClient(supabaseUrl, supabaseKey)

export type Restaurant = {
  id: string
  restaurantName: string
  cuisine: string
  sampleReview: string
  speciality: string
  location: string
  timings: string
  rating?: number  // Optional rating field for AI recommendations
  created_at?: string
}