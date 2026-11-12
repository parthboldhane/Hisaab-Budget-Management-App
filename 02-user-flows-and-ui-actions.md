# User flows and UI action map

This map is the checklist for design and frontend implementation. Every visible interactive control should map to one of: navigation, a local app-service action, a platform settings action, or a documented UI-only action.

## Main flows

### Record a transaction

1. User taps **Add income** or **Add expense** (or the floating quick-add button).
2. The form captures amount, account, category, date/time, payment method, and optional note.
3. The app validates the input and saves it locally.
4. Home, account balance, budgets, and insights refresh from the saved ledger.
5. The user can edit or explicitly delete the saved record.

### Transfer between accounts

1. User selects source account, destination account, amount, and date.
2. The app rejects identical source/destination accounts and invalid amounts.
3. The app saves the transfer atomically and updates both derived balances.
4. The transfer is excluded from income and expense totals.

### Review an automatically detected payment

1. User opts into a tracking method and completes the relevant Android permission flow.
2. A local adapter receives a notification or eligible SMS and parses a candidate.
3. The app identifies likely duplicates and uncertain status.
4. The candidate appears in a review queue; it is not silently confirmed when ambiguous.
5. User confirms, edits, or ignores it. Confirmed records enter the same transaction ledger as manual entries.

### Import a statement

1. User selects a CSV file and previews parsed rows.
2. The app shows parse failures, likely duplicates, and proposed transaction types/categories.
3. User confirms the import.
4. The app saves accepted rows locally and reports skipped/failed rows clearly.

### Review history and budgets

1. User selects a month or year from Home/Insights.
2. The app shows records and summaries for the selected period without discarding current data.
3. User creates or edits a budget or savings goal.
4. Progress and alerts are computed from the same ledger and budget configuration.

## Control-to-behavior inventory

| Screen/control | Expected behavior | Contract boundary |
|---|---|---|
| Home: month selector | Change displayed period and reload totals | Dashboard query |
| Home: add income | Open income form; save on confirmation | Transaction service |
| Home: add expense / floating add | Open expense form; save on confirmation | Transaction service |
| Home: recent transaction row | Open transaction detail/edit | Transaction service |
| Home: account overview | Open account list/detail | Account service |
| Home: budget warning | Open relevant budget detail | Budget service |
| Transactions: add | Open transaction form and save | Transaction service |
| Transactions: search/filter/sort | Update visible results; no write | Transaction query |
| Transactions: edit | Validate and update selected record | Transaction service |
| Transactions: delete | Ask for confirmation, then explicitly delete | Transaction service |
| Transactions: recurring plan | Create/edit/pause a plan; explain whether occurrences are generated | Recurring service |
| Transactions: calendar day | Filter records to selected day | Transaction query |
| Transactions: account/category management | Create/edit/archive user-managed item | Account/category service |
| Transactions: transfer | Validate and save an atomic account transfer | Transaction service |
| Insights: period selector | Recompute displayed report for period | Insights service |
| Insights: month comparison | Select two periods and show comparison | Insights service |
| Budgets: 50/30/20 setup | Create/edit percentages; validate total | Budget service |
| Budgets: category limit | Create/edit limit and alert thresholds | Budget service |
| Budgets: savings goal | Create/edit goal and record contributions | Savings service |
| Profile: currency/theme | Save preference and update presentation | Settings service |
| Profile: PIN/biometric | Configure local app lock or open platform authentication | Security service/platform |
| Profile: CSV export | Build and share a user-requested export | Export service/platform share UI |
| Profile: backup/restore | Explicitly create or restore local backup; confirm restore effects | Backup service |
| Profile: tracking toggle | Explain permission, then update preference | Tracking service/platform settings |
| Profile: notification preferences | Save alert preferences | Settings service |
| Profile: about/privacy | Open informational content | UI-only; no backend request |
| Confirm/cancel dialogs | Confirm or abandon the pending action | UI state; write only on confirm |

## Completion rule

Before calling a screen complete, review its controls against this table. Add missing controls here or remove/disable them in the UI with a clear explanation. Do not invent a network call for an action that is local-only.
