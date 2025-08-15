import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Card, CardContent } from "@/components/ui/card";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Search, Utensils, Clock, Star, MapPin, Wine, Coffee, Music } from "lucide-react";
import { useToast } from "@/hooks/use-toast";
import { supabase, type Place } from "@/lib/supabase";
import { getFormattedHours, getPriceRangeText } from "@/lib/place-utils";

const PlaceRecommendation = () => {
  const [query, setQuery] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [recommendations, setRecommendations] = useState<Place[]>([]);
  const { toast } = useToast();

  const handleSearch = async () => {
    if (!query.trim()) {
      toast({
        title: "Please enter a query",
        description: "Tell us what kind of place you're looking for!",
        variant: "destructive",
      });
      return;
    }

    setIsLoading(true);
    try {
      // Search across all place types with comprehensive filtering
      const { data: places, error } = await supabase
        .from('places')
        .select('*')
        .or(
          `name.ilike.%${query}%,` +
          `cuisine.ilike.%${query}%,` +
          `description.ilike.%${query}%,` +
          `location.ilike.%${query}%,` +
          `neighborhood.ilike.%${query}%,` +
          `place_type.ilike.%${query}%,` +
          `specialities.cs.{${query}},` +
          `features.cs.{${query}}`
        );

      if (error) {
        throw error;
      }

      // Additional filtering for menu items if query doesn't match basic fields
      let menuFilteredPlaces: Place[] = [];
      if (places && places.length === 0) {
        const { data: menuPlaces, error: menuError } = await supabase
          .from('places')
          .select('*')
          .not('menu', 'is', null);

        if (!menuError && menuPlaces) {
          menuFilteredPlaces = menuPlaces.filter(place => {
            if (!place.menu || typeof place.menu !== 'object') return false;
            
            const menuText = JSON.stringify(place.menu).toLowerCase();
            return menuText.includes(query.toLowerCase());
          });
        }
      }

      const allResults = [...(places || []), ...menuFilteredPlaces];
      const uniqueResults = allResults.filter((place, index, self) => 
        index === self.findIndex(p => p.id === place.id)
      );

      setRecommendations(uniqueResults);
      
      toast({
        title: uniqueResults.length > 0 ? "Places Found!" : "No Results",
        description: uniqueResults.length > 0 
          ? `Found ${uniqueResults.length} places matching your query.`
          : "No places found matching your criteria. Try a different search.",
        variant: uniqueResults.length > 0 ? "default" : "destructive"
      });
      
    } catch (error) {
      console.error("Error fetching recommendations:", error);
      toast({
        title: "Error",
        description: "Failed to get recommendations. Please try again.",
        variant: "destructive",
      });
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-gradient-secondary">
      <div className="container mx-auto px-4 py-8">
        <div className="text-center mb-8">
          <h1 className="text-4xl font-bold bg-gradient-primary bg-clip-text text-transparent mb-4">
            Ottawa Places Finder
          </h1>
          <p className="text-lg text-muted-foreground">
            Discover restaurants, bars, cafés, and clubs in Downtown Ottawa
          </p>
        </div>

        <Tabs defaultValue="search" className="max-w-4xl mx-auto">
          <TabsList className="grid w-full grid-cols-2 mb-8">
            <TabsTrigger value="search">Info & Search</TabsTrigger>
            <TabsTrigger value="upload">Data Upload</TabsTrigger>
          </TabsList>

          <TabsContent value="search" className="space-y-8">
            {/* Fancy Input Section */}
            <Card className="shadow-elegant border-0 bg-white/80 backdrop-blur-sm">
              <CardContent className="p-8">
                <div className="flex flex-col space-y-4">
                  <div className="relative">
                    <Search className="absolute left-4 top-1/2 transform -translate-y-1/2 text-muted-foreground h-5 w-5" />
                    <Input
                      placeholder="Search places... e.g., 'shawarma', 'late night bars', 'matcha latte', 'live music'"
                      value={query}
                      onChange={(e) => setQuery(e.target.value)}
                      className="pl-12 h-14 text-lg border-2 border-primary/20 focus:border-primary transition-all duration-300"
                      onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
                    />
                  </div>
                  <Button 
                    onClick={handleSearch}
                    disabled={isLoading}
                    className="h-12 bg-gradient-primary hover:shadow-glow transition-all duration-300"
                  >
                    {isLoading ? "Searching..." : "Find Places"}
                  </Button>
                </div>
              </CardContent>
            </Card>

            {/* Results Section */}
            {recommendations.length > 0 && (
              <div className="space-y-6">
                <h2 className="text-2xl font-semibold text-center">
                  Found Places ({recommendations.length})
                </h2>
                
                <div className="grid gap-6 md:grid-cols-2">
                  {recommendations.map((place) => {
                    const getPlaceIcon = (placeType: string) => {
                      switch (placeType) {
                        case 'bar': return <Wine className="h-6 w-6 text-primary" />;
                        case 'cafe': return <Coffee className="h-6 w-6 text-primary" />;
                        case 'club': return <Music className="h-6 w-6 text-primary" />;
                        default: return <Utensils className="h-6 w-6 text-primary" />;
                      }
                    };

                    const getFirstReview = () => {
                      if (place.reviews && Array.isArray(place.reviews) && place.reviews.length > 0) {
                        return place.reviews[0].text;
                      }
                      return place.description || "Great place with excellent service.";
                    };

                    return (
                      <Card key={place.id} className="shadow-elegant hover:shadow-glow transition-all duration-300 border-0 bg-white/90 backdrop-blur-sm">
                        <CardContent className="p-6 space-y-4">
                          <div className="flex items-center space-x-2">
                            {getPlaceIcon(place.place_type)}
                            <h3 className="text-xl font-semibold">{place.name}</h3>
                            <span className="text-xs px-2 py-1 bg-primary/10 text-primary rounded-full capitalize">
                              {place.place_type}
                            </span>
                            {place.rating && (
                              <div className="flex items-center space-x-1 ml-auto">
                                <Star className="h-4 w-4 text-yellow-500 fill-current" />
                                <span className="text-sm font-medium">{place.rating}</span>
                              </div>
                            )}
                          </div>
                          
                          <div className="space-y-2">
                            {place.cuisine && (
                              <p className="text-sm text-muted-foreground">
                                <span className="font-medium">Cuisine:</span> {place.cuisine}
                              </p>
                            )}
                            {place.specialities && place.specialities.length > 0 && (
                              <p className="text-sm text-muted-foreground">
                                <span className="font-medium">Specialities:</span> {place.specialities.join(', ')}
                              </p>
                            )}
                            <div className="flex items-center space-x-1 text-sm text-muted-foreground">
                              <MapPin className="h-4 w-4" />
                              <span>{place.location}</span>
                              {place.neighborhood && <span>• {place.neighborhood}</span>}
                            </div>
                            {place.price_range && (
                              <p className="text-sm text-muted-foreground">
                                <span className="font-medium">Price:</span> {getPriceRangeText(place.price_range)}
                              </p>
                            )}
                            {place.operating_hours && (
                              <div className="flex items-center space-x-1 text-sm text-muted-foreground">
                                <Clock className="h-4 w-4" />
                                <span className="truncate">{getFormattedHours(place)}</span>
                              </div>
                            )}
                            {place.features && place.features.length > 0 && (
                              <div className="flex flex-wrap gap-1 mt-2">
                                {place.features.slice(0, 4).map((feature, index) => (
                                  <span key={index} className="text-xs px-2 py-1 bg-secondary/10 text-secondary rounded">
                                    {feature.replace('_', ' ')}
                                  </span>
                                ))}
                                {place.features.length > 4 && (
                                  <span className="text-xs px-2 py-1 bg-secondary/10 text-secondary rounded">
                                    +{place.features.length - 4} more
                                  </span>
                                )}
                              </div>
                            )}
                          </div>
                          
                          <div className="pt-4 border-t">
                            <div className="flex items-center space-x-1 mb-2">
                              <Star className="h-4 w-4 text-yellow-500 fill-current" />
                              <span className="text-sm font-medium">
                                {place.reviews && place.reviews.length > 0 ? 'Customer Review' : 'About'}
                              </span>
                            </div>
                            <p className="text-sm italic text-muted-foreground line-clamp-3">
                              "{getFirstReview()}"
                            </p>
                          </div>
                        </CardContent>
                      </Card>
                    );
                  })}
                </div>
              </div>
            )}
          </TabsContent>

          <TabsContent value="upload" className="space-y-6">
            <Card className="shadow-elegant border-0 bg-white/80 backdrop-blur-sm">
              <CardContent className="p-8 text-center">
                <h3 className="text-xl font-semibold mb-4">Upload Sales Data</h3>
                <p className="text-muted-foreground mb-6">
                  Upload Excel files containing sales data to enhance restaurant recommendations
                </p>
                <Button variant="outline" className="border-primary text-primary hover:bg-primary hover:text-primary-foreground">
                  Coming Soon - Excel Upload
                </Button>
              </CardContent>
            </Card>
          </TabsContent>
        </Tabs>
      </div>
    </div>
  );
};

export default PlaceRecommendation;