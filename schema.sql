-- Skapa tabeller för MatPrisjakt-appen

-- Produkter
CREATE TABLE products (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  brand TEXT NOT NULL,
  unit TEXT NOT NULL,
  standard_size NUMERIC NOT NULL,
  image_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Butiker
CREATE TABLE stores (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  chain TEXT NOT NULL,
  location GEOGRAPHY(POINT) NOT NULL,
  address TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Prisdata
CREATE TABLE price_records (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  product_id UUID NOT NULL REFERENCES products(id),
  store_id UUID NOT NULL REFERENCES stores(id),
  price NUMERIC NOT NULL,
  date TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  is_on_sale BOOLEAN DEFAULT FALSE,
  reported_by TEXT NOT NULL CHECK (reported_by IN ('system', 'user')),
  user_id UUID REFERENCES auth.users(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Ekonomiska index
CREATE TABLE economic_indices (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  description TEXT,
  source TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Indexvärden
CREATE TABLE economic_index_values (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  index_id UUID NOT NULL REFERENCES economic_indices(id),
  date DATE NOT NULL,
  value NUMERIC NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Skapa vyer för enklare åtkomst

-- Senaste priserna för varje produkt
CREATE VIEW latest_prices AS
SELECT DISTINCT ON (product_id, store_id)
  pr.id,
  pr.product_id,
  pr.store_id,
  pr.price,
  pr.date,
  pr.is_on_sale,
  pr.reported_by,
  pr.user_id
FROM price_records pr
ORDER BY product_id, store_id, date DESC;

-- Aktivera Row Level Security
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE stores ENABLE ROW LEVEL SECURITY;
ALTER TABLE price_records ENABLE ROW LEVEL SECURITY;
ALTER TABLE economic_indices ENABLE ROW LEVEL SECURITY;
ALTER TABLE economic_index_values ENABLE ROW LEVEL SECURITY;

-- Skapa policyer för åtkomst
-- Alla kan läsa produkter
CREATE POLICY "Alla kan läsa produkter" ON products
  FOR SELECT USING (true);

-- Bara admins kan skapa/uppdatera/ta bort produkter
CREATE POLICY "Bara admins kan skapa produkter" ON products
  FOR INSERT WITH CHECK (auth.role() = 'authenticated' AND auth.jwt() ->> 'role' = 'admin');

CREATE POLICY "Bara admins kan uppdatera produkter" ON products
  FOR UPDATE USING (auth.role() = 'authenticated' AND auth.jwt() ->> 'role' = 'admin');

CREATE POLICY "Bara admins kan ta bort produkter" ON products
  FOR DELETE USING (auth.role() = 'authenticated' AND auth.jwt() ->> 'role' = 'admin');

-- Alla kan läsa butiker
CREATE POLICY "Alla kan läsa butiker" ON stores
  FOR SELECT USING (true);

-- Bara admins kan skapa/uppdatera/ta bort butiker
CREATE POLICY "Bara admins kan skapa butiker" ON stores
  FOR INSERT WITH CHECK (auth.role() = 'authenticated' AND auth.jwt() ->> 'role' = 'admin');

CREATE POLICY "Bara admins kan uppdatera butiker" ON stores
  FOR UPDATE USING (auth.role() = 'authenticated' AND auth.jwt() ->> 'role' = 'admin');

CREATE POLICY "Bara admins kan ta bort butiker" ON stores
  FOR DELETE USING (auth.role() = 'authenticated' AND auth.jwt() ->> 'role' = 'admin');

-- Alla kan läsa prisdata
CREATE POLICY "Alla kan läsa prisdata" ON price_records
  FOR SELECT USING (true);

-- Inloggade användare kan rapportera priser
CREATE POLICY "Inloggade användare kan rapportera priser" ON price_records
  FOR INSERT WITH CHECK (auth.role() = 'authenticated' AND reported_by = 'user' AND user_id = auth.uid());

-- Användare kan bara uppdatera sina egna prisrapporter
CREATE POLICY "Användare kan bara uppdatera sina egna prisrapporter" ON price_records
  FOR UPDATE USING (auth.role() = 'authenticated' AND user_id = auth.uid());

-- Användare kan bara ta bort sina egna prisrapporter
CREATE POLICY "Användare kan bara ta bort sina egna prisrapporter" ON price_records
  FOR DELETE USING (auth.role() = 'authenticated' AND user_id = auth.uid());

-- Alla kan läsa ekonomiska index
CREATE POLICY "Alla kan läsa ekonomiska index" ON economic_indices
  FOR SELECT USING (true);

-- Bara admins kan hantera ekonomiska index
CREATE POLICY "Bara admins kan skapa ekonomiska index" ON economic_indices
  FOR INSERT WITH CHECK (auth.role() = 'authenticated' AND auth.jwt() ->> 'role' = 'admin');

CREATE POLICY "Bara admins kan uppdatera ekonomiska index" ON economic_indices
  FOR UPDATE USING (auth.role() = 'authenticated' AND auth.jwt() ->> 'role' = 'admin');

CREATE POLICY "Bara admins kan ta bort ekonomiska index" ON economic_indices
  FOR DELETE USING (auth.role() = 'authenticated' AND auth.jwt() ->> 'role' = 'admin');

-- Alla kan läsa indexvärden
CREATE POLICY "Alla kan läsa indexvärden" ON economic_index_values
  FOR SELECT USING (true);

-- Bara admins kan hantera indexvärden
CREATE POLICY "Bara admins kan skapa indexvärden" ON economic_index_values
  FOR INSERT WITH CHECK (auth.role() = 'authenticated' AND auth.jwt() ->> 'role' = 'admin');

CREATE POLICY "Bara admins kan uppdatera indexvärden" ON economic_index_values
  FOR UPDATE USING (auth.role() = 'authenticated' AND auth.jwt() ->> 'role' = 'admin');

CREATE POLICY "Bara admins kan ta bort indexvärden" ON economic_index_values
  FOR DELETE USING (auth.role() = 'authenticated' AND auth.jwt() ->> 'role' = 'admin');