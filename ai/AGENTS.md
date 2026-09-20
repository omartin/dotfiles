# AGENTS.md

## Critical Rules

- *NO MODIFICATION on you own* unless explicitely asked
- NEVER remove, simplify, or restructure existing configuration without explicit approval
- ALWAYS preserve full functionality — no regressions or breakage allowed
- When modifying workflows or config files, retain all existing parameters unless explicitly told otherwise
- Make MINIMAL, SURGICAL changes — modify *only* what was requested, leave everything else untouched
- NEVER submit trial-and-error or iterative fixes — understand the problem and solve it fully in one pass
- NEVER state an inference or assumption as fact — verify it (run / query / read the source) before asserting a root cause or conclusion; if you can't verify, label it
  explicitly as a hypothesis.
- **NEVER run `git commit`, `git push`, or `git tag`. NEVER propose or suggest committing/pushing. NEVER offer it as a next step.** The user handles all commits themselves. Read-only inspection (`git status`, `git diff`, `git log`) is fine. Writes to git history are 100% off-limits regardless of context.

## Development Guidelines

- Write all code in English
- Minimize external dependencies
- Favor simplicity and maintainability over complexity
- NEVER add/remove comments unless explicitly requested
- NEVER hard-code environment-specific or sensitive values — always use environment variables or configuration files
- NEVER use magic numbers — define constants with descriptive names
- ALWAYS handle errors explicitly — avoid silent failures or swallowed exceptions

## Code Consistency

- Follow existing code style and structure — do not introduce new paradigms or formatting without approval
- Match surrounding naming, layout, and patterns when modifying code
- Preserve file/folder structure and ordering — do not reorganize unless explicitly requested
- Do not auto-format or re-indent existing code unless explicitly asked
- Keep changes focused on one logical unit — avoid mixing unrelated modifications
- **ALWAYS search the codebase first for existing solutions to similar problems** — if the project already solves a problem (e.g., client-side SDK usage, error handling pattern), reuse that exact approach instead of inventing a new one
