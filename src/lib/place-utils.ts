import { Place, OperatingHours } from './supabase';

/**
 * Utility functions for working with Place data
 */

/**
 * Check if a place is currently open
 */
export function isPlaceOpen(place: Place, currentTime?: Date): boolean {
  if (!place.operating_hours) return false;
  
  const now = currentTime || new Date();
  const dayName = now.toLocaleLowerCase().substring(0, 3) as keyof OperatingHours;
  const currentTimeStr = now.toTimeString().substring(0, 5); // HH:MM format
  
  // Check if place is closed today
  if (place.operating_hours.closed_days?.includes(dayName)) {
    return false;
  }
  
  const todayHours = place.operating_hours[dayName];
  if (!todayHours) return false;
  
  return currentTimeStr >= todayHours.open && currentTimeStr <= todayHours.close;
}

/**
 * Get formatted operating hours for display
 */
export function getFormattedHours(place: Place): string {
  if (!place.operating_hours) return 'Hours not available';
  
  const days = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'];
  const hours: string[] = [];
  
  for (const day of days) {
    const dayHours = place.operating_hours[day as keyof OperatingHours];
    if (dayHours) {
      hours.push(`${day.charAt(0).toUpperCase() + day.slice(1)}: ${dayHours.open} - ${dayHours.close}`);
    } else if (place.operating_hours.closed_days?.includes(day)) {
      hours.push(`${day.charAt(0).toUpperCase() + day.slice(1)}: Closed`);
    }
  }
  
  return hours.join(', ');
}

/**
 * Search menu for specific items
 */
export function searchMenu(place: Place, searchTerm: string): boolean {
  if (!place.menu) return false;
  
  const searchLower = searchTerm.toLowerCase();
  
  for (const category of Object.values(place.menu.categories)) {
    for (const item of category) {
      if (item.name.toLowerCase().includes(searchLower) || 
          item.description?.toLowerCase().includes(searchLower)) {
        return true;
      }
    }
  }
  
  return false;
}

/**
 * Get average rating from reviews
 */
export function getAverageRating(place: Place): number | null {
  if (!place.reviews || place.reviews.length === 0) return place.rating || null;
  
  const sum = place.reviews.reduce((acc, review) => acc + review.rating, 0);
  return sum / place.reviews.length;
}

/**
 * Get latest sales data
 */
export function getLatestSalesData(place: Place): { month: string; revenue: number; top_items: string[] } | null {
  if (!place.sales_history) return null;
  
  const months = Object.keys(place.sales_history).sort();
  const latestMonth = months[months.length - 1];
  
  return {
    month: latestMonth,
    ...place.sales_history[latestMonth]
  };
}

/**
 * Check if place has specific features
 */
export function hasFeature(place: Place, feature: string): boolean {
  return place.features?.includes(feature) || false;
}

/**
 * Get price range text
 */
export function getPriceRangeText(priceRange?: number): string {
  switch (priceRange) {
    case 1: return '$';
    case 2: return '$$';
    case 3: return '$$$';
    case 4: return '$$$$';
    default: return 'Price not available';
  }
}

/**
 * Filter places that are open at a specific time
 */
export function getOpenPlaces(places: Place[], time?: Date): Place[] {
  return places.filter(place => isPlaceOpen(place, time));
}

/**
 * Get places by type
 */
export function getPlacesByType(places: Place[], type: Place['place_type']): Place[] {
  return places.filter(place => place.place_type === type);
}

/**
 * Get review sentiment summary
 */
export function getReviewSentiment(place: Place): { positive: number; negative: number; mixed: number } {
  if (!place.reviews) return { positive: 0, negative: 0, mixed: 0 };
  
  return place.reviews.reduce((acc, review) => {
    acc[review.sentiment]++;
    return acc;
  }, { positive: 0, negative: 0, mixed: 0 });
}
