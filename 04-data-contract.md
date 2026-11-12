# Local data contract

Names are conceptual and may be adapted to the chosen local database. Preserve the fields and invariants.

## Money and identifiers

- IDs are stable, opaque identifiers (UUIDs are suitable).
- Store monetary amounts as integer minor units with an ISO 4217 currency code (`INR` by default). Never store money as binary floating point.
- Display formatting is a presentation concern; calculations use stored minor units.

## Transaction

Required conceptual fields:

- `id`
- `kind`: `income`, `expense`, or `transfer`
- `amountMinor` (positive integer) and `currencyCode`
- `occurredAt` as a UTC instant
- `occurredLocalOffsetMinutes` or `occurredTimezoneId`
- `localDateKey` as the captured reporting-local date
- `status`: `pending`, `successful`, `failed`, `refunded`, or `reversed` when known
- `source`: `manual_entry`, `notification`, `sms`, or `import`
- `verification`: `confirmed` for persisted ledger records; non-ledger candidates use a separate candidate state model
- `accountId` for income/expense; `sourceAccountId` and `destinationAccountId` for transfers
- Optional `categoryId`, `subcategoryId`, `paymentMethodId`, `description`, and `externalReference`
- Creation/update timestamps and optional source/deduplication metadata

Rules:

- A persisted ledger transaction must have `verification = confirmed`.
- Manual transactions are confirmed on successful validation.
- Notification, SMS, and import signals remain candidate/import records until explicit confirmation.
- Ignored and needs_review items must never enter the financial balances, budgets, or reports.
- Income/expense has one account; transfer has exactly one row with distinct `sourceAccountId` and `destinationAccountId` and is not included in income/expense totals.
- Keep raw notification/SMS content only if strictly necessary; prefer minimal parsed metadata and avoid retaining message text.
- A duplicate fingerprint may be based on normalized amount, currency, time window, direction, account/source, and external reference. Similarity alone must not silently discard a candidate; uncertain matches go to review.
- User edits must preserve enough source metadata to explain that a record originated from automatic detection/import.
- Historical reports use the stored local reporting context rather than recalculating old dates from the device's current timezone.

## Candidate state model

Candidate and import-review records are not ledger transactions.

- `needs_review` — parsed but pending confirmation or correction
- `confirmed` — accepted by the user and promoted to a ledger transaction
- `ignored` — explicit rejection; no effect on reports or balances
- `duplicate_review_pending` — duplicate or likely duplicate item awaiting user resolution

Persisted ledger transactions must not remain in any of these candidate states; their `verification` must be `confirmed`.

## Account

- `id`, `name`, `kind` (for example cash, bank, wallet, or other), `currencyCode`, optional `openingBalanceMinor`, timestamps, and active/archived state.
- Current balance is derived from opening balance and applicable ledger entries. Transfers subtract from source and add to destination.
- The exact treatment of pending, refunded, and reversed transactions must be consistent across balances and reports (see open decisions).

## Category

- `id`, `name`, transaction kind, optional parent category ID, built-in/user-defined indicator, active/archived state.
- Archiving a category must not remove or reclassify historical transactions.

## Payment method

- `id`, `name`, optional `accountId`, active/archived state, and timestamps.
- Payment methods are local metadata used by ledger transactions through a nullable `paymentMethodId` reference.
- Archived payment methods remain valid for historical references and must not be silently removed from older transactions.
- Name uniqueness must be enforced for active payment methods, with archive preserving historical references rather than destructive removal.

## Budget

- `id`, period, optional category, budget mode, limit amount/currency or allocation percentage, allocation group, income-base mode, alert thresholds, timestamps, and active/archived state.
- Supported modes:
  - `fixed_amount` for category budgets with a specific paise limit
  - `allocation_percentage` for 50/30/20 or custom percentage plans
- Allocation metadata:
  - `allocationGroup` such as `needs`, `wants`, `savings`, or user-defined equivalent
  - `allocationPercentage` integer percentage greater than 0 and at most 100
  - `incomeBaseMode` describing the income basis for the budget calculation
- Constraints:
  - percentage must be greater than 0 and at most 100
  - active allocation percentages for one plan/period must total exactly 100
  - fixed-amount and percentage-allocation modes are mutually exclusive for the same budget
  - actual spending remains derived from the ledger; it is not stored as a mutable counter
- Prevent incompatible duplicate active budgets for the same scope/period unless product rules explicitly allow them.

## Savings goal and contribution

- Goal: `id`, name, target amount/currency, optional deadline, timestamps, active/completed/archived state.
- Contribution: `id`, goal ID, positive amount/currency, date, optional linked account/transaction, and note.
- Adding a contribution must not accidentally count as new income if it merely earmarks already-recorded money.

## Recurring plan

- `id`, template transaction details, cadence, start date, optional end date, next due date, and active/paused state.
- A plan is not evidence that a bill was paid. Do not mark an occurrence successful automatically without an approved product rule.

## Detected candidate / import batch

- Candidate: stable ID, source, parsed transaction fields, available source reference, confidence/review state, duplicate links, and received time.
- Import batch: stable ID, file metadata (not necessarily file contents), preview/commit state, row-level errors, and duplicate matches.
- Candidates and previews are not ledger transactions until user-approved rules allow confirmation/commit.

## Persistence invariants

- Data is local and available without network access.
- Month rollover never purges historical records.
- A confirmed transaction write and related derived queries are consistent after commit.
- Transfer writes are atomic and stored as a single `transfer` row.
- Explicit deletion is distinguishable from automatic month rollover or archival.
- Backup/restore must validate data before replacing existing local records.
- Budget and report totals are always derived from ledger transactions, never stored as authoritative counters.
