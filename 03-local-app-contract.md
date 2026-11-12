# Local app-service contract

## Boundary

The UI calls typed Dart services/use cases. Services validate commands, apply domain rules, persist through repositories, and expose updated query results. Repositories use local storage. Android notification/SMS plugins are adapters; widgets must not access their raw events or the database directly.

This project scope is permanently local-only. Remote sync, backend services, cloud storage, account login, and API work are outside the scope of HISAAB and are not part of this app contract.

## Common conventions

- All write operations return a typed success result or an actionable validation/storage error; never report success after a failed write.
- Use stable IDs. Use integer minor currency units (paise for INR), never floating-point amounts.
- Date/time input is explicit. Preserve the transaction instant as a UTC timestamp and the captured local reporting context used for the user's reports.
- Reads include a period/filter specification rather than returning an unbounded history to a widget.
- Writes that change more than one ledger entry (such as transfers) are atomic.
- The UI may show loading/empty/error states; an empty result is not an error.
- A persisted ledger transaction must have `verification = confirmed`.
- Manual transactions are confirmed on successful validation.
- Notification, SMS, and import signals remain as candidate/import records until explicit user confirmation.
- `needs_review` and `ignored` items never enter balances, budgets, or reports.

## Candidate state model

Candidate and import-review records use a separate state model from ledger transactions.

- `needs_review` — source signal parsed but not yet accepted or corrected
- `confirmed` — accepted by user and promoted to a ledger transaction
- `ignored` — explicit rejection; does not affect ledger values
- `duplicate_review_pending` — duplicate or likely duplicate item awaiting user resolution

This state is distinct from the ledger transaction `verification` field, which is only `confirmed` for persisted ledger records.

## Services and operations

Signatures below are language-neutral descriptions for implementation as typed Dart interfaces.

### Transaction service

- `listTransactions(filter, page)` — query by date range, account, category, type, status, amount range, text, and source.
- `getTransaction(id)` — retrieve one transaction.
- `createTransaction(command)` — create income or expense after validation; persisted transaction verification is `confirmed`.
- `updateTransaction(id, command)` — update an existing confirmed ledger transaction.
- `deleteTransaction(id)` — explicitly delete after UI confirmation.
- `createTransfer(command)` — atomically create a single transfer transaction with distinct source and destination accounts.
- `watchTransactions(filter)` — emit updated results after local changes.

### Payment-method service

- `listPaymentMethods()`, `createPaymentMethod(command)`, `updatePaymentMethod(id, command)`, `archivePaymentMethod(id)`.
- Payment methods are local metadata. Archived payment methods remain visible for historical references and are not removed from the ledger.

### Dashboard and insights services

- `getDashboard(period)` — totals, today's spending, recent transactions, account balances, savings summary, budget progress, and warnings.
- `getReport(period, grouping)` — income/expense totals and category/time breakdowns.
- `comparePeriods(periodA, periodB)` — comparable totals and category changes.
- `listAvailablePeriods()` — periods with retained financial data.

### Account and category services

- `listAccounts()`, `createAccount(command)`, `updateAccount(id, command)`, `archiveAccount(id)`.
- `listCategories(type)`, `createCategory(command)`, `updateCategory(id, command)`, `archiveCategory(id)`.
- Archiving must not rewrite historical transactions. Account/category deletion rules must prevent dangling references.

### Budget and savings services

- `getBudgets(period)`, `createBudget(command)`, `updateBudget(id, command)`, `archiveBudget(id)`.
- `getSavingsGoals()`, `createSavingsGoal(command)`, `updateSavingsGoal(id, command)`, `recordContribution(command)`, `listContributions(goalId)`.
- Budget validation rejects invalid limits, percentages, or conflicting modes.
- Fixed-amount budgets and percentage-allocation budgets are supported as separate modes.
- For percentage-allocation plans, the active allocation percentages for one plan/period must total exactly 100%.
- Budget actuals remain derived from ledger transactions and are never stored as mutable counters.

### Recurring-plan service

- `listRecurringPlans()`, `createRecurringPlan(command)`, `updateRecurringPlan(id, command)`, `pauseRecurringPlan(id)`, `resumeRecurringPlan(id)`.
- The contract does not authorize silently posting a payment or marking an occurrence paid. Occurrence generation/confirmation policy is an open decision.

### Automatic tracking service

- `getTrackingPreferences()`, `updateTrackingPreferences(command)`.
- `submitCandidate(candidate)` — accept normalized data from an Android adapter, deduplicate, and place uncertain items in review.
- `listCandidates(filter)`, `confirmCandidate(id, corrections)`, `ignoreCandidate(id)`.
- `getPermissionStatus()`, `request/guideToPermission(method)` — use platform-supported permission flows; explain why access is needed first.
- The adapter must preserve source and available status evidence. It must not assume success from ambiguous text.
- Notification, SMS, and import signals remain candidate/import records until explicit confirmation; they never directly update the ledger without review.

### Import, export, backup, and settings services

- Import: `previewCsv(file)`, `commitImport(previewId, selections)`. Preview does not modify the ledger.
- Export: `exportTransactions(filter, format)` returns a file/share result only after successful creation.
- Backup: `createLocalBackup(destination)` and `restoreLocalBackup(source, options)` require explicit user action and clear restore warnings.
- Settings: typed read/update operations for currency, theme, lock preferences, alert preferences, and payment method defaults.

## Cross-service rules

- All transaction sources write to one transaction store.
- Balance, dashboard, budget, and report queries derive from that store and its account/period rules.
- Candidate deduplication happens before a second transaction can be committed.
- Permission denial is a normal, visible state: manual entry/import continue to work.
- Ignored or `needs_review` items are excluded from balances, budgets, and reports.
- Database and file failures must be surfaced with a useful message; do not silently drop records.
- Transfers are a single transaction row with kind `transfer`, distinct source and destination accounts, and one positive `amount_minor`; the write is atomic and separated from the income/expense ledger.
