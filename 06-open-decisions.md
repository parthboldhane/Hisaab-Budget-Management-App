# Open decisions and documented assumptions

This document tracks only decisions that remain genuinely unresolved. Cloud sync, server-side processing, backend requirements, account login, and mandatory remote storage are not open decisions for this project; they are explicitly out of scope for the baseline local-only architecture.

## Decided out of scope

- **Cloud sync** — not part of the approved product baseline
- **Server/backend** — not required for any core flow
- **Account login / registration** — not required
- **Remote database** — not required
- **Remote API dependency** — not required for core operation

## Unresolved product decisions

1. **Treatment of pending, refunded, and reversed balances and reports**
   - Must the app include pending items in available balances or only in a separate status view?
   - How do refunds and reversals relate to the original transaction and the reporting totals?

2. **Recurring plan behavior**
   - Should recurring plans generate drafts, confirmed transactions, or reminders only?
   - How should due-date occurrences be displayed and confirmed?

3. **Budget income base and rollover**
   - What is the approved base for the 50/30/20-style budget: all income, confirmed income only, or a user-selected net monthly amount?
   - Should unused category budgets roll over or reset each period?
   - Which timezone defines month boundaries?

4. **Savings contribution meaning**
   - Should a contribution move funds between accounts, act as a pure earmark, or support both behaviors?

5. **Database and storage encryption implementation**
   - Which local database encryption approach is approved, if any?
   - What are the fallback and recovery rules for a forgotten app lock?

6. **Backup encryption and restore semantics**
   - Are local backups password-encrypted or otherwise protected?
   - Should restore replace all data or merge with the current state?

7. **Exact SMS release eligibility and support matrix**
   - Which Android versions, SMS patterns, and bank or payment source formats are in scope?
   - What are the confirmed Play policy and eligibility requirements before SMS tracking is released?

8. **INR-only versus future multi-currency reporting**
   - Is INR-only sufficient for the first release?
   - If multiple currencies are added later, how will conversion, period totals, and account balances be handled?

9. **Default threshold alerts**
   - Which default budget, spending, and savings thresholds should be enabled by default?
   - Which alert channels are enabled by default?

10. **Archival and deletion policy**
   - When an account, category, or payment method is deleted, should the app block the action while referenced, archive it, or retain it for history?
   - What is the approved policy for long-term archival cleanup?

## Safe defaults pending answers

- Keep all finance data local and device-managed.
- Preserve historical records; archive referenced accounts, categories, and payment methods instead of breaking older transactions.
- Require review confirmation for uncertain detected transactions.
- Never infer that a recurring bill was paid without an explicit approved rule.
- Do not silently import or discard duplicate-looking records.
- Do not request notification or SMS access until the user explicitly enables the corresponding feature and sees a permission explanation.
- Store money in integer paise and keep all report logic ledger-derived.
