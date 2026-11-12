# HISAAB design specification

## Status and authority

This is the authoritative design handoff for HISAAB. It translates the approved Stitch output into implementation rules for Flutter. The exported Stitch brief at `design/stitch-export/STITCH_PROJECT_BRIEF.md` is visual reference material only; it must not override the local data, architecture, or security contracts.

## Product character

HISAAB is a quiet, private, Android-first personal finance tool. The interface is editorial, calm, and practical: clear money hierarchy, compact grouped lists, intentional whitespace, and restrained emphasis.

Do not use glassmorphism, gradients, blur, neon accents, decorative illustrations, cloud/bank-linking language, AI-processing claims, or hardware-encryption claims.

## Core navigation

The bottom navigation always has five destinations:

1. Home
2. Transactions
3. Insights
4. Budgets
5. Profile

Quick Add is a separate action for income, expense, and transfer. It does not replace a navigation destination.

## Typography and layout

- Use Roboto Flex or Roboto.
- Balance hero: maximum 32sp, bold, tabular numerals.
- Screen title: 24sp, bold.
- Section title: 20sp, semibold.
- Body: 14-16sp.
- Supporting copy: at least 12sp.
- Use an 8dp spacing grid.
- Minimum touch target: 48dp.
- Standard corner radius: 12dp.
- Use 1px dividers and grouped list rows before adding shadows. Never nest cards inside cards.
- Use tabular numerals for monetary values.
- Format INR with Indian grouping, for example `₹1,48,250.00`.

## Color tokens

| Token | Light | Dark | Use |
|---|---|---|---|
| Canvas | #F7F7F3 | #111714 | Page background |
| Surface | #FFFFFF | #18211D | Cards, list groups, app bars |
| Elevated surface | #EFF2ED | #202B25 | Inputs, tracks, selected neutral areas |
| Primary text | #18211D | #E8F0EA | Headings and main values |
| Secondary text | #64706A | #AAB8AF | Supporting labels |
| Divider | #E1E5E0 | #334139 | Hairlines |
| Brand | #176B4A | #67C497 | Primary action/active state |
| Brand pressed | #0D4F36 | #3E9C70 | Pressed primary state |
| Soft brand | #E4F1E9 | #1C3629 | Active/low-priority emphasis |
| Income | #168057 | #6ED09C | Income/credit |
| Expense | #B5473C | #F08A80 | Expense/debit/destructive |
| Transfer/info | #526A8D | #9BB8DD | Transfers and neutral information |
| Warning | #A96812 | #E7B660 | Budget threshold warning |

Color alone must never convey a financial status.

## Approved screen rules

### Home

- Plain available-balance hero, then a compact three-column income/expense/net-saved summary.
- Three labelled actions: Add expense, Add income, Transfer.
- Candidate banner appears only when unresolved candidates exist and says “transactions awaiting review”.
- Monthly spending module includes budget progress and a compact today-spend/daily-pace row.
- Show compact account rows, one savings-goal progress row, and recent transactions.
- Avoid multiple charts and repeated alert cards.

### Transactions

- Search and filters, grouped date-based ledger rows, and visible source/status treatment.
- Use “Transactions” in UI copy, not “Ledger”.
- Transfers must look visually distinct from income and expense.
- CSV export is a local explicit action.

### Insights

- One period control and one primary chart per section.
- Show category allocation, fixed-versus-variable spending, comparisons, and factual observations.
- Never label factual insight generation as AI.

### Budgets and savings

- 50/30/20 is three restrained progress rows.
- Category budgets are simple list rows with spent, limit, progress, and remaining amount.
- Savings goals show target, progress, deadline, and one clear contribution action.
- Use warnings only at actionable thresholds.

### Profile

- Group rows for accounts, categories/subcategories, and payment methods.
- Include theme, notification preferences, biometric lock, hide balances, CSV export, and local backup restore.
- SMS tracking is permission/policy-gated; its disabled state must state that manual entry and CSV import remain available.
- Backup restore and destructive actions require a confirmation state.

## Required states

Every feature design must accommodate loading, empty, validation-error, permission-denied, destructive-confirmation, and success feedback states. Charts must have textual summaries.

## Implementation constraint

The Stitch HTML/Tailwind output is a visual reference only. Flutter implementation must use Material 3, reusable Dart widgets, the approved color tokens, and the local service/data contracts. Do not copy generated HTML, JavaScript, data models, or SQL from Stitch.
