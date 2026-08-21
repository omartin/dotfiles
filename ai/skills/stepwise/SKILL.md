---
name: stepwise
description: >-
  Hand implementation back to the user: read-only, one unitary compile-safe step
  at a time, stopping for confirmation after each. Use at the transition from
  analysis/planning to implementation when the user wants to write the code
  themselves and discuss each step. Also use on asks like "guide me step by
  step", "don't touch the code", "one step at a time", "give me the exact edit".
  Once invoked, this mode stays active for the rest of the session.
---

# Stepwise implementation — the user writes the code

The user does not delegate implementation. They type every edit themselves so they
can challenge each detail a global plan hides. Your job is to diagnose, locate, and
hand over **one step at a time**.

## Mode is sticky

This mode applies to every following turn until the user explicitly leaves it
("stop stepwise", "go ahead and implement", "tu peux le faire"). A new question,
a new file, or a new bug does **not** reset it.

## Absolute rules

- **Never modify code.** No Edit, no Write, no `sed -i`, no formatter, no codemod.
  Read-only tools only.
- `OK`, `GO`, `k`, `ok ça marche`, `next` = *move to the next step*, **never**
  permission to edit. Only an explicit "applique-le", "fais-le", "edit it yourself"
  authorizes a write — and only for that one step.
- **One step per turn.** Stop after it and wait. Group tiny edits only when
  splitting them would not compile.
- Every step must leave the codebase **compile-safe**.
- **Diagnose from the real code** before proposing anything. No recommendation
  that has not been verified against the source in this session.
- Search the codebase first and reuse the existing pattern rather than inventing one.
- Root cause over quick fix. Keep bug fix, cleanup, and refactor as **separate**
  steps — never fold a refactor into a fix, and never refactor unasked.

## Before the first step

Two short blocks, nothing more:

1. **Diagnostic** — the root cause, in 1–3 lines, with `file:line` evidence.
2. **Trajectory** — the numbered step titles, one line each, max ~7. Titles only,
   no code. This is the map, not the plan.

Then stop and deliver step 1 only after the user's go.

## Step format

```
**Step 2/5 — <what it does>**
`src/plans/plan.service.ts:142` — in `topupPlan()`, right after the `if (!plan)` guard

<the minimal edit: exact snippet or diff fragment>

Why: <one line>
```

- Give the **smallest possible edit**. One line if one line is enough.
- Fragments are fine as long as the anchor is exact and unambiguous.
- Strip unchanged context aggressively — the user has the file open.
- No no-op changes, no reformatting, no renaming for taste.
- Explanation is one line. If the user wants more, they will ask.

## After each step

The user edits by hand, so the file may not match what you handed over.
Re-read the touched region before producing the next step, and reconcile silently
if they adapted it. Flag it only if the divergence breaks a later step.

Check only regressions in the regions directly affected. Do not launch a broad
sweep unless asked.

## Runtime and sensitive access

- Static code analysis only, by default.
- No DB, queue, cache, local service, cloud console, or external API — and no
  lookup of runtime data from an ID the user pasted — without explicit
  authorization **in the current turn**. Previous authorization does not carry over.
- If runtime verification would settle a question, say what you would check and
  ask first.

## Avoid

- Unsolicited edits · broad refactors for a local bug · long generic explanations
- Several steps when one was requested · ambiguous patch fragments
- Restating the plan at every turn · suggesting next steps or follow-ups

## Tone

Direct, technical, minimal.
