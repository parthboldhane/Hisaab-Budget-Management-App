# Android integration boundary

## Scope

Android integration exists only to support local notification and SMS signal capture, permission flows, and file-level interoperability with the app's local ledger. The app never requires a backend or network connection to perform its core financial flows.

## Notification Listener Service

The Android Notification Listener Service is a local adapter. It receives notifications from configured package names and forwards normalized events into the app service layer as candidate records.

Required lifecycle behavior:
- Listen only for app packages enabled in user preferences.
- Start and stop with explicit user settings, not silently after install.
- Translate incoming notifications into a normalized candidate object.
- Maintain minimal source metadata needed for review and deduplication.
- When the Android service is unavailable, the app must degrade gracefully and continue manual tracking without failing core flows.

Required normalized candidate contract:
- `sourceApp` — package or app label
- `amountMinor` — integer paise
- `currencyCode` — ISO 4217 code
- `direction` — `income` or `expense` when inferable
- `statusEvidence` — available evidence about pending/success/failed status
- `occurredAt` — timestamp from the notification or Android event
- `externalReference` — message or sender reference when available
- `partyDetails` — payer/payee, merchant, or counterparty if available
- `confidence` — confidence score from parsing
- `sourceMetadata` — minimal metadata needed for review and audit

Rules:
- Notification parsing must not assume that a notification is a successful payment.
- Ambiguous signals must create `needs_review` candidates, never confirmed transactions.
- Raw notification body retention is discouraged; keep only the smallest necessary normalized data required for review.

## Per-app tracking preferences

The app must have a user preference model for:
- enabled/disabled tracking methods
- allowed notification source apps
- per-app enablement and target behavior
- permission explanation and re-check flow

When a user disables a source app, the adapter must stop processing it locally. This is a user preference, not an app failure.

## Permission UX and Android settings flow

Android permission denial is a normal, visible state.

Required UX behavior:
- Explain why the permission is needed before redirecting to Android Settings.
- Provide a clear explanation that tracking is optional and manual entry/import continue to work without access.
- Show the app's permission state in preferences and allow re-check or revocation.
- Keep all flows local to the device and not dependent on a remote sign-in or account.

## SMS adapter boundary

SMS parsing is an Android adapter boundary with a strict policy gate.

Required rules:
- SMS support is disabled unless the app has confirmed both permission eligibility and distribution policy compliance.
- The app should treat SMS tracking as a gated capability, not a baseline feature.
- The app must not silently parse or store raw financial SMS bodies if the implementation is not approved to handle that data.
- SMS candidate contracts must follow the same candidate-review process as notifications.

The SMS adapter must:
- normalize sender, amount, direction, direction evidence, and external reference
- mark ambiguous messages as `needs_review`
- avoid logging raw financial SMS content
- keep deduplication consistent with notification and import records

## Candidate review queue

All normalized candidates flow into a local review queue before commit.

Review actions:
- Confirm as a transaction
- Edit and then confirm
- Ignore
- Mark duplicate of an existing record

Rules:
- A candidate may only become a ledger transaction after confirmation.
- Duplicate detection across manual records, notification candidates, SMS candidates, and CSV import rows must happen before ledger commit.
- Review queue entries must show confidence, source, and status evidence.
- Uncertain or duplicate-prone items remain visible until the user resolves them.

## Deduplication workflow

The app must deduplicate across:
- manual transaction records
- notification candidates
- SMS candidates
- import preview rows and committed rows

The workflow must compare normalized amount, currency, direction, time window, source app/package, external reference, and account/source context. Similarity alone is not sufficient to auto-merge; if confidence is uncertain, the item must stay in review.

## CSV import and local file imports

CSV import is a user-initiated local file operation. It is not a networked sync or remote ingestion flow.

Required behavior:
- Preview rows before write
- Show parse fails, likely duplicates, and possible account/category matches
- Require explicit confirmation to commit
- Keep import row decisions visible for review
- Preserve imported record provenance and source metadata

## Data minimization and raw content handling

- Do not log raw financial notification body text or SMS content.
- Keep only the minimum normalized metadata needed for review and deduplication.
- Do not capture screenshots or debug output that include raw financial messages.
- Trace and crash logs must exclude raw bank payment details when possible.

## Real-device testing requirements

Testing must include real Android devices, not just emulators.

Required test conditions:
- permission granted
- permission revoked
- airplane mode active
- notification source app disabled
- duplicate payment signals
- ambiguous message parsing
- invalid or partial notification payloads
- SMS feature disabled or not eligible due to policy or configuration

The app must remain usable without notification or SMS permissions. Manual entry, account tracking, budgets, and imports remain available in all cases.

## Related documents

- [ARCHITECTURE.md](./ARCHITECTURE.md)
- [03-local-app-contract.md](./03-local-app-contract.md)
- [04-data-contract.md](./04-data-contract.md)
- [SECURITY_AND_PRIVACY.md](./SECURITY_AND_PRIVACY.md)
- [05-acceptance-checklist.md](./05-acceptance-checklist.md)
