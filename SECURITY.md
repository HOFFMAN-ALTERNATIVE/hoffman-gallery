# Security policy

This repository is a skeleton: it holds structure and interfaces, not a running service.

## Reporting a vulnerability

Use GitHub private vulnerability reporting (Security tab, "Report a vulnerability"). Do not open a public issue for security problems. Expect a first answer within a week.

## Ground rules for changes

- Secrets live in the environment or a secret store, never in the repository. `.env` is ignored, `.env.example` holds names only.
- Every input is validated at the boundary. Authorization is deny by default.
- Services bind to loopback unless they are meant to be public.
- CI runs `scripts/leak-scan.sh` on every push. A hit blocks the merge.
