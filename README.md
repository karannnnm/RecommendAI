# Tasty Treasures 🍽️

A modern, AI-powered restaurant recommendation platform that helps users discover perfect dining experiences tailored to their taste preferences.

## Features ✨

- **Smart Restaurant Search**: Natural language queries to find restaurants based on cuisine, location, mood, or specific preferences
- **AI-Powered Recommendations**: Integration with n8n workflows for intelligent restaurant suggestions
- **Beautiful Modern UI**: Clean, responsive design with gradient themes and smooth animations
- **Database Integration**: Supabase backend for reliable restaurant data storage
- **Advanced Filtering**: Search by cuisine type, specialties, location, ratings, and more
- **Real-time Results**: Instant search with elegant loading states and toast notifications
- **Data Upload** (Coming Soon): Excel file upload for sales data analysis

## Tech Stack 🛠️

- **Frontend**: React 18 + TypeScript + Vite
- **UI Components**: shadcn/ui + Tailwind CSS
- **Database**: Supabase (PostgreSQL)
- **AI Integration**: n8n workflows for intelligent recommendations
- **Icons**: Lucide React
- **Styling**: Custom gradient themes with backdrop blur effects
- **State Management**: React hooks with toast notifications

## Setup & Installation 🚀

### Prerequisites

- Node.js 16+ and npm (recommended to install with [nvm](https://github.com/nvm-sh/nvm#installing-and-updating))
- A Supabase account and project
- (Optional) n8n instance for AI-powered recommendations

### Development Setup

1. **Clone the repository**
   ```sh
   git clone <YOUR_GIT_URL>
   cd tasty-treasures
   ```

2. **Install dependencies**
   ```sh
   npm install
   ```

3. **Configure environment variables**
   Create a `.env.local` file in the root directory:
   ```env
   VITE_SUPABASE_URL=your_supabase_project_url
   VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
   VITE_N8N_WEBHOOK_URL=your_n8n_webhook_url_optional
   ```

4. **Start the development server**
   ```sh
   npm run dev
   ```

   Open [http://localhost:5173](http://localhost:5173) to view the app in your browser.

## Database Schema 📊

The app expects a `restaurants` table in Supabase with the following structure:

```sql
CREATE TABLE restaurants (
  id SERIAL PRIMARY KEY,
  restaurantName TEXT NOT NULL,
  cuisine TEXT,
  speciality TEXT,
  location TEXT,
  timings TEXT,
  sampleReview TEXT,
  rating DECIMAL(2,1)
);
```

## Usage 💡

1. **Search Restaurants**: Enter natural language queries like:
   - "Best Italian restaurants in downtown"
   - "Romantic dinner spots with good wine"
   - "Family-friendly places with outdoor seating"

2. **AI Recommendations**: If n8n is configured, the app will use AI to provide personalized suggestions based on your query

3. **Browse Results**: View detailed restaurant cards with:
   - Restaurant name and cuisine type
   - Specialties and location
   - Operating hours and ratings
   - Sample customer reviews

## AI Integration 🤖

The app supports AI-powered recommendations through n8n workflows:

- Configure `VITE_N8N_WEBHOOK_URL` to enable AI features
- The system sends user queries to your n8n workflow
- Falls back to database search if AI service is unavailable
- Supports flexible response formats for different AI providers

## Deployment 🌐

### Quick Deploy with Lovable
1. Open your [Lovable Project](https://lovable.dev)
2. Click Share → Publish
3. Configure your custom domain if needed

### Manual Deployment
The app can be deployed to any static hosting service:

```sh
npm run build
```

Deploy the `dist` folder to your hosting provider.

## Contributing 🤝

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Environment Variables 📝

| Variable | Description | Required |
|----------|-------------|----------|
| `VITE_SUPABASE_URL` | Your Supabase project URL | Yes |
| `VITE_SUPABASE_ANON_KEY` | Your Supabase anonymous key | Yes |
| `VITE_N8N_WEBHOOK_URL` | n8n webhook URL for AI features | No |

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Built with ❤️ for food lovers everywhere
