# Development roadmap

This roadmap preserves the required delivery order for the local-only HISAAB product. Each phase has explicit prerequisites, owner, outputs, and acceptance gates.

| Phase | Objective | Prerequisites | Owner | Outputs | Acceptance gate |
|---|---|---|---|---|---|
| 1 | Architecture and documentation finalization | Product scope and local-only decision approved | Codex | Final contracts, architecture baseline, ownership rules, and open decision register | Docs reviewed; no required backend or network dependency is implied |
| 2 | Google Stitch design system and screen prototypes | Phase 1 approved | Stitch/design agent | Design tokens, UI states, component specs, screen flows, empty/loading/error states | Designs reviewed against the user-flow contract and local-only rules |
| 3 | Flutter foundation | Phase 2 design baseline approved | Flutter agent | Project structure, Material 3 shell, navigation, theme, local service scaffolding, app state patterns | App builds with the planned feature module boundaries and no direct DB access from widgets |
| 4 | Local Drift database and financial engine | Phase 3 foundation complete | Flutter agent | Drift schema, repositories, ledger queries, transaction invariants, validation layer | Manual transaction create/edit/delete and transfer semantics pass ledger checks |
| 5 | Accounts, categories, manual transactions, transfers | Phase 4 database and core engine complete | Flutter agent | Account management, default categories, transaction CRUD, transfer atomic action | Account balances and reports are ledger-derived; transfer excludes income/expense totals |
| 6 | Home dashboard | Phase 5 core finance complete | Flutter agent | Balance summary, current month overview, recent transactions, account summary, budget warnings | Dashboard reflects the same ledger rules as reports and budgets |
| 7 | Budgets, savings, recurring plans | Phase 6 dashboard complete | Flutter agent | Period budgets, category budgets, savings goals, contributions, recurring plan scaffolding | Budget logic and savings data align with ledger and the unresolved product decisions |
| 8 | Insights and permanent history | Phase 7 plans complete | Flutter agent | Monthly/yearly reports, comparisons, filters, permanent history, archival-safe records | Historical records remain after month rollover and date filtering remains consistent |
| 9 | CSV import/export and local backup/restore | Phase 8 history complete | Flutter agent | Preview-based import, local export, backup metadata, restore validation | CSV preview is non-mutating and restore requires explicit confirmation |
| 10 | Notification tracking | Phase 9 local import/export complete | Android integration agent | Listener service, permission UX, candidate review queue, notification normalization | Notifications create candidate records only; ambiguous signals stay in review |
| 11 | SMS tracking only after policy eligibility gate | Phase 10 notification tracking complete and eligibility confirmed | Android integration agent | SMS adapter, permission checks, SMS-specific parsing and candidate handling | SMS remains disabled unless Android permission and release eligibility are confirmed |
| 12 | Integration, security, real-device, and release testing | All prior phases complete | Future security/test agent + Android integration agent + Flutter agent | End-to-end validation, security review, Android device validation, release gate | Real-device checks pass; no raw financial data is logged; core features work offline |

## Required ordering note

The roadmap intentionally preserves the local-only architecture and product order. Notification and SMS are optional tracking features. They operate only after local app logic and candidate review workflows are in place and after policy eligibility is confirmed.

## Related documents

- [ARCHITECTURE.md](./ARCHITECTURE.md)
- [01-product-scope.md](./01-product-scope.md)
- [02-user-flows-and-ui-actions.md](./02-user-flows-and-ui-actions.md)
- [03-local-app-contract.md](./03-local-app-contract.md)
- [05-acceptance-checklist.md](./05-acceptance-checklist.md)
- [06-open-decisions.md](./06-open-decisions.md)
