# Acceptance and integration checklist

Use this checklist for implementation review. Mark each item only after it has been exercised against the app.

## Contract alignment

- [ ] Every interactive UI control in the implemented screens maps to the action inventory or is documented as UI-only/disabled.
- [ ] Every app-service operation called by the UI exists in the contract and implementation.
- [ ] No mandatory network endpoint is required for a core offline flow.
- [ ] No backend sync or remote service is included in the project scope; local-only behavior remains the default baseline.

## Ledger and candidate separation

- [ ] A persisted ledger transaction has `verification = confirmed`.
- [ ] Manual income/expense/transfer transactions are confirmed only after successful validation.
- [ ] Notification, SMS, and import signals remain candidate/import records until explicit confirmation.
- [ ] `needs_review` and `ignored` items do not affect account balances, budgets, or reports.
- [ ] Candidate state model is implemented as `needs_review`, `confirmed`, `ignored`, and `duplicate_review_pending` where duplicate handling is needed.
- [ ] Candidate rows are separate from ledger transactions and are excluded from financial totals until promoted.

## Ledger correctness

- [ ] Creating income increases the correct derived account balance and income total.
- [ ] Creating an expense decreases the correct derived balance and increases expense/budget actuals.
- [ ] A transfer is stored as one `transfer` transaction with distinct source and destination accounts and does not change income/expense totals.
- [ ] Editing or explicitly deleting a transaction refreshes dashboard, account, budget, and insights results.
- [ ] Invalid amounts, missing accounts, and same-account transfers produce visible validation errors.
- [ ] Historical transactions and budgets remain available after changing to a new month.

## Payment methods and import

- [ ] Payment methods are created via the local payment-method schema and referenced by `payment_method_id` rather than free text.
- [ ] Archived payment methods remain valid for historical references and are not silently deleted from prior transactions.
- [ ] Notification/SMS tracking is opt-in, permission denial is explained, and manual tracking still works.
- [ ] Ambiguous or pending source messages are not represented as confirmed successful payments.
- [ ] Candidates can be reviewed, corrected, confirmed, or ignored.
- [ ] Repeated notification/SMS/import signals for one payment are detected before duplicate ledger entries are committed.
- [ ] CSV import preview does not modify data; commit reports imported, skipped, and failed rows.
- [ ] Tracking/import failures are visible and do not silently discard a transaction.

## Budgets, reports, and settings

- [ ] Fixed-amount category budgets and percentage-allocation budgets are both supported.
- [ ] Allocation budgets include mode, allocation group, allocation percentage, and income-base mode as defined in the contract.
- [ ] Percentage allocations that do not total 100% for one plan/period are rejected or corrected with a clear message.
- [ ] Amount mode and percentage mode do not conflict within the same budget record.
- [ ] Actual budget spending remains ledger-derived rather than stored as a mutable counter.
- [ ] Default 50/30/20 allocation is calculated from the selected income base; its basis is documented.
- [ ] Period/category reports agree with the transaction ledger and documented date rules.
- [ ] Historical reports use the stored local reporting context, not recalculated current-timezone values.
- [ ] Savings contributions do not accidentally create duplicate income.
- [ ] Theme, currency, notification, and security preferences survive app restart as applicable.
- [ ] Export/backup produces a usable file; restore warns about replacement/merge behavior and handles invalid data safely.

## Android and release checks

- [ ] Core manual transaction, history, and budget flows work in airplane mode.
- [ ] Test on a real supported Android device; emulator testing is additional, not a release prerequisite.
- [ ] Notification listener and SMS behavior is tested only with explicit user-granted access.
- [ ] SMS permissions and distribution-policy eligibility are reviewed before enabling/advertising SMS collection.
- [ ] No raw financial messages or unnecessary financial data are logged.
