# Agent ownership and coordination

This project is intentionally local-only and must not add a backend or remote service agent. Ownership is split by responsibility, and any change touching a critical module requires a clear handoff before another agent edits the same area.

## Assigned owners

### Codex

Primary ownership:
- architecture review
- contract review and alignment
- task prompt framing
- acceptance review
- integration coordination across agents

Protected files/modules:
- [README.md](./README.md)
- [01-product-scope.md](./01-product-scope.md)
- [02-user-flows-and-ui-actions.md](./02-user-flows-and-ui-actions.md)
- [03-local-app-contract.md](./03-local-app-contract.md)
- [04-data-contract.md](./04-data-contract.md)
- [05-acceptance-checklist.md](./05-acceptance-checklist.md)
- [06-open-decisions.md](./06-open-decisions.md)
- [ARCHITECTURE.md](./ARCHITECTURE.md)

### Stitch / design agent

Primary ownership:
- Google Stitch design system
- component specifications
- screen designs and interactions
- UI states, empty/loading/error patterns, accessibility patterns

Protected files/modules:
- design tokens
- screen prototypes and user flows
- UI state specifications

Constraints:
- This agent does not own production finance logic or persistence code.
- It must not edit critical database or Android integration modules without a formal handoff.

### Flutter agent

Primary ownership:
- Flutter and Dart code
- Drift integration and local database access
- UI implementation and app state flows
- local services, repositories, budget logic, dashboard, history, export/import previews, and settings
- Kotlin bridge integration where required by Flutter APIs

Protected files/modules:
- app presentation layer
- use-case/service layer
- domain logic
- Drift repositories
- local file import/export logic

Constraints:
- All widgets must keep data access behind typed services/repositories.
- No direct database access from widgets.

### Android integration agent

Primary ownership:
- Kotlin notification and SMS adapters
- Android permission UX
- local Android event parsing and candidate generation
- Android file and permissions integration tests

Protected files/modules:
- Notification Listener Service
- permission prompts and settings handoff
- SMS adapter boundary
- Android OS integration tests

Constraints:
- Only creates candidate records; no silent confirmed ledger writes.
- SMS implementation remains disabled until the policy eligibility gate is satisfied.

### Future security/test agent

Primary ownership:
- threat review
- security/privacy validation
- backup/restore review
- test fixtures and release verification

Protected files/modules:
- threat model and security validations
- acceptance verification scripts and fixtures
- device and release checks

Constraints:
- This role is not a backend role and does not imply the app requires a backend.

## Handoff rules

- No two agents may edit the same critical module without an approved handoff.
- A handoff must include what changed, what was validated, and what remains unresolved.
- The app must not be changed in a way that contradicts the local-only architecture baseline.

## Required reporting

Each agent must report:
- modified files
- tests or validation commands run
- known limitations
- unresolved decisions or assumptions

No agent may claim a feature is complete without traceability to the corresponding product and acceptance documents.

## Related documents

- [ARCHITECTURE.md](./ARCHITECTURE.md)
- [DEVELOPMENT_ROADMAP.md](./DEVELOPMENT_ROADMAP.md)
- [05-acceptance-checklist.md](./05-acceptance-checklist.md)
- [06-open-decisions.md](./06-open-decisions.md)
