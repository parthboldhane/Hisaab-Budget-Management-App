# HISAAB architecture

## Decision baseline

HISAAB is an Android-first, offline-first, local-only personal finance app. The authoritative implementation model is:

Flutter + Material 3 UI
→ typed Dart use cases/services
→ repositories
→ Drift + SQLite local database
→ Kotlin Android platform adapters where Flutter APIs are insufficient

This architecture has no required network dependency for core flows. There is no account login, cloud sync, backend service, or remote API in the baseline product. Finance data remains on-device unless the user explicitly creates a local export or backup file.

## Architectural principles

- Local ledger is the source of truth for balances, dashboards, budgets, warnings, and reports.
- Widgets must not access database tables or raw Android events directly.
- Notification/SMS adapters only create normalized candidates. They never silently confirm money movement.
- Candidate records require user review and confirmation when the signal is ambiguous, duplicate-prone, or uncertain.
- CSV import uses preview before commit.
- Android permission denial is a normal application state, not a fatal error.
- Core flows remain functional in airplane mode and without internet access.
- Security and privacy defaults favor local-only storage, data minimization, and explicit user approval for backups or exports.

## Module boundaries

### 1. Presentation layer

Responsible for:
- Material 3 screens, components, forms, dialogs, and navigation states
- Binding user intent to typed service methods
- Displaying loading, empty, validation, and permission-denied states

Not responsible for:
- Direct database access
- Raw Android notification or SMS parsing
- Persisting finance records directly

### 2. Application / use-case layer

Responsible for:
- Typed Dart services and use cases
- Validation, business rules, and transaction orchestration
- Ledger-derived queries for dashboards, budgets, and history
- Candidate deduplication and import preview logic

This layer owns the app's business model and keeps the UI decoupled from persistence details.

### 3. Domain layer

Responsible for:
- Domain entities and value objects
- Rules for income, expense, transfer, budgets, savings goals, recurring plans, and detection candidates
- Invariants such as integer paise storage and local-ledger derived totals

This is where the financial logic is stated clearly, independent from Flutter widgets or Android implementations.

### 4. Data / Drift repositories

Responsible for:
- Drift table definitions and local SQLite persistence
- Repository implementations for accounts, transactions, budgets, savings, imports, settings, and candidates
- Query projections used by the dashboard, reports, and history
- Atomic writes and local transaction boundaries

The ledger, budgets, and reports all derive from the same underlying transaction data. Mutated counters are not treated as source of truth.

### 5. Platform / Android adapters

Responsible for:
- Notification Listener Service lifecycle and permission handling
- Local parsing and normalization of notifications and eligible SMS
- Local conversion of Android signals into candidate records with confidence and status evidence
- Android file import/export and permission UX integration

These adapters do not write confirmed ledger records without review. They only hand off normalized candidates to the app service layer.

### 6. Local file import/export/backup

Responsible for:
- CSV import preview and validation
- User-requested export of local data
- Local backup and restore flows with explicit confirmation and validation
- File integrity checks before restore

This is local file handling only. It is not a networked sync mechanism.

## Runtime flow model

1. User creates or edits finance data through the UI.
2. UI calls typed Dart service methods.
3. Services validate and orchestrate domain rules.
4. Repositories persist changes in the local graph of data.
5. Dashboard, budgets, and reports are recalculated from ledger data rather than mutable totals.
6. Notification or SMS signals are normalized into candidates only.
7. Candidates are deduplicated and routed into a review queue.
8. User confirms, edits then confirms, or ignores the candidate.
9. Only confirmed candidates become normal ledger transactions.

## Acceptance constraints

- A feature should be considered invalid if it requires a remote service for a core flow.
- A feature should be considered invalid if it silently turns an ambiguous source into a confirmed transaction.
- A feature should be considered invalid if a widget reads the database or Android raw event stream directly.
- A feature should be considered invalid if a report depends on stored mutable counters rather than the ledger.

## Related documents

- [README.md](./README.md)
- [01-product-scope.md](./01-product-scope.md)
- [02-user-flows-and-ui-actions.md](./02-user-flows-and-ui-actions.md)
- [03-local-app-contract.md](./03-local-app-contract.md)
- [04-data-contract.md](./04-data-contract.md)
- [05-acceptance-checklist.md](./05-acceptance-checklist.md)
- [06-open-decisions.md](./06-open-decisions.md)
- [DATABASE_SCHEMA.md](./DATABASE_SCHEMA.md)
- [ANDROID_INTEGRATION.md](./ANDROID_INTEGRATION.md)
- [SECURITY_AND_PRIVACY.md](./SECURITY_AND_PRIVACY.md)
- [DEVELOPMENT_ROADMAP.md](./DEVELOPMENT_ROADMAP.md)
- [AGENT_OWNERSHIP.md](./AGENT_OWNERSHIP.md)
