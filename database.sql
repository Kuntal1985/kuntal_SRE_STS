-- ============================================================
-- Real Estate DB Setup
-- Run: mysql -u root -p < database.sql
-- ============================================================

CREATE DATABASE IF NOT EXISTS realestate_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE realestate_db;

DROP TABLE IF EXISTS apartments;

CREATE TABLE apartments (
  id               INT AUTO_INCREMENT PRIMARY KEY,
  title            VARCHAR(255)        NOT NULL,
  bhk              INT                 NOT NULL,
  rent_price       DECIMAL(12, 2)      NOT NULL,
  sale_price       DECIMAL(14, 2)      DEFAULT NULL,
  locality         VARCHAR(150)        NOT NULL,
  city             VARCHAR(100)        NOT NULL,
  area_sqft        INT                 NOT NULL,
  floor_number     INT                 NOT NULL DEFAULT 0,
  total_floors     INT                 NOT NULL DEFAULT 1,
  furnished_status ENUM('furnished','semi-furnished','unfurnished') NOT NULL DEFAULT 'unfurnished',
  available_from   DATE                NOT NULL,
  description      TEXT,
  contact_name     VARCHAR(150)        NOT NULL,
  contact_phone    VARCHAR(20)         NOT NULL,
  created_at       TIMESTAMP           DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- Sample listings: 1BHK, 2BHK, 3BHK, 4BHK across cities
-- ============================================================

INSERT INTO apartments
  (title, bhk, rent_price, sale_price, locality, city, area_sqft, floor_number, total_floors, furnished_status, available_from, description, contact_name, contact_phone)
VALUES
  ('Cozy Studio Nest in Indiranagar',        1, 18000,  4500000,  'Indiranagar',    'Bengaluru', 480,  2,  5,  'furnished',      '2025-05-01', 'A compact, tastefully furnished 1BHK near 100 Feet Road. Walking distance to cafes, metro, and supermarkets. 24/7 security and power backup included.', 'Ramesh Nair',     '9845001111'),
  ('Affordable 1BHK in HSR Layout',          1, 14500,  3800000,  'HSR Layout',     'Bengaluru', 520,  1,  4,  'semi-furnished', '2025-05-15', 'Budget-friendly 1BHK with modular kitchen and good ventilation. Close to Outer Ring Road and IT parks. Ideal for working professionals.', 'Priya Menon',     '9845002222'),
  ('Modern 1BHK near Hitech City',           1, 16000,  4200000,  'Hitech City',    'Hyderabad', 510,  3,  7,  'furnished',      '2025-04-20', 'Newly built 1BHK apartment in a gated society. Gym and swimming pool access. 5 min walk to Hitech City metro station.', 'Anil Kumar',      '9876003333'),
  ('Spacious 2BHK in Koramangala',           2, 32000,  9500000,  'Koramangala',    'Bengaluru', 950,  4,  10, 'furnished',      '2025-05-01', 'Premium 2BHK with hardwood floors, modular kitchen, and a beautiful balcony view. Gated community with clubhouse, gym, and kids play area. Near major tech parks.', 'Deepa Sharma',    '9845004444'),
  ('2BHK Apartment in Banjara Hills',        2, 28000,  8800000,  'Banjara Hills',  'Hyderabad', 1050, 2,  6,  'semi-furnished', '2025-06-01', 'Well-maintained 2BHK in a prime locality. Large rooms with attached bathrooms. Close to malls, hospitals, and schools. Society maintenance included in rent.', 'Suresh Reddy',    '9876005555'),
  ('2BHK Sea-View Flat in Bandra',           2, 55000,  18500000, 'Bandra West',    'Mumbai',    890,  8,  14, 'furnished',      '2025-05-10', 'Stunning sea-facing 2BHK with floor-to-ceiling windows. Fully furnished with premium fittings. Located in one of Mumbai\'s most sought-after addresses.', 'Kavita Joshi',    '9820006666'),
  ('3BHK Villa Row House, Whitefield',       3, 45000,  14000000, 'Whitefield',     'Bengaluru', 1600, 0,  2,  'semi-furnished', '2025-06-15', 'Spacious 3BHK row house with a private garden and two-car parking. Excellent connectivity to ITPL and Marathahalli. Quiet residential neighborhood.', 'Vikram Rao',      '9845007777'),
  ('Luxury 3BHK in Jubilee Hills',           3, 60000,  22000000, 'Jubilee Hills',  'Hyderabad', 1850, 5,  12, 'furnished',      '2025-05-20', 'Ultra-premium 3BHK with designer interiors, smart home automation, and a private terrace. Concierge services, valet parking, and rooftop pool. Best-in-class amenities.', 'Meena Chandra',   '9876008888'),
  ('3BHK in Andheri West',                   3, 70000,  28000000, 'Andheri West',   'Mumbai',    1400, 6,  20, 'furnished',      '2025-05-01', 'Well-appointed 3BHK in a high-rise with panoramic city views. Fully furnished with premium appliances. Walking distance to metro and malls.', 'Rohit Malhotra',  '9820009999'),
  ('Budget 3BHK in Electronic City',         3, 22000,  7500000,  'Electronic City','Bengaluru', 1250, 1,  5,  'unfurnished',    '2025-06-01', 'Affordable 3BHK in a peaceful society. Unfurnished, great for families who want to set up their own home. 2 km from Infosys and major tech companies.', 'Shanthi Gowda',   '9845010000'),
  ('Grand 4BHK Penthouse, Indiranagar',      4, 120000, 55000000, 'Indiranagar',    'Bengaluru', 3200, 12, 12, 'furnished',      '2025-07-01', 'Breathtaking 4BHK penthouse with 360° city views, private rooftop deck, home theatre, and designer kitchen. The pinnacle of urban luxury living in Bengaluru.', 'Arjun Shetty',    '9845011111'),
  ('4BHK Independent House in Gachibowli',   4, 65000,  25000000, 'Gachibowli',     'Hyderabad', 2800, 0,  3,  'semi-furnished', '2025-06-20', 'Elegant independent 4BHK with landscaped garden, home office room, and covered parking for 3 cars. Close to financial district and DLF Cyber City.', 'Padma Rao',       '9876012222'),
  ('4BHK Duplex in Powai',                   4, 95000,  42000000, 'Powai',          'Mumbai',    2600, 10, 18, 'furnished',      '2025-05-25', 'Spectacular duplex apartment overlooking Powai Lake. Premium finishes throughout, private pool access, and 3 dedicated parking spots. A rare find in Mumbai.', 'Nikhil Verma',    '9820013333');
