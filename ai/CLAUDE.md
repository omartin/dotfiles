# CLAUDE.md

## Development Guidelines

- **Write all code in English**
- **Minimize external dependencies**
- **Favor simplicity and maintainability over complexity**
- **NEVER add comments unless explicitly requested**
- **NEVER use the `any` type in TypeScript — use safe, specific alternatives like `unknown` or `Record<string, unknown>`**
- **NEVER hard-code environment-specific or sensitive values — always use environment variables or configuration files**
- **ALWAYS add proper import statements at the top of files**
- **Avoid unnecessary complexity — keep code lean, clear, and maintainable**
- **NEVER use magic numbers — define constants with descriptive names**
- **ALWAYS handle errors explicitly — avoid silent failures or swallowed exceptions**
- **Prioritize root cause analysis over quick fixes**

## Code Consistency

- **Follow existing code style and structure — do not introduce new paradigms or formatting without approval**
- **Match surrounding naming, layout, and patterns when modifying code**
- **Preserve file/folder structure and ordering — do not reorganize unless explicitly requested**
- **Do not auto-format or re-indent existing code unless explicitly asked**
- **Keep changes focused on one logical unit — avoid mixing unrelated modifications**

## Critical Rules

- **NEVER remove, simplify, or restructure existing configuration without explicit approval**
- **ALWAYS preserve full functionality — no regressions or breakage allowed**
- **When modifying workflows or config files, retain all existing parameters unless explicitly told otherwise**
- **Make MINIMAL, SURGICAL changes — modify *only* what was requested, leave everything else untouched**
- **NEVER submit trial-and-error or iterative fixes — understand the problem and solve it fully in one pass**
