-- Exempeldata för MatPrisjakt-appen

-- Produkter
INSERT INTO products (name, category, brand, unit, standard_size, image_url) VALUES
('Mjölk 3%', 'Mejeri', 'Arla', 'liter', 1, 'https://example.com/milk.jpg'),
('Mjölk 1.5%', 'Mejeri', 'Arla', 'liter', 1, 'https://example.com/milk-light.jpg'),
('Havregryn', 'Frukost', 'AXA', 'kg', 0.75, 'https://example.com/oats.jpg'),
('Vetemjöl', 'Bakning', 'Kungsörnen', 'kg', 2, 'https://example.com/flour.jpg'),
('Strösocker', 'Bakning', 'Dansukker', 'kg', 1, 'https://example.com/sugar.jpg'),
('Kaffe', 'Dryck', 'Gevalia', 'kg', 0.5, 'https://example.com/coffee.jpg'),
('Ägg 10-pack', 'Mejeri', 'Kronägg', 'st', 10, 'https://example.com/eggs.jpg'),
('Smör', 'Mejeri', 'Arla', 'kg', 0.5, 'https://example.com/butter.jpg'),
('Pasta', 'Torrvaror', 'Barilla', 'kg', 0.5, 'https://example.com/pasta.jpg'),
('Ris', 'Torrvaror', 'Uncle Ben''s', 'kg', 1, 'https://example.com/rice.jpg'),
('Bröd', 'Bröd', 'Pågen', 'st', 1, 'https://example.com/bread.jpg'),
('Köttfärs', 'Kött', 'Scan', 'kg', 0.5, 'https://example.com/mince.jpg'),
('Kycklingfilé', 'Kött', 'Kronfågel', 'kg', 0.7, 'https://example.com/chicken.jpg'),
('Lax', 'Fisk', 'Findus', 'kg', 0.4, 'https://example.com/salmon.jpg'),
('Äpple', 'Frukt', 'ICA', 'kg', 1, 'https://example.com/apple.jpg'),
('Banan', 'Frukt', 'Chiquita', 'kg', 1, 'https://example.com/banana.jpg'),
('Potatis', 'Grönsaker', 'Swegro', 'kg', 2, 'https://example.com/potato.jpg'),
('Lök', 'Grönsaker', 'ICA', 'kg', 1, 'https://example.com/onion.jpg'),
('Tomat', 'Grönsaker', 'ICA', 'kg', 0.5, 'https://example.com/tomato.jpg'),
('Gurka', 'Grönsaker', 'ICA', 'st', 1, 'https://example.com/cucumber.jpg');

-- Butiker
INSERT INTO stores (name, chain, location, address) VALUES
('ICA Maxi Linköping', 'ICA', ST_GeomFromText('POINT(15.5631 58.4108)', 4326), 'Västra vägen 7B, 582 28 Linköping'),
('Willys Linköping', 'Willys', ST_GeomFromText('POINT(15.6266 58.4090)', 4326), 'Djurgårdsgatan 31, 582 29 Linköping'),
('Coop Forum Linköping', 'Coop', ST_GeomFromText('POINT(15.6019 58.4300)', 4326), 'Tornbyvägen 1, 582 73 Linköping'),
('Lidl Linköping', 'Lidl', ST_GeomFromText('POINT(15.6305 58.4114)', 4326), 'S:t Larsgatan 25, 582 24 Linköping'),
('Hemköp Linköping', 'Hemköp', ST_GeomFromText('POINT(15.6214 58.4103)', 4326), 'Storgatan 24, 582 23 Linköping');

-- Ekonomiska index
INSERT INTO economic_indices (name, description, source) VALUES
('KPI', 'Konsumentprisindex', 'SCB'),
('KPIF', 'Konsumentprisindex med fast ränta', 'SCB'),
('Livsmedelsprisindex', 'Index för livsmedelspriser', 'SCB');

-- Indexvärden
INSERT INTO economic_index_values (index_id, date, value) VALUES
((SELECT id FROM economic_indices WHERE name = 'KPI'), '2023-01-01', 100.0),
((SELECT id FROM economic_indices WHERE name = 'KPI'), '2023-02-01', 100.5),
((SELECT id FROM economic_indices WHERE name = 'KPI'), '2023-03-01', 101.2),
((SELECT id FROM economic_indices WHERE name = 'KPI'), '2023-04-01', 101.8),
((SELECT id FROM economic_indices WHERE name = 'KPI'), '2023-05-01', 102.3),
((SELECT id FROM economic_indices WHERE name = 'KPI'), '2023-06-01', 102.1),
((SELECT id FROM economic_indices WHERE name = 'KPI'), '2023-07-01', 102.5),
((SELECT id FROM economic_indices WHERE name = 'KPI'), '2023-08-01', 102.8),
((SELECT id FROM economic_indices WHERE name = 'KPI'), '2023-09-01', 103.2),
((SELECT id FROM economic_indices WHERE name = 'KPI'), '2023-10-01', 103.5),
((SELECT id FROM economic_indices WHERE name = 'KPI'), '2023-11-01', 103.8),
((SELECT id FROM economic_indices WHERE name = 'KPI'), '2023-12-01', 104.0),
((SELECT id FROM economic_indices WHERE name = 'KPIF'), '2023-01-01', 100.0),
((SELECT id FROM economic_indices WHERE name = 'KPIF'), '2023-02-01', 100.3),
((SELECT id FROM economic_indices WHERE name = 'KPIF'), '2023-03-01', 100.8),
((SELECT id FROM economic_indices WHERE name = 'KPIF'), '2023-04-01', 101.2),
((SELECT id FROM economic_indices WHERE name = 'KPIF'), '2023-05-01', 101.5),
((SELECT id FROM economic_indices WHERE name = 'KPIF'), '2023-06-01', 101.3),
((SELECT id FROM economic_indices WHERE name = 'KPIF'), '2023-07-01', 101.6),
((SELECT id FROM economic_indices WHERE name = 'KPIF'), '2023-08-01', 101.9),
((SELECT id FROM economic_indices WHERE name = 'KPIF'), '2023-09-01', 102.2),
((SELECT id FROM economic_indices WHERE name = 'KPIF'), '2023-10-01', 102.4),
((SELECT id FROM economic_indices WHERE name = 'KPIF'), '2023-11-01', 102.6),
((SELECT id FROM economic_indices WHERE name = 'KPIF'), '2023-12-01', 102.8),
((SELECT id FROM economic_indices WHERE name = 'Livsmedelsprisindex'), '2023-01-01', 100.0),
((SELECT id FROM economic_indices WHERE name = 'Livsmedelsprisindex'), '2023-02-01', 100.8),
((SELECT id FROM economic_indices WHERE name = 'Livsmedelsprisindex'), '2023-03-01', 101.5),
((SELECT id FROM economic_indices WHERE name = 'Livsmedelsprisindex'), '2023-04-01', 102.3),
((SELECT id FROM economic_indices WHERE name = 'Livsmedelsprisindex'), '2023-05-01', 103.1),
((SELECT id FROM economic_indices WHERE name = 'Livsmedelsprisindex'), '2023-06-01', 102.8),
((SELECT id FROM economic_indices WHERE name = 'Livsmedelsprisindex'), '2023-07-01', 103.5),
((SELECT id FROM economic_indices WHERE name = 'Livsmedelsprisindex'), '2023-08-01', 104.2),
((SELECT id FROM economic_indices WHERE name = 'Livsmedelsprisindex'), '2023-09-01', 105.0),
((SELECT id FROM economic_indices WHERE name = 'Livsmedelsprisindex'), '2023-10-01', 105.8),
((SELECT id FROM economic_indices WHERE name = 'Livsmedelsprisindex'), '2023-11-01', 106.5),
((SELECT id FROM economic_indices WHERE name = 'Livsmedelsprisindex'), '2023-12-01', 107.0);

-- Prisdata
-- Mjölk 3%
INSERT INTO price_records (product_id, store_id, price, date, is_on_sale, reported_by)
SELECT 
  (SELECT id FROM products WHERE name = 'Mjölk 3%'),
  (SELECT id FROM stores WHERE name = 'ICA Maxi Linköping'),
  15.90,
  '2023-12-01',
  false,
  'system';

INSERT INTO price_records (product_id, store_id, price, date, is_on_sale, reported_by)
SELECT 
  (SELECT id FROM products WHERE name = 'Mjölk 3%'),
  (SELECT id FROM stores WHERE name = 'Willys Linköping'),
  15.50,
  '2023-12-01',
  false,
  'system';

INSERT INTO price_records (product_id, store_id, price, date, is_on_sale, reported_by)
SELECT 
  (SELECT id FROM products WHERE name = 'Mjölk 3%'),
  (SELECT id FROM stores WHERE name = 'Coop Forum Linköping'),
  16.20,
  '2023-12-01',
  false,
  'system';

-- Havregryn
INSERT INTO price_records (product_id, store_id, price, date, is_on_sale, reported_by)
SELECT 
  (SELECT id FROM products WHERE name = 'Havregryn'),
  (SELECT id FROM stores WHERE name = 'ICA Maxi Linköping'),
  22.90,
  '2023-12-01',
  false,
  'system';

INSERT INTO price_records (product_id, store_id, price, date, is_on_sale, reported_by)
SELECT 
  (SELECT id FROM products WHERE name = 'Havregryn'),
  (SELECT id FROM stores WHERE name = 'Willys Linköping'),
  21.50,
  '2023-12-01',
  true,
  'system';

INSERT INTO price_records (product_id, store_id, price, date, is_on_sale, reported_by)
SELECT 
  (SELECT id FROM products WHERE name = 'Havregryn'),
  (SELECT id FROM stores WHERE name = 'Coop Forum Linköping'),
  23.90,
  '2023-12-01',
  false,
  'system';

-- Lägg till fler priser för historik
INSERT INTO price_records (product_id, store_id, price, date, is_on_sale, reported_by)
SELECT 
  (SELECT id FROM products WHERE name = 'Mjölk 3%'),
  (SELECT id FROM stores WHERE name = 'ICA Maxi Linköping'),
  14.90,
  '2023-06-01',
  false,
  'system';

INSERT INTO price_records (product_id, store_id, price, date, is_on_sale, reported_by)
SELECT 
  (SELECT id FROM products WHERE name = 'Mjölk 3%'),
  (SELECT id FROM stores WHERE name = 'ICA Maxi Linköping'),
  13.90,
  '2023-01-01',
  false,
  'system';