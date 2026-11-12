# HISAAB

HISAAB is an Android-first, offline-first, local-only personal finance application. All core product behavior must work without internet access, without a backend, and without account registration or cloud sync.

## Local-only architecture decision

The product baseline is intentionally local-only:
- financial data remains on the Android device
- local Flutter + Dart services and repositories manage the app logic
- Drift + SQLite is the local storage layer
- Kotlin Android adapters handle notification and SMS inputs only as local candidates
- CSV import/export and local backups are device-local file operations
- no server, REST API, cloud sync, login, or remote database is required for core flows

Any future remote capability must be a separate, explicit feature with its own approval and design. It must not be required for baseline operation.

## Authoritative document map

The following files are the baseline authority for the project:

- [01-product-scope.md](./01-product-scope.md) — product scope, navigation, and product rules.
- [02-user-flows-and-ui-actions.md](./02-user-flows-and-ui-actions.md) — user flows and interactive control inventory.
- [03-local-app-contract.md](./03-local-app-contract.md) — typed local service contract and app behavior.
- [04-data-contract.md](./04-data-contract.md) — domain data invariants and money rules.
- [05-acceptance-checklist.md](./05-acceptance-checklist.md) — acceptance and integration checklist.
- [06-open-decisions.md](./06-open-decisions.md) — unresolved product and implementation decisions.

Supporting architecture and delivery documents:

- [DESIGN.md](./DESIGN.md) — authoritative Flutter design-system and screen implementation guidance.
- [ARCHITECTURE.md](./ARCHITECTURE.md) — system architecture and module boundaries.
- [DATABASE_SCHEMA.md](./DATABASE_SCHEMA.md) — local database schema and invariants.
- [ANDROID_INTEGRATION.md](./ANDROID_INTEGRATION.md) — notification/SMS and Android integration boundaries.
- [SECURITY_AND_PRIVACY.md](./SECURITY_AND_PRIVACY.md) — security, privacy, and backup/restore controls.
- [DEVELOPMENT_ROADMAP.md](./DEVELOPMENT_ROADMAP.md) — ordered phase plan.
- [AGENT_OWNERSHIP.md](./AGENT_OWNERSHIP.md) — team ownership and handoff rules.

## How to use these documents

1. Treat the product and data documents as the baseline source of truth.
2. Build UI, services, database, and Android work against the same local-only contract.
3. Keep interactive controls mapped to a local app-service operation or an explicitly documented UI/platform action.
4. Do not add cloud, account, or backend requirements unless a separate, approved feature is defined outside this baseline.
5. Before release, validate against the acceptance checklist on a clean local database and on a real Android device.

These are implementation documents, not evidence that the app has been implemented or tested.
