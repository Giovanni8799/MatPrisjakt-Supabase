# MatPrisjakt Supabase-konfiguration

Detta repository innehåller SQL-skript för att konfigurera Supabase-databasen för MatPrisjakt-appen.

## Komma igång

### 1. Skapa ett Supabase-projekt

1. Gå till [Supabase](https://supabase.com/) och skapa ett konto om du inte redan har ett
2. Skapa ett nytt projekt
3. Välj ett projektnamn (t.ex. "MatPrisjakt")
4. Välj ett lösenord för databasen (spara detta på ett säkert ställe)
5. Välj en region nära dig (t.ex. "Stockholm (eu-north-1)")
6. Vänta tills projektet har skapats

### 2. Konfigurera databasen

1. Gå till SQL-editorn i ditt Supabase-projekt (klicka på "SQL Editor" i vänstermenyn)
2. Kopiera innehållet från `schema.sql` i detta repository
3. Klistra in det i SQL-editorn och kör skriptet
4. Kopiera innehållet från `seed_data.sql` i detta repository
5. Klistra in det i SQL-editorn och kör skriptet

### 3. Konfigurera appen

1. Gå till projektinställningarna genom att klicka på kugghjulsikonen i vänstermenyn
2. Välj "API" i inställningsmenyn
3. Under "Project API keys" hittar du:
   - URL: Detta är din `supabaseUrl` (t.ex. "https://abcdefghijklm.supabase.co")
   - anon/public: Detta är din `supabaseAnonKey` (en lång sträng)
4. Kopiera dessa värden och uppdatera `src/services/supabase.ts` i din app med dina faktiska uppgifter:

```typescript
const supabaseUrl = 'https://din-supabase-url.supabase.co';
const supabaseAnonKey = 'din-supabase-anon-key';
```

## Databasstruktur

Databasen innehåller följande tabeller:

- **products**: Information om produkter
- **stores**: Information om butiker
- **price_records**: Prisdata för produkter i butiker
- **economic_indices**: Ekonomiska index för jämförelse
- **economic_index_values**: Värden för ekonomiska index

## Säkerhet

Databasen är konfigurerad med Row Level Security (RLS) för att skydda data:

- Alla kan läsa data
- Endast inloggade användare kan rapportera priser
- Användare kan endast uppdatera/ta bort sina egna prisrapporter
- Endast administratörer kan hantera produkter, butiker och ekonomiska index

## Testdata

Exempeldata inkluderar:

- 20 grundläggande livsmedel
- 5 butiker i Linköping
- 3 ekonomiska index (KPI, KPIF, Livsmedelsprisindex)
- Indexvärden för hela 2023
- Några exempelpriser för att testa appen