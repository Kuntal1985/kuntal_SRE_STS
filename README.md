# 🏠 NestFinder — Real Estate Apartment Listings

A full-stack apartment listing website built with **Node.js + Express**, **MySQL**, and **plain HTML/CSS/JS**. Runs entirely on your local machine at `http://localhost:3000`.

---

## Project Structure

```
realestate/
├── config/
│   └── db.js              # MySQL connection pool
├── routes/
│   └── apartments.js      # REST API route handlers
├── public/
│   ├── index.html         # Frontend UI
│   ├── css/style.css      # Styles
│   └── js/app.js          # Frontend JavaScript
├── database.sql           # DB schema + 13 sample listings
├── server.js              # Express app entry point
├── package.json
├── .env.example           # Environment variable template
└── README.md
```

---

## Prerequisites

- **Node.js** v18+ → https://nodejs.org
- **MySQL** v8.0+ (Community Edition) → https://dev.mysql.com/downloads/mysql/

---

## Step 1 — Install & Start MySQL

### macOS (Homebrew)
```bash
brew install mysql
brew services start mysql
mysql_secure_installation   # set a root password
```

### Ubuntu / Debian
```bash
sudo apt update
sudo apt install mysql-server
sudo systemctl start mysql
sudo mysql_secure_installation
```

### Windows
1. Download the MySQL Installer from https://dev.mysql.com/downloads/installer/
2. Run the installer, choose "Server Only"
3. Set a root password during setup
4. MySQL will auto-start as a Windows service

---

## Step 2 — Create the Database

Open a terminal and connect to MySQL:

```bash
mysql -u root -p
```

Then run the provided SQL script:

```bash
mysql -u root -p < database.sql
```

This creates:
- Database: `realestate_db`
- Table: `apartments` with all required columns
- 13 sample listings across 1BHK–4BHK in Bengaluru, Hyderabad, and Mumbai

To verify:
```sql
USE realestate_db;
SELECT id, title, bhk, city FROM apartments;
```

---

## Step 3 — Configure Environment Variables

Copy the example env file:

```bash
cp .env.example .env
```

Edit `.env` with your MySQL credentials:

```
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=your_actual_password_here
DB_NAME=realestate_db
PORT=3000
```

> **Important**: Never commit `.env` to git. It's already in `.gitignore`.

---

## Step 4 — Install Node Dependencies

```bash
npm install
```

---

## Step 5 — Start the Server

```bash
npm start
```

For development with auto-restart on file changes:

```bash
npm run dev
```

You should see:
```
✅  MySQL connected successfully
🏠  Real Estate App running at http://localhost:3000
```

---

## Step 6 — Open in Browser

Navigate to: **http://localhost:3000**

---

## API Reference

Base URL: `http://localhost:3000/api`

| Method | Endpoint               | Description                        |
|--------|------------------------|------------------------------------|
| GET    | /apartments            | List all apartments (with filters) |
| GET    | /apartments/meta       | Get price range + available cities |
| GET    | /apartments/:id        | Get single apartment details       |
| POST   | /apartments            | Create a new listing               |
| PUT    | /apartments/:id        | Update an existing listing         |
| DELETE | /apartments/:id        | Delete a listing                   |

### Query Parameters for GET /apartments

| Param            | Example             | Description                     |
|------------------|---------------------|---------------------------------|
| search           | ?search=koramangala | Search title, locality, city    |
| bhk              | ?bhk=2,3            | Filter by BHK (comma-separated) |
| city             | ?city=Bengaluru     | Filter by exact city name       |
| min_price        | ?min_price=20000    | Minimum monthly rent            |
| max_price        | ?max_price=60000    | Maximum monthly rent            |
| furnished_status | ?furnished_status=furnished | Filter by furnishing  |
| sort             | ?sort=price_asc     | price_asc or price_desc         |

### Example: Add a listing (POST)

```bash
curl -X POST http://localhost:3000/api/apartments \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Cozy 2BHK in Whitefield",
    "bhk": 2,
    "rent_price": 28000,
    "locality": "Whitefield",
    "city": "Bengaluru",
    "area_sqft": 1000,
    "furnished_status": "semi-furnished",
    "available_from": "2025-06-01",
    "contact_name": "Suresh Kumar",
    "contact_phone": "9845098450"
  }'
```

---

## Features

- **Grid listing** of all apartments with BHK badge, price, area, locality, furnished status
- **Filter by BHK** — 1BHK, 2BHK, 3BHK, 4BHK+
- **Price range slider** — dual-handle range for monthly rent
- **Search** — by locality, city, or title (debounced)
- **City filter** — dropdown populated from live DB data
- **Sort** — by price ascending or descending
- **Furnished status filter** — furnished / semi-furnished / unfurnished
- **Detail modal** — full apartment info, description, contact
- **Add listing form** — validated form to add new listings live
- **Toast notifications** — success/error feedback

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| `ECONNREFUSED` on port 3306 | MySQL isn't running. Start it: `brew services start mysql` or `sudo systemctl start mysql` |
| `Access denied for user 'root'` | Wrong password in `.env`. Reset MySQL root password. |
| `Unknown database 'realestate_db'` | Run `mysql -u root -p < database.sql` first |
| Port 3000 already in use | Change `PORT=3001` in `.env` |
| `nodemon: command not found` | Run `npm install` first, or use `npm start` instead |
