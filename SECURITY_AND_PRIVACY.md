# Security and privacy requirements

## Core baseline

HISAAB is a local-only app. Financial data remains on-device unless the user explicitly creates a local export or backup file. There is no server transmission of transaction data, no analytics pipeline that exposes financial content, and no remote account system. This remains true for notifications, SMS detection, CSV import, and local backups.

## Local security posture

### Device-level protection

- Use Android app lock preferences with PIN or biometric support when available.
- The app should use Android Keystore-backed operations when implemented, where appropriate for local secrets or keys.
- App lock timeout and fallback behavior must be explicit and user-configurable.
- A compromised or unlocked device is outside the app's control; app-level protections must be documented as a defense-in-depth measure, not a guarantee of device safety.

### Data minimization

- Store only the information needed for local transaction management, budgets, reports, and review.
- Avoid storing raw notification or SMS message bodies when normalized metadata is sufficient.
- Keep source metadata for deduplication and review, but avoid retaining non-essential financial content.

### Logging, screenshots, and crash data

- No raw financial content should appear in logs, debug output, screenshots, or crash reports.
- Notification and SMS parsing should avoid storing body text if a normalized, safer record is sufficient.
- If a debug mode is added later, it must be explicitly limited and not expose raw transaction details by default.

## Database encryption

Database encryption is a formal open decision. Until an approved implementation path is selected, the documentation must treat the local database as managed under device security controls and not assume a specific encryption stack.

Any future encryption approach must:
- be explicit and approved before shipping
- not create a remote dependency or sync requirement
- be compatible with local-only backup and restore flows
- be documented in [06-open-decisions.md](./06-open-decisions.md)

## Backup, export, and restore

### Backup/export requirements

- Backup and export must require explicit user action.
- The app must show a privacy warning before creating a local backup or export file.
- Backup files must be treated as sensitive financial data and protected with user-approved safeguards.

### Backup integrity and validation

- Backups must include validation metadata or checksum information.
- Restore must validate file integrity before replacing or merging data.
- The app must reject malformed or incompatible backup files with a clear error.

### Restore behavior

- Restore must never silently overwrite the current database.
- Restore requires user confirmation and a clear description of the consequences.
- The app must require valid input and refuse to restore invalid or incompatible data.

## Threats and mitigations

| Threat | Mitigation |
|---|---|
| Lost phone | Local cryptographic protections if approved; app lock; explicit backup handling; device encryption should be documented by the OS rather than assumed by the app |
| Unwanted notification/SMS access | User opt-in only; explain permission before settings; allow revocation; never silently enable tracking |
| Malicious backup file | Validate checksum and compatibility before restore; refuse malformed or suspicious files; explicit confirmation before overwrite |
| Incorrect duplicate detection | Candidate review queue; confidence and uncertainty handling; no silent merge; manual confirmation before ledger commit |
| Unclear financial status | Keep `status` and `verification` fields explicit; do not assume a candidate is a confirmed transaction |
| Sensitive data in logs | Data minimization; no raw notification/SMS content in logs; safe metadata only |

## Privacy-by-default rules

- No background cloud service may receive or upload financial data.
- Notification/SMS detection is local only and permission-gated.
- CSV import and local export remain device-local unless the user chooses to save or share a file explicitly.
- Manual transaction entry, budgets, reports, and history remain functional without any access to notifications or SMS.

## Related documents

- [ARCHITECTURE.md](./ARCHITECTURE.md)
- [ANDROID_INTEGRATION.md](./ANDROID_INTEGRATION.md)
- [DATABASE_SCHEMA.md](./DATABASE_SCHEMA.md)
- [06-open-decisions.md](./06-open-decisions.md)
- [05-acceptance-checklist.md](./05-acceptance-checklist.md)
