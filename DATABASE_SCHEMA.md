# Database schema specification

This document translates the approved product and data contracts into a local database-ready schema for Drift + SQLite. It is an implementable specification, not a promise that the app is implemented or tested.

## Design principles

- Use a single local ledger as the source of truth.
- Store money in integer paise and keep an ISO currency code (`INR` by default).
- Preserve the moment of occurrence and the local reporting date context.
- Never store mutable account balance, budget actual, or report-total counters as authoritative.
- Treat archives as non-destructive historical preservation.
- Preserve historical references when accounts, categories, and payment methods are archived.
- Use explicit review states for detected candidates and import previews.
- Keep receipts, SMS bodies, and raw notification payloads out of the core ledger unless a narrowly justified storage need is approved.

## Transaction status, verification, and source

The schema must preserve these values explicitly:

- `status`: `pending`, `successful`, `failed`, `refunded`, `reversed`
- `verification`: `confirmed` for persisted ledger entries
- `source`: `manual_entry`, `notification`, `sms`, `import`
- candidate state values for non-ledger detection/import records: `needs_review`, `confirmed`, `ignored`, `duplicate_review_pending`

The exact balance/report effect of pending, refunded, and reversed entries remains an unresolved product decision. The schema must store the status and must not silently treat ambiguous or pending signals as confirmed financial success.

## Core tables

### accounts

| Column | Type | Notes |
|---|---|---|
| id | TEXT PRIMARY KEY | Stable UUID |
| name | TEXT NOT NULL | User-facing account name |
| kind | TEXT NOT NULL | Example: cash, bank, wallet, other |
| currency_code | TEXT NOT NULL | ISO 4217 code, default `INR` |
| opening_balance_minor | INTEGER NOT NULL DEFAULT 0 | Ledger baseline; not authoritative by itself |
| is_archived | INTEGER NOT NULL DEFAULT 0 | Historical references remain valid |
| created_at | TEXT NOT NULL | ISO 8601 UTC timestamp |
| updated_at | TEXT NOT NULL | ISO 8601 UTC timestamp |

Rules:
- Account balance is derived from ledger entries and opening balance.
- Archival must not delete historical references or transactions.
- Currency must be consistent for balance reporting and transfer validation.

### categories

| Column | Type | Notes |
|---|---|---|
| id | TEXT PRIMARY KEY | Stable UUID |
| name | TEXT NOT NULL | User-facing label |
| kind | TEXT NOT NULL | `income`, `expense`, `transfer` or equivalent |
| parent_category_id | TEXT NULL | Self-reference to parent category |
| is_builtin | INTEGER NOT NULL DEFAULT 0 | Built-in vs user-managed |
| is_archived | INTEGER NOT NULL DEFAULT 0 | Preserves historical link validity |
| created_at | TEXT NOT NULL | ISO 8601 timestamp |
| updated_at | TEXT NOT NULL | ISO 8601 timestamp |

Rules:
- Category archival does not rewrite historical transactions.
- A category may be parented to another category but must not form cycles.
- Built-in default categories are seeded as required, including expense groups used by the app baseline.

### subcategories

| Column | Type | Notes |
|---|---|---|
| id | TEXT PRIMARY KEY | Stable UUID |
| category_id | TEXT NOT NULL | FK to categories.id |
| name | TEXT NOT NULL | User-facing label |
| is_archived | INTEGER NOT NULL DEFAULT 0 | Preserve history |
| created_at | TEXT NOT NULL | ISO 8601 timestamp |
| updated_at | TEXT NOT NULL | ISO 8601 timestamp |

Rules:
- Optional table if implementation wants a separate subcategory dimension.
- Historical transactions may carry a raw category/subcategory reference without destroying records if the entity is archived.

### payment_methods

| Column | Type | Notes |
|---|---|---|
| id | TEXT PRIMARY KEY | Stable UUID |
| name | TEXT NOT NULL | User-facing payment method label |
| account_id | TEXT NULL | Optional linked account |
| is_active | INTEGER NOT NULL DEFAULT 1 | Active/inactive status |
| is_archived | INTEGER NOT NULL DEFAULT 0 | Preserve historical references |
| created_at | TEXT NOT NULL | ISO 8601 timestamp |
| updated_at | TEXT NOT NULL | ISO 8601 timestamp |

Rules:
- `name` must be unique among active payment methods; archived duplicates may remain for historical references.
- Archive preserves historical references rather than deleting them.
- Transactions reference payment methods by `payment_method_id`, not by free-form text.

### transactions

| Column | Type | Notes |
|---|---|---|
| id | TEXT PRIMARY KEY | Stable UUID |
| kind | TEXT NOT NULL | `income`, `expense`, `transfer` |
| amount_minor | INTEGER NOT NULL | Positive integer paise |
| currency_code | TEXT NOT NULL | ISO 4217 code |
| occurred_at | TEXT NOT NULL | ISO 8601 UTC instant |
| occurred_local_offset_minutes | INTEGER NULL | Captured local offset at occurrence |
| occurred_timezone_id | TEXT NULL | IANA timezone id or equivalent |
| local_date_key | TEXT NOT NULL | YYYY-MM-DD in the stored reporting-local context |
| status | TEXT NOT NULL | `pending`, `successful`, `failed`, `refunded`, `reversed` |
| verification | TEXT NOT NULL | Ledger value must be `confirmed` |
| source | TEXT NOT NULL | `manual_entry`, `notification`, `sms`, `import` |
| account_id | TEXT NULL | FK to accounts.id for income/expense |
| source_account_id | TEXT NULL | FK to accounts.id for transfer |
| destination_account_id | TEXT NULL | FK to accounts.id for transfer |
| category_id | TEXT NULL | FK to categories.id |
| subcategory_id | TEXT NULL | FK to subcategories.id |
| payment_method_id | TEXT NULL | FK to payment_methods.id |
| description | TEXT NULL | User note |
| external_reference | TEXT NULL | Bank or source reference |
| created_at | TEXT NOT NULL | ISO 8601 timestamp |
| updated_at | TEXT NOT NULL | ISO 8601 timestamp |
| deleted_at | TEXT NULL | Soft-delete or explicit deletion marker |
| original_source_id | TEXT NULL | Reference to candidate/import/original event |
| source_metadata_json | TEXT NULL | Minimal source metadata only |

Rules:
- For `income` and `expense`, exactly one of `account_id` must be set; `source_account_id` and `destination_account_id` are null.
- For `transfer`, exactly `source_account_id` and `destination_account_id` must be distinct and non-null; `account_id` is null.
- `amount_minor` is positive; sign is implied by transaction kind and ledger semantics.
- Transfers are stored as a single row and never contribute to income or expense reports.
- `verification` must be `confirmed` for persisted ledger entries. Candidates are stored separately and not inserted into this table until confirmed.
- Historical reports use the stored local reporting context (`local_date_key`, timezone/offset) rather than recalculating old dates from the device's current timezone.

### budgets

| Column | Type | Notes |
|---|---|---|
| id | TEXT PRIMARY KEY | Stable UUID |
| period_type | TEXT NOT NULL | `monthly`, `weekly`, `custom` |
| period_key | TEXT NOT NULL | Month, week, or custom period anchor |
| category_id | TEXT NULL | FK to categories.id for category budget |
| plan_id | TEXT NULL | Shared allocation-plan group for percentage budgets |
| name | TEXT NULL | Optional label |
| budget_mode | TEXT NOT NULL | `fixed_amount`, `allocation_percentage` |
| allocation_group | TEXT NULL | `needs`, `wants`, `savings`, or custom |
| allocation_percentage | INTEGER NULL | Percentage between 1 and 100 |
| limit_minor | INTEGER NULL | Budget ceiling in paise for fixed amount budgets |
| currency_code | TEXT NOT NULL | ISO 4217 code |
| income_base_mode | TEXT NULL | `all_income`, `confirmed_income_only`, `net_monthly_amount`, `custom` |
| alert_threshold_minor | INTEGER NULL | Optional threshold |
| is_active | INTEGER NOT NULL DEFAULT 1 | Active/inactive |
| is_archived | INTEGER NOT NULL DEFAULT 0 | Preserve history |
| created_at | TEXT NOT NULL | ISO 8601 timestamp |
| updated_at | TEXT NOT NULL | ISO 8601 timestamp |

Rules:
- `limit_minor` and `alert_threshold_minor` are in paise.
- `allocation_percentage` must be greater than 0 and at most 100.
- `budget_mode = fixed_amount` requires a non-null `limit_minor`; `budget_mode = allocation_percentage` requires a non-null `allocation_percentage` and may use `plan_id`.
- A percentage-allocation plan for one `plan_id`/period must have active allocations totaling exactly 100.
- Fixed-amount and percentage-allocation modes cannot conflict within the same budget record.
- Actuals are derived from the ledger; they are not stored as mutable counters.

### savings_goals

| Column | Type | Notes |
|---|---|---|
| id | TEXT PRIMARY KEY | Stable UUID |
| name | TEXT NOT NULL | User-facing goal |
| target_minor | INTEGER NOT NULL | Goal target in paise |
| currency_code | TEXT NOT NULL | ISO code |
| deadline_at | TEXT NULL | Optional target date |
| account_id | TEXT NULL | Optional linked account |
| status | TEXT NOT NULL | `active`, `completed`, `archived` |
| created_at | TEXT NOT NULL | ISO 8601 timestamp |
| updated_at | TEXT NOT NULL | ISO 8601 timestamp |

### savings_contributions

| Column | Type | Notes |
|---|---|---|
| id | TEXT PRIMARY KEY | Stable UUID |
| goal_id | TEXT NOT NULL | FK to savings_goals.id |
| transaction_id | TEXT NULL | Optional linked transaction |
| amount_minor | INTEGER NOT NULL | Paise contribution |
| currency_code | TEXT NOT NULL | ISO code |
| occurred_at | TEXT NOT NULL | ISO 8601 timestamp |
| note | TEXT NULL | Optional note |
| created_at | TEXT NOT NULL | ISO 8601 timestamp |

Rules:
- Contributions must not silently create duplicate income when they only earmark already-recorded funds.
- If they are linked to a transaction, the transaction must be explicit and not a duplicate ledger entry.

### recurring_plans

| Column | Type | Notes |
|---|---|---|
| id | TEXT PRIMARY KEY | Stable UUID |
| name | TEXT NOT NULL | Plan label |
| cadence | TEXT NOT NULL | `daily`, `weekly`, `monthly`, `yearly`, custom |
| start_at | TEXT NOT NULL | ISO 8601 timestamp |
| next_due_at | TEXT NOT NULL | ISO 8601 timestamp |
| end_at | TEXT NULL | Optional |
| status | TEXT NOT NULL | `active`, `paused`, `completed`, `archived` |
| template_kind | TEXT NOT NULL | `income`, `expense`, `transfer` |
| template_data_json | TEXT NOT NULL | Normalized template fields |
| created_at | TEXT NOT NULL | ISO 8601 timestamp |
| updated_at | TEXT NOT NULL | ISO 8601 timestamp |

Rules:
- A recurring plan is not proof that a payment occurred.
- Occurrence generation/confirmation remains an open decision and must not be silently treated as payment success.

### detected_transaction_candidates

| Column | Type | Notes |
|---|---|---|
| id | TEXT PRIMARY KEY | Stable UUID |
| source | TEXT NOT NULL | `notification`, `sms`, `import`, `manual_review` |
| source_app | TEXT NULL | App package or source label |
| source_reference | TEXT NULL | External bank/reference id |
| normalized_kind | TEXT NOT NULL | `income`, `expense`, `transfer` |
| amount_minor | INTEGER NOT NULL | Paise |
| currency_code | TEXT NOT NULL | ISO code |
| occurred_at | TEXT NOT NULL | ISO 8601 UTC instant |
| occurred_local_offset_minutes | INTEGER NULL | Captured local offset |
| occurred_timezone_id | TEXT NULL | IANA timezone id |
| local_date_key | TEXT NOT NULL | YYYY-MM-DD in stored local reporting context |
| account_id | TEXT NULL | Optional candidate account |
| category_id | TEXT NULL | Optional candidate category |
| payment_method_id | TEXT NULL | Optional FK to payment_methods.id |
| description | TEXT NULL | User-facing candidate summary |
| confidence | REAL NOT NULL | Normalized confidence score |
| candidate_state | TEXT NOT NULL | `needs_review`, `confirmed`, `ignored`, `duplicate_review_pending` |
| duplicate_of_transaction_id | TEXT NULL | Link to a known ledger record |
| received_at | TEXT NOT NULL | ISO 8601 timestamp |
| raw_metadata_json | TEXT NULL | Minimal metadata only; keep raw data outside the core ledger if unnecessary |
| created_at | TEXT NOT NULL | ISO 8601 timestamp |
| updated_at | TEXT NOT NULL | ISO 8601 timestamp |

Rules:
- Candidate details are not committed to the ledger until the user confirms them.
- Ambiguous or duplicate-prone signals keep `candidate_state = needs_review` or `duplicate_review_pending` until resolved.
- Ignored and reviewed items never affect balances, budgets, or reports.

### candidate_duplicate_links

| Column | Type | Notes |
|---|---|---|
| id | TEXT PRIMARY KEY | Stable UUID |
| candidate_id | TEXT NOT NULL | FK to detected_transaction_candidates.id |
| related_transaction_id | TEXT NULL | FK to transactions.id |
| related_candidate_id | TEXT NULL | FK to another candidate |
| fingerprint_type | TEXT NOT NULL | Example: amount+time+party+reference |
| similarity_score | REAL NOT NULL | Candidate match score |
| created_at | TEXT NOT NULL | ISO 8601 timestamp |

Rules:
- Similarity alone does not delete or confirm a record.
- Uncertain duplicates must go to review and remain visible for manual decision.

### candidate_fingerprints

| Column | Type | Notes |
|---|---|---|
| id | TEXT PRIMARY KEY | Stable UUID |
| candidate_id | TEXT NOT NULL | FK to detected_transaction_candidates.id |
| fingerprint_hash | TEXT NOT NULL | Normalized dedupe hash |
| fingerprint_version | INTEGER NOT NULL DEFAULT 1 | Schema version for rules |
| created_at | TEXT NOT NULL | ISO 8601 timestamp |

Rules:
- Deduplication is based on normalized amounts, direction, time windows, external references, and source metadata, not a single text match.
- Ambiguous matches do not auto-merge; they require review.

### import_batches

| Column | Type | Notes |
|---|---|---|
| id | TEXT PRIMARY KEY | Stable UUID |
| file_name | TEXT NOT NULL | Original file label |
| source_type | TEXT NOT NULL | `csv` or custom |
| status | TEXT NOT NULL | `preview`, `committed`, `failed` |
| created_by | TEXT NULL | User or automation tag |
| created_at | TEXT NOT NULL | ISO 8601 timestamp |
| committed_at | TEXT NULL | ISO 8601 timestamp |

### import_rows

| Column | Type | Notes |
|---|---|---|
| id | TEXT PRIMARY KEY | Stable UUID |
| batch_id | TEXT NOT NULL | FK to import_batches.id |
| row_number | INTEGER NOT NULL | Original CSV row number |
| parsed_kind | TEXT NULL | `income`, `expense`, `transfer` |
| parsed_amount_minor | INTEGER NULL | Paise |
| parsed_currency_code | TEXT NULL | ISO 4217 code |
| parsed_occurred_at | TEXT NULL | ISO 8601 UTC instant |
| parsed_local_offset_minutes | INTEGER NULL | Captured local offset |
| parsed_timezone_id | TEXT NULL | IANA timezone id |
| local_date_key | TEXT NULL | YYYY-MM-DD in captured local reporting context |
| parsed_account_name | TEXT NULL | Candidate account label |
| parsed_category_name | TEXT NULL | Optional |
| parse_errors_json | TEXT NULL | Detailed parse issues |
| duplicate_of_transaction_id | TEXT NULL | Matching ledger record |
| user_decision | TEXT NOT NULL | `pending`, `accepted`, `rejected`, `needs_review`, `duplicate_review_pending` |
| created_at | TEXT NOT NULL | ISO 8601 timestamp |

Rules:
- CSV preview must not mutate the ledger.
- Commit occurs only after explicit confirmation.
- Rejections and skipped rows must remain visible in the import batch.

### user_settings

| Column | Type | Notes |
|---|---|---|
| key | TEXT PRIMARY KEY | Setting key |
| value_json | TEXT NOT NULL | Typed JSON or string value |
| updated_at | TEXT NOT NULL | ISO 8601 timestamp |

Required settings include:
- default_currency
- theme_mode
- app_lock_mode
- lock_timeout_minutes
- notification_tracking_enabled
- sms_tracking_enabled
- automatically_review_candidates
- default_budget_income_base
- alert_threshold_default

### local_backup_metadata

| Column | Type | Notes |
|---|---|---|
| id | TEXT PRIMARY KEY | Stable UUID |
| backup_file_name | TEXT NOT NULL | User-facing backup label |
| created_at | TEXT NOT NULL | ISO 8601 timestamp |
| file_hash | TEXT NOT NULL | Backup integrity hash |
| checksum_algorithm | TEXT NOT NULL | Example `sha256` |
| encrypted | INTEGER NOT NULL DEFAULT 0 | Whether encryption is applied |
| notes | TEXT NULL | User note or metadata |
| valid | INTEGER NOT NULL DEFAULT 0 | Validation status |

Rules:
- Backup must be explicit user action, not an automatic export.
- Backup validation occurs before restore and before trusting the file.

## Required indexes

Recommended indexes for performance and correctness:

- `transactions(occurred_at)`
- `transactions(account_id, occurred_at)`
- `transactions(source_account_id, destination_account_id)`
- `transactions(category_id, occurred_at)`
- `transactions(status, verification)`
- `payment_methods(name, is_archived)`
- `budgets(period_type, period_key, category_id)`
- `budgets(plan_id, period_key, is_active)`
- `savings_contributions(goal_id, occurred_at)`
- `candidate_fingerprints(fingerprint_hash)`
- `candidate_duplicate_links(candidate_id)`
- `import_rows(batch_id, user_decision)`
- `user_settings(updated_at)`

## Constraints and validation rules

- `currency_code` must be valid ISO 4217 and default to `INR` unless a future multi-currency feature is explicitly approved.
- `amount_minor` must be non-negative for all ledger rows; direction is carried by transaction type or transfer leg, not by a negative sign in storage.
- `kind` and `status` must use enumerated valid values only.
- `source_account_id` and `destination_account_id` must not be the same value for a transfer.
- `verification` in `transactions` must be `confirmed` for any persisted ledger row.
- `payment_method_id` must reference an active or archived payment method; historical references remain valid after archive.
- `deleted_at` is not the same as archive state; archived data remains accessible to historical reporting.
- When a category or account is archived, historical rows remain valid and must not be mutated or deleted automatically.
- Budget percentage values must be `> 0` and `<= 100`.
- Allocation percentage totals for one plan/period must equal 100 when active.
- Cannot store both a fixed amount and a percentage-allocation mode in the same budget record.

## Transaction/write boundaries

- Manual transaction writes are one transaction and one ledger commit.
- Transfer writes must be atomic as a single row with distinct source and destination accounts.
- Import preview creates no ledger writes.
- Candidate confirmation creates a ledger transaction using the same transaction schema as manual entry, after validation.
- Backup restore must validate both file integrity and logical data compatibility before replacing records.

## Migration rules

- Use additive, versioned migrations only.
- Preserve all historical rows during schema changes.
- Keep archived rows accessible and avoid destructive archive/deletion migrations unless the user explicitly removes a row.
- New statuses or verification values require migration logic and acceptance validation.
- Any change in meaning for payment status or ledger semantics must be reviewed with the open-decisions document before release.

## Seed data for required default expense categories

The database must seed a default, user-editable set of categories sufficient for personal budgeting. The following is the minimum baseline to support first-release budgeting and reporting:

- Housing
- Utilities
- Groceries
- Dining
- Transport
- Health
- Education
- Entertainment
- Shopping
- Travel
- Insurance
- Savings
- Debt
- Gifts
- Other

This list may be refined by product design, but it must remain local, editable, and historical-safe. Default seed data does not remove the ability for the user to add or archive categories.

## Ledger semantics summary

- Successful income adds to the relevant account balance and contributes to income reports.
- Successful expense subtracts from the relevant account balance and contributes to expense and budget reports.
- Transfers atomically subtract from the source account and add to the destination account, while never entering income or expense reports.
- Pending, failed, refunded, and reversed states are stored explicitly and must be treated consistently with the approved product rule. Exact balance/report impact remains an unresolved business decision until approved.
- Candidate and import-review records never affect balances or reports unless the user explicitly confirms them.
- All totals are derived from transactions. They are never the authoritative state.

## Related documents

- [ARCHITECTURE.md](./ARCHITECTURE.md)
- [04-data-contract.md](./04-data-contract.md)
- [03-local-app-contract.md](./03-local-app-contract.md)
- [06-open-decisions.md](./06-open-decisions.md)
