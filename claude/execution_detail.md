# CLAUDE.md

## Execution Policy

**≤5 lines of code:** may run inline (e.g. `python3 -c`, `bash -c`, heredoc) — no file needed, no MANIFEST entry.

**>5 lines:** MUST follow the script workflow:
1. Write the script to a file under `./scratch/` (e.g. `./scratch/20260408_parse_csv.py`)
2. `chmod +x` the script
3. Execute via the auto-logging wrapper: `./scratch/run_and_log.sh ./scratch/<script> "<purpose>"`

**Allowed inline commands** (single-line only, no line limit):
- `ls`, `cat`, `head`, `tail`, `grep`, `find`, `wc` — read-only inspection
- `cd`, `pwd`, `which`, `echo`, `date` — trivial utilities
- `git` commands
- `chmod +x`
- Executing a script by path (e.g. `./scratch/foo.sh`)

**Forbidden patterns (for >5-line code):**
- Heredoc (`cat << 'EOF' | python3`)
- Pipe to interpreter (`echo "..." | bash`)
- `python3 -c "..."` or `node -e "..."` with multi-line content
- `bash -c "..."` with multi-line content
- Any inline code block over 5 lines

**Script file naming:** `./scratch/{YYYYMMDD}_{short_description}.{ext}`
Example: `./scratch/20260407_parse_csv.py`

**Never delete scripts in `./scratch/`.** They serve as an audit trail.

## Scratch Directory Setup

If `./scratch/` does not exist, create it with the following structure before writing any scripts:

```
scratch/
├── .gitignore
├── MANIFEST.md
├── run_and_log.sh
└── out/
```

`./scratch/.gitignore` contents:
```
*
```

This ignores everything in `scratch/` including `.gitignore` itself, so nothing is tracked by git.

Claude is responsible for creating `scratch/`, `.gitignore`, `MANIFEST.md`, `run_and_log.sh`, and `out/` on first run if they don't exist.

## Auto-Logging Wrapper

On first session, create `./scratch/run_and_log.sh`:

```bash
#!/usr/bin/env bash
# Usage: ./scratch/run_and_log.sh <script> "<purpose>"
set -uo pipefail
SCRIPT="$1"; PURPOSE="${2:-no description}"
OUTPUT=$("$SCRIPT" 2>&1); RC=$?
STATUS=$( [ $RC -eq 0 ] && echo "✅ success" || echo "❌ failed (exit $RC)" )
BASENAME=$(basename "$SCRIPT")
echo "| $BASENAME | $PURPOSE | $STATUS | $(date +%H:%M) |" >> ./scratch/MANIFEST.md
echo "$OUTPUT"
exit $RC
```

Rules:
- All >5-line scripts MUST be executed via `./scratch/run_and_log.sh`
- Never manually append to MANIFEST — the wrapper is the single writer
- The only allowed manual edit to MANIFEST is marking an old row `🔄 superseded` when a script is rewritten

## Script Manifest

`./scratch/MANIFEST.md` is initialized with this header and updated automatically by `run_and_log.sh`:

```markdown
| File | Purpose | Status | Notes |
|------|---------|--------|-------|
```

Rules:
- One row per execution, append-only (never delete rows)
- Status: `✅ success` / `❌ failed (exit N)` / `🔄 superseded`
- When a script is rewritten, manually mark the old row `🔄 superseded`
- On session start or after compact, `cat ./scratch/MANIFEST.md` to restore context

## Output Management

All script outputs go to `./scratch/out/`, never to `./scratch/` root or the project directory.

**Naming:** `{script_date}_{description}.{ext}`
Example: script `20260408_parse_csv.py` → output `./scratch/out/20260408_revenue.csv`

**Temporary/intermediate files:** use prefix `tmp_` (e.g. `./scratch/out/tmp_merged.json`). Claude may delete `tmp_*` files between steps.

The existing `*` gitignore covers `out/` automatically.