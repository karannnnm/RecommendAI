import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Card, CardContent } from "@/components/ui/card";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Search, Utensils, Clock, Star } from "lucide-react";
import { useToast } from "@/hooks/use-toast";

interface Restaurant {
  id: string;
  restaurantName: string;
  cuisine: string;
  sampleReview: string;
  speciality: string;
  timings: string;
}

const RestaurantRecommendation = () => {
  const [query, setQuery] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [recommendations, setRecommendations] = useState<Restaurant[]>([]);
  const { toast } = useToast();

  const handleSearch = async () => {
    if (!query.trim()) {
      toast({
        title: "Please enter a query",
        description: "Tell us what kind of restaurant you're looking for!",
        variant: "destructive",
      });
      return;
    }

    setIsLoading(true);
    try {
      // This will be connected to n8n webhook
      console.log("Sending query to n8n:", query);
      
      // Placeholder for n8n integration
      // const response = await fetch('/api/n8n-webhook', {
      //   method: 'POST',
      //   headers: { 'Content-Type': 'application/json' },
      //   body: JSON.stringify({ query })
      // });
      
      // Mock data for now
      setTimeout(() => {
        setRecommendations([
          {
            id: "1",
            restaurantName: "Spice Garden",
            cuisine: "Indian",
            sampleReview: "Amazing authentic flavors and great service!",
            speciality: "Butter Chicken & Biryani",
            timings: "11:00 AM - 10:00 PM"
          },
          {
            id: "2", 
            restaurantName: "Pasta Palace",
            cuisine: "Italian",
            sampleReview: "Fresh pasta made daily, incredible taste!",
            speciality: "Handmade Pasta & Wood-fired Pizza",
            timings: "12:00 PM - 11:00 PM"
          }
        ]);
        setIsLoading(false);
        
        toast({
          title: "Recommendations found!",
          description: `Found ${2} restaurants matching your query.`,
        });
      }, 1500);
      
    } catch (error) {
      console.error("Error fetching recommendations:", error);
      toast({
        title: "Error",
        description: "Failed to get recommendations. Please try again.",
        variant: "destructive",
      });
      setIsLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-gradient-secondary">
      <div className="container mx-auto px-4 py-8">
        <div className="text-center mb-8">
          <h1 className="text-4xl font-bold bg-gradient-primary bg-clip-text text-transparent mb-4">
            Restaurant Finder
          </h1>
          <p className="text-lg text-muted-foreground">
            Discover perfect dining experiences tailored to your taste
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
                      placeholder="Ask about restaurants... e.g., 'Which restaurant has the best Italian food?'"
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
                    {isLoading ? "Searching..." : "Find Restaurants"}
                  </Button>
                </div>
              </CardContent>
            </Card>

            {/* Results Section */}
            {recommendations.length > 0 && (
              <div className="space-y-6">
                <h2 className="text-2xl font-semibold text-center">
                  Recommended Restaurants
                </h2>
                <div className="grid gap-6 md:grid-cols-2">
                  {recommendations.map((restaurant) => (
                    <Card key={restaurant.id} className="shadow-elegant hover:shadow-glow transition-all duration-300 border-0 bg-white/90 backdrop-blur-sm">
                      <CardContent className="p-6 space-y-4">
                        <div className="flex items-center space-x-2">
                          <Utensils className="h-6 w-6 text-primary" />
                          <h3 className="text-xl font-semibold">{restaurant.restaurantName}</h3>
                        </div>
                        
                        <div className="space-y-2">
                          <p className="text-sm text-muted-foreground">
                            <span className="font-medium">Cuisine:</span> {restaurant.cuisine}
                          </p>
                          <p className="text-sm text-muted-foreground">
                            <span className="font-medium">Speciality:</span> {restaurant.speciality}
                          </p>
                          <div className="flex items-center space-x-1 text-sm text-muted-foreground">
                            <Clock className="h-4 w-4" />
                            <span>{restaurant.timings}</span>
                          </div>
                        </div>
                        
                        <div className="pt-4 border-t">
                          <div className="flex items-center space-x-1 mb-2">
                            <Star className="h-4 w-4 text-yellow-500 fill-current" />
                            <span className="text-sm font-medium">Customer Review</span>
                          </div>
                          <p className="text-sm italic text-muted-foreground">
                            "{restaurant.sampleReview}"
                          </p>
                        </div>
                      </CardContent>
                    </Card>
                  ))}
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

export default RestaurantRecommendation;