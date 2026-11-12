# Product Requirements Document (PRD) & Technical Brief: HISAAB
**Document Version:** 2.0.0 (Post-Redesign Baseline)
**Target Platform:** Android-First (Native / Flutter)
**Region & Currency:** India (₹ / INR), Indian Numbering System (Lakhs & Crores)
**Core Value Proposition:** 100% On-Device, Air-Gapped Personal Finance Ledger with Policy-Gated Local Candidate Detection.

---

## 1. Executive Summary & Product Vision

### 1.1 Problem Statement
The dominant personal finance and expense-tracking applications in India (e.g., Axio, CRED, Fold, Jupiter, Walnut) rely heavily on remote infrastructure:
1. Mandating cloud logins and backend account aggregation (RBI Account Aggregator framework).
2. Uploading intimate transactional SMS bodies or notifications to cloud servers for parsing and merchant entity resolution.
3. Exposing users to unsolicited lending funnels, credit card pitches, and persistent data breach vectors.

For privacy-conscious users, there is no modern, high-craft, air-gapped instrument that provides disciplined accounting, budgeting, and transaction categorization without surrendering financial logs to a third-party server.

### 1.2 The Solution
**HISAAB** (हिसाब — Urdu/Hindi for *"Account/Calculation"*) is a 100% local-first, air-gapped Android application.
- **Zero Cloud Infrastructure:** All financial balances, account tallies, categorization trees, and monthly targets reside exclusively in a local on-device SQLite database.
- **Air-Gapped Candidate Detection:** Incoming transactional notifications and bank SMS messages are intercepted via a policy-gated local listener and parsed entirely in-memory using on-device regex algorithms.
- **Strict Verification Gate:** Intercepted candidates are never silently committed to the ledger or calculated into net balances without explicit user review.
- **Honest, Disciplined Aesthetic:** Modern editorial utility built with clean flat surfaces, emerald brand anchors, subtle hairlines, and native typography—completely free of glassmorphism, gradients, or AI/cloud marketing gimmicks.

---

## 2. Core Personas & User Stories

### 2.1 Primary Persona: "The Privacy-Conscious Indian Professional"
- **Demographics:** 24–42 years old; software engineer, financial analyst, doctor, or creative director in Tier-1/2 Indian metros (Bengaluru, Mumbai, Delhi-NCR, Pune, Hyderabad).
- **Financial Profile:** Heavy UPI user (Google Pay, PhonePe, Paytm, CRED), 2–3 active bank accounts (Salary account, high-yield savings, emergency fund), physical cash pocket expenses.
- **Key Pain Point:** Reluctant to grant cloud-backed apps unrestricted SMS permissions; seeks a quiet, dependable instrument to track burn rate without ads, bank sync failures, or telemetry.

### 2.2 Key User Journeys
1. **Manual Entry in Under 5 Seconds:** Fast tap on the persistent quick-add button (`+`) to record cash or unmonitored UPI spending with instant category assignment and payment mode selection.
2. **Reviewing Incoming Transaction Candidates:** Reviewing unconfirmed notifications/SMS candidates staged in the Candidate Queue; one-tap approval commits the item to the SQLite ledger.
3. **Monthly 50/30/20 Budget Calibration:** Reviewing actual spending against monthly limits across Needs (50%), Wants (30%), and Savings/Investments (20%).
4. **Offline Export & Backup:** Exporting records directly to standard CSV or encrypted database files using Android's native Storage Access Framework (SAF).

---

## 3. Architecture & Technical Guardrails

### 3.1 100% Local-First / Zero-Cloud Contract
- **No Internet Permission:** Production manifest eliminates `android.permission.INTERNET` to guarantee mathematically and auditably that zero data leaves the device.
- **Local Storage Engine:** On-device SQLite / Room database (Android) or `sqflite` (Flutter).
- **Local Hardware Encryption:** Database file optionally encrypted using SQLCipher with AES-256 keys backed by the Android Keystore.
- **Biometric Security:** Android `BiometricPrompt` / `local_auth` gating application launch without remote token verification.
- **Zero Telemetry:** No Mixpanel, Firebase Analytics, Sentry, or third-party SDKs transmitting user interactions or transaction payloads.

### 3.2 Candidate Interception & Ingestion Pipeline
```
[ Incoming SMS / Notification ]
              │
              ▼
[ Android BroadcastReceiver / Listener ] (Policy-Gated: Disabled until permission granted)
              │
              ▼
[ Local In-Memory Regex Parsing Engine ] (Extracts: Amount, Payee/Merchant, Account Last4, Instrument)
              │
              ▼
[ Duplicate Detection Check ] (Matches against manual entries within ±0% amount & 4hr window)
              │
              ▼
[ Candidates Table in SQLite ] (Status: PENDING_REVIEW)
              │
              ▼
[ Ledger Balance: UNTOUCHED ] ──► [ User Explicitly Confirms ] ──► [ Transactions Table ]
```

- **Policy-Gated Permissions:** Android SMS access is treated as strictly optional and gated behind clear explanatory UI. If permissions are withheld, manual entry and CSV import remain 100% operational.
- **Uncommitted Candidates:** Candidate transactions have zero impact on Available Balance, Inflow, Outflow, or Budget totals until confirmed.

### 3.3 Currency & Numeric Formatting Conventions
- **Currency Symbol:** Indian Rupee (`₹`, INR).
- **Number Grouping:** Indian Numbering System (Lakhs and Crores).
  - Standard format: `₹1,48,250.00`
  - Compact format: `₹2.40L` / `₹1.12L`
- **Tabular Figures:** `font-variant-numeric: tabular-nums` applied across all numerical ledger entries to maintain vertical alignment and prevent layout jitter.

---

## 4. UI/UX Design System Specification

### 4.1 Aesthetic Foundation: "Quiet Emerald Ledger"
- **Style:** Clean, flat, editorial hierarchy. Avoids decorative glassmorphism, blur effects, ambient glow blobs, and gradients.
- **Borders & Dividers:** Subtle 1px solid dividers (`#E1E5E0` in Light; `#334139` in Dark) replacing heavy drop shadows.
- **Corner Radii:** Cards: `12dp` standard, Pills/Chips: `16dp`–`20dp` reserved exclusively for filters or status tags.
- **Typography:** Android-native sans-serif (**Roboto Flex** / **Roboto**).
  - Balance Hero: `32sp` maximum / Bold / Tabular numerals.
  - Screen Titles: `24sp` / Bold.
  - Section Headings: `20sp` / Semi-bold.
  - Body Copy: `14sp`–`16sp` / Regular.
  - Supporting Microcopy: Never smaller than `12sp`.

### 4.2 Approved Color Tokens

| Token Name | Light Theme | Dark Theme | Functional Role |
| :--- | :--- | :--- | :--- |
| **Canvas Background** | `#F7F7F3` | `#111714` | Global viewport background (warm neutral / moss charcoal) |
| **Surface Card** | `#FFFFFF` | `#18211D` | Primary card containers, list items, app bars |
| **Elevated Surface** | `#EFF2ED` | `#202B25` | Search inputs, segmented pill tracks, progress bar tracks |
| **Primary Text** | `#18211D` | `#E8F0EA` | Primary balances, screen titles, merchant headers |
| **Secondary Text** | `#64706A` | `#AAB8AF` | Timestamps, payment modes, account numbers |
| **Dividers / Hairlines** | `#E1E5E0` | `#334139` | 1px clean separators |
| **Primary Brand / Action**| `#176B4A` | `#67C497` | Primary buttons, active tab indicators, major accents |
| **Dark / Pressed Emerald**| `#0D4F36` | `#3E9C70` | Button pressed states |
| **Soft Emerald Surface** | `#E4F1E9` | `#1C3629` | Alert backgrounds, active pill highlights |
| **Income / Inflows** | `#168057` | `#6ED09C` | Inflow numbers, credits, positive balances |
| **Expense / Outflows** | `#B5473C` | `#F08A80` | Outflow figures, debits, spending indicators |
| **Transfer / Info** | `#526A8D` | `#9BB8DD` | Neutral account-to-account transfers, informational chips |
| **Warning Threshold** | `#A96812` | `#E7B660` | Budget alerts (≥80% spend reached) |
| **Error / Destructive** | `#B42318` | `#F08A80` | Destructive confirmations, critical failures |

---

## 5. Core Screen Inventory & Functional Requirements

### 5.1 Screen 1: Home Dashboard (`home_dashboard`)
- **Top App Bar:** Clean `HISAAB` brand heading, month selector (`October 2024 ▾`), and notification bell.
- **Available Balance Hero:** Plain background display of total balance (`₹1,48,250.00`) aggregated across accounts.
- **Compact Cash Flow Summary:** Single 3-column card displaying Total Inflow (`₹85,000.00`), Total Outflow (`₹42,680.00`), and Net Saved (`₹42,320.00`).
- **Quick Action Triggers:** Three clear labeled buttons: `Add Expense`, `Add Income`, and `Transfer`.
- **Review Queue Banner:** Actionable alert banner (*"3 transactions awaiting review"*) linking directly to candidate resolution.
- **Monthly Spending vs. Budget:** Single spending meter comparing month-to-date spending against monthly limit with compact daily pace tracker (*"Today: ₹840 spent • ₹217 below daily pace"*).
- **Accounts Summary:** Compact list rows showing active accounts (e.g., HDFC Salary, ICICI Savings, Cash Wallet).
- **Savings Goals Summary:** Single compact goal progress tracker (*"Emergency Fund (6 Mo)"* at 80%) with a link to *"View goals →"*.
- **Recent Transactions:** Date-grouped ledger rows showing payee, category, payment mode, and amount.

### 5.2 Screen 2: Transactions Ledger (`transactions_ledger`)
- **Search & Filter:** Search bar with live keyword filtering; segmented chips for `All`, `Expenses`, `Income`, and `Transfers`.
- **Monthly Ribbon:** Month summary showing Net Balance and total income/expenses.
- **Grouped Date Feed:** Transactions grouped by day (`Today`, `Yesterday`, specific dates) with day totals.
- **Honest Origin Badges:** Explicit chips designating provenance: `SMS`, `Manual`, or `Import`.
- **CSV Export Action:** Clean bottom trigger to export filtered transactions as a standard CSV file.

### 5.3 Screen 3: Insights & Cash Flow Analytics (`insights_analytics`)
- **Period Selector:** Segmented control for `Weekly`, `Monthly`, `Yearly`, and `Custom`.
- **Cash Flow Summary:** Inflow vs. Outflow percentage split and net savings rate (e.g., `49.8%`).
- **Spending Velocity Module:** 4-week bar chart depicting weekly spending with daily average pace (`₹1,376 / day`).
- **Category Allocation:** Progress rows showing percentage and amount across top spending categories.
- **Expense Composition:** Fixed vs. Variable spending split (e.g., 62% Fixed: Rent, EMIs, Utilities).
- **Factual Observations:** Plain text observations without AI marketing labels (e.g., *"Dining spending was ₹1,240 lower than last month"*).

### 5.4 Screen 4: Budgets & 50/30/20 Management (`budgets_management`)
- **50/30/20 Allocation Summary:** Three restrained progress rows for:
  - *Needs (50% target)*: Rent, groceries, utilities.
  - *Wants (30% target)*: Dining, shopping, entertainment.
  - *Savings (20% target)*: Emergency reserve, investments.
- **Category Limits:** Individual category budget rows with progress bars; warning banner (`85% limit reached`) shown only when threshold is crossed.
- **Savings Targets:** Goal cards displaying current savings, target amount, deadline, and a single `Add contribution` CTA.

### 5.5 Screen 5: Profile & Settings (`profile_settings`)
- **Account Header:** User avatar, name, and local storage account count (*"Local storage • 3 accounts"*).
- **Financial Setup:** Standard grouped settings rows linking to Accounts, Categories & Subcategories, and Payment Methods.
- **Storage & Backup:** Rows for *"Export transactions as CSV"* and *"Restore local backup"*; database file footprint indicator (e.g., `2.4 MB`).
- **Transaction Detection (Policy-Gated):** Muted toggle displaying disabled status until SMS permissions are explicitly granted; explanatory notice explaining local-only parsing.
- **Device Security:** Biometric app lock toggle and balance masking on launch.
- **Preferences:** Theme selector (`System / Light / Dark`) and notification toggles.
- **Regional Formats:** Base currency (`₹ INR`) and Numbering System (`Lakhs & Crores grouping`).

---

## 6. Local SQLite Schema Contract

```sql
-- Accounts Table
CREATE TABLE accounts (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    type TEXT NOT NULL CHECK(type IN ('SAVINGS', 'CURRENT', 'CREDIT_CARD', 'WALLET', 'CASH')),
    account_number_last4 TEXT,
    balance REAL NOT NULL DEFAULT 0.0,
    currency TEXT NOT NULL DEFAULT 'INR',
    created_at INTEGER NOT NULL
);

-- Transactions Table (Committed Ledger)
CREATE TABLE transactions (
    id TEXT PRIMARY KEY,
    account_id TEXT NOT NULL,
    amount REAL NOT NULL,
    type TEXT NOT NULL CHECK(type IN ('EXPENSE', 'INCOME', 'TRANSFER')),
    category_id TEXT NOT NULL,
    payment_mode TEXT NOT NULL CHECK(payment_mode IN ('UPI', 'DEBIT_CARD', 'CREDIT_CARD', 'NETBANKING', 'CASH')),
    payee_merchant TEXT NOT NULL,
    notes TEXT,
    source TEXT NOT NULL CHECK(source IN ('SMS', 'MANUAL', 'NOTIFICATION', 'CSV')),
    raw_payload TEXT,
    timestamp INTEGER NOT NULL,
    is_reconciled INTEGER NOT NULL DEFAULT 1,
    FOREIGN KEY (account_id) REFERENCES accounts(id)
);

-- Candidates Queue Table (Unconfirmed Staging)
CREATE TABLE candidates (
    id TEXT PRIMARY KEY,
    source TEXT NOT NULL CHECK(source IN ('SMS', 'NOTIFICATION')),
    raw_text TEXT NOT NULL,
    sender TEXT NOT NULL,
    parsed_amount REAL NOT NULL,
    parsed_merchant TEXT,
    parsed_account_last4 TEXT,
    suggested_category_id TEXT,
    confidence_score REAL,
    is_duplicate INTEGER NOT NULL DEFAULT 0,
    status TEXT NOT NULL DEFAULT 'PENDING' CHECK(status IN ('PENDING', 'CONFIRMED', 'IGNORED')),
    received_at INTEGER NOT NULL
);

-- Budgets Table (50/30/20 & Category Ceilings)
CREATE TABLE budgets (
    id TEXT PRIMARY KEY,
    category_id TEXT,
    bucket_type TEXT NOT NULL CHECK(bucket_type IN ('NEED', 'WANT', 'SAVING')),
    monthly_limit REAL NOT NULL,
    alert_threshold REAL NOT NULL DEFAULT 0.80,
    month_year TEXT NOT NULL -- 'YYYY-MM'
);

-- Savings Goals Table
CREATE TABLE savings_goals (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    target_amount REAL NOT NULL,
    current_amount REAL NOT NULL DEFAULT 0.0,
    target_date INTEGER,
    status TEXT NOT NULL DEFAULT 'ACTIVE' CHECK(status IN ('ACTIVE', 'COMPLETED'))
);
```

---

## 7. Implementation Roadmap & Milestones

| Milestone | Deliverables | Target Architecture |
| :--- | :--- | :--- |
| **Phase 1: Local Foundation** | SQLite schema setup, repository layers, warm neutral UI tokens, manual transaction entry, and 5-destination tab navigation. | Local DB & Manual Ledger |
| **Phase 2: Review Engine** | Air-gapped regex parser, candidate staging table, duplicate heuristic matcher, and permission-gated settings flow. | Candidate Queue Engine |
| **Phase 3: Financial Frameworks** | 50/30/20 allocation logic, category alert triggers, and savings goals contribution flows. | Budget & Target Calculator |
| **Phase 4: Analytics & Portability** | Weekly burn rate charts, Fixed vs. Variable cost ratios, CSV export/import, and Biometric authentication. | Hardened Local Release |
