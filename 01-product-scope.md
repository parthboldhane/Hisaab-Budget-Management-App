# Product scope

## Product goal

Hisaab is a privacy-focused personal finance and budgeting app for Android. It helps a person record and understand income, expenses, transfers, budgets, and savings, with optional local detection of eligible payment notifications and bank SMS.

## Navigation

1. **Home** — balance and current-period summary.
2. **Transactions** — transaction history and management.
3. **Insights** — analytics and permanent monthly history.
4. **Budgets** — budget plans and savings goals.
5. **Profile** — preferences, data management, and security.

## Feature scope

### Home

- Show total available balance, current-month income and expenses, remaining budget, savings overview, today's spending, recent transactions, and account balances.
- Select a month to inspect that month's summary.
- Offer quick actions to add income or an expense.
- Show budget warnings and spending alerts when the user has enabled them.

### Transactions

- Create, edit, delete, search, and filter income, expense, and transfer records.
- Support accounts, payment methods, categories/subcategories, notes, date/time, and recurring plans.
- Show a calendar and historical transactions.
- Recalculate account balances from the transaction ledger; do not maintain a separately mutated balance that can drift.
- Ship the default expense categories from the supplied requirements and allow user-managed categories.

### Automatic payment tracking and import

- Optionally receive payment notifications through Android Notification Listener access and eligible bank SMS through Android SMS access.
- Normalize supported signals into transaction candidates; do not treat an ambiguous notification/message as proof of a successful payment.
- Let the user enable/disable each tracking method and supported app, review candidates, correct them, or ignore them.
- Import CSV statements with preview, matching, categorization, and duplicate checks before committing records.
- Keep the feature optional. Explain permissions before linking the user to Android settings or requesting them.
- Ensure Android permission and distribution-policy feasibility is confirmed before shipping SMS functionality.

### Insights and history

- Provide daily, weekly, monthly, and yearly summaries, category breakdowns, comparisons, averages, and spending trends.
- Preserve historical transactions, budgets, and savings records across month boundaries.
- Only remove financial records following an explicit user deletion action.

### Budgets and savings

- Support the default 50/30/20 plan and user-customized percentages.
- Support category and time-period budgets, remaining amounts, progress, and configurable threshold alerts.
- Support multiple savings goals with target, deadline, contributions, and progress.

### Profile and app-wide behavior

- Default currency: INR; support theme preferences, PIN/biometric app lock, CSV export, local backup/restore, notification preferences, and management of accounts, categories, and tracking permissions.
- Core manual finance features work offline. No bank connection or server account is required by this baseline.
- Store financial data securely on-device. Exact storage/encryption and backup choices are listed in `06-open-decisions.md`.

## Product invariants

- A new month never removes prior financial history.
- Income increases an account ledger balance; expense decreases it; transfer moves value between accounts without counting as income or expense.
- A detected payment is not silently treated as successful when the source signal is ambiguous.
- Duplicates across notification, SMS, import, and manual entry must be identified before creating a second record.
- Tracking is opt-in and can be disabled or corrected by the user.
- Displayed totals and analytics are derived from the same transaction data and period rules.
