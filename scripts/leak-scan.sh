#!/usr/bin/env bash
# Fails the build when the tree contains things that must never be committed.
set -euo pipefail
cd "$(dirname "$0")/.."
fail=0
check() { # description, regex
  local out
  out=$(grep -rInE --exclude-dir=.git --exclude-dir=node_modules --exclude='.env.example' --exclude='leak-scan.sh' -e "$2" . || true)
  out=$(echo "$out" | grep -vE '(^|[^0-9.])(127\.0\.0\.1|0\.0\.0\.0)([^0-9.]|$)' || true)
  if [ -n "$out" ]; then echo "LEAK: $1"; echo "$out" | head -5; fail=1; fi
}
check "IPv4 address" '\b(([0-9]{1,3})\.){3}[0-9]{1,3}\b'
check "private key" 'BEGIN ([A-Z]+ )?PRIVATE KEY'
check "chat bot token" '\b[0-9]{8,10}:[A-Za-z0-9_-]{35}\b'
check "GitHub token" '\b(ghp|gho|ghs|github_pat)_[A-Za-z0-9_]{20,}'
check "cloud key" '\b(AKIA[0-9A-Z]{16}|xox[bp]-[0-9A-Za-z-]{10,})'
check "inline credential" '(password|secret|token)[[:space:]]*[:=][[:space:]]*["'"'"'][^"'"'"' ]{8,}["'"'"']'
[ "$fail" -eq 0 ] && echo "leak scan: clean"
exit "$fail"
