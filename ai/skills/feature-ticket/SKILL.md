---
name: feature-ticket
description: >-
  Qualify a feature/evolution that was discussed and validated in a Slack
  thread, then create the matching ticket in Kolet's Notion "Sprint planning"
  database. Use when the user pastes a Slack link and asks to create a
  feature/evolution ticket. Unlike bug-ticket, the goal is to record a
  decision that was already made — what will be built and why — not to stay
  neutral between competing hypotheses.
---

# Create a feature ticket (Slack → Notion)

From a Slack link pasted by the user, read the thread, extract the
**validated decision**, and create the ticket directly in Notion.

## Guiding principle

The ticket exists to **hand off a decision**, not to reopen the discussion.

- The thread already converged on a solution. State that solution as the
  plan of record — precisely, and prescriptively (unlike a bug ticket, being
  prescriptive here is the point).
- Distinguish the **need** (why this evolution matters, the problem/opportunity
  that started the discussion) from the **validated solution** (what was
  actually decided). Both go in the ticket, clearly separated.
- Identify who **validated** the decision (gave the final go) and name them.
  If several options were discussed, briefly record which were discarded and
  why — enough to stop the same debate from restarting, not a full replay of
  the thread.
- Ignore thread coordination / social noise (who cc'd or tagged whom, "let's
  sync tomorrow", scheduling) and how the request surfaced (which tool routed
  it, who forwarded it). Keep only what helps someone build the thing.
- If the thread only contains a proposal with **no clear validation** (no one
  said yes/go/OK/👍 or equivalent), stop and tell the user instead of creating
  the ticket — do not guess that silence means approval.
- Write the **whole ticket** (title + body) in **English**, even when the
  Slack thread is in another language — translate as needed.
- **Stay synthetic. No filler.** Every sentence must add information a
  developer needs. Paraphrase decisions and rationale in your own words —
  never lift a verbatim quote from the thread, no matter how colorful; a
  quote is color, not information, and colorful phrasing reads as sloppy in
  a ticket. A section earns its place only if it says something the other
  sections don't already cover — restating the same decision under a new
  heading (e.g. an "in scope" bullet that just repeats the validated
  solution) is filler, not synthesis. When in doubt, cut the sentence.

## Steps

### 1. Read the Slack thread

The user pastes a Slack permalink. Parse it:

- Format: `https://<workspace>.slack.com/archives/<CHANNEL_ID>/p<DIGITS>` with an
  optional `?thread_ts=<ts>&cid=<CHANNEL_ID>`.
- `channel_id` = segment after `/archives/` (starts with `C`, `G` or `D`).
- `message_ts` = the digits after `p`, with a dot inserted 6 digits from the end:
  `p1699999999000200` → `1699999999.000200`.
- If `?thread_ts=` is present, use that value as `message_ts` (the thread root).

Read the whole thread with `slack_read_thread` (channel_id + message_ts). To find a
thread by content, use `slack_search_public` with `is:thread`.

### 2. Qualify

- Identify the **need**: the problem or opportunity that triggered the
  discussion, and who raised it.
- Identify the **validated solution**: what will be built, described
  precisely enough that a developer can start from it without re-reading the
  thread.
- Identify **who validated it** (and when, if useful) — this is what makes it
  a feature ticket rather than a loose idea. If validation is missing or
  ambiguous, stop and ask the user rather than assuming.
- Note any **alternatives discussed and discarded**, briefly, with the reason
  — only if that discussion actually happened and adds value.
- Note a **scope boundary** only when the thread rules out something a
  reader would otherwise plausibly assume is included (e.g. an obvious
  adjacent case explicitly deferred to later). Do not manufacture "in scope"
  / "out of scope" bullets that just restate the validated solution or the
  discarded alternatives — those already cover it.
- Capture useful links posted in the thread — Figma mockups, related tickets,
  Intercom/CS references if relevant.
- Identify the **scope tag** for the title: the board tags tickets with
  whatever bracketed label best places them — could be a platform, a
  functional domain, a partner/brand, or nothing at all when none fits.
  Don't invent a taxonomy or reuse a fixed list from memory — the set of
  tags in use evolves, so always derive it live: query existing `Name`
  values in the data source (step 3) and match whichever precedent fits
  this ticket; leave the title untagged if nothing does.
  A tag spanning more than one thing (e.g. covering two platforms) means
  the validated solution actually touches all of them — check that against
  what you wrote in "Validated solution", don't reach for the broader tag
  as a safe-sounding default when only one is actually affected.

### 3. Resolve Notion fields

- **Next sprint**: fetch the data source (`collection://1762ab24-9563-8160-a2f5-000b4a691546`),
  read the `Sprint` options (each name contains a `DD/MM/YYYY` date), pick the one
  whose date is the **nearest strictly after today**.
- **Objective**: unlike bugs (always `RUN`), a feature can serve `Partners`,
  `Growth`, or `RUN` — infer the best fit from the discussion. If it's
  genuinely unclear, ask the user rather than defaulting.
- **Raised by**: resolve the person who expressed the need to a Notion user
  via `notion-get-users` (query on their name). If no match, leave it empty
  and name them in the body instead.
- **Title tag precedent**: query recent `Name` values from the same data
  source (e.g. `SELECT "Name" FROM "collection://1762ab24-9563-8160-a2f5-000b4a691546" ORDER BY createdTime DESC LIMIT 150`)
  to see the bracketed tags actually in use, and pick from that precedent per
  step 2 rather than guessing a new one.

### 4. Create the ticket directly

`notion-create-pages` with `parent: { type: "data_source_id", data_source_id: "1762ab24-9563-8160-a2f5-000b4a691546" }`.

- **Title tag**: use the bracketed tag identified in step 2/3 (platform,
  domain, or partner — whatever matches board precedent), or no tag if
  nothing fits. Never `[Feature]` — that says nothing about where it lands.
- **Icon**: pick a single emoji that fits *what the feature actually is*
  (e.g. 💳 for a payment change, 🔔 for notifications, 🔍 for search,
  🗺️ for a map feature) — not a fixed placeholder. Favor something a
  developer scanning the sprint board would recognize at a glance.

- **Title**: name the change itself in one short phrase (~8 words) — not the
  backstory that led to it. Pick one framing (the problem it fixes, or the
  thing being built) and state it once; don't concatenate both into a long
  compound title (e.g. "Disable custom referral aliases", not "Referral code
  renamed to impersonate partner brand (OMIO2GB) - killing custom referral
  vouchers"). The full story belongs in the `Need` section, not the title.

Properties (SQLite values — person/multi-select fields are JSON strings):

| Property | Value |
|---|---|
| `Name` | `[<tag>] <short summary of what will be built>` (tag omitted if none fits) |
| `Status` | `To-do` |
| `Lead` | `["25bd872b-594c-8186-a84b-0002bf987d0c"]` (me, Olivier) |
| `Sprint` | exact option name of the next sprint (see step 3) |
| `Objective` | `["<Partners\|Growth\|RUN>"]` per step 3 |
| `Raised by` | `["<user_id>"]` if resolved, otherwise omit |
| `Link` | Slack permalink |

Body (`content`, Notion Markdown), concise:

```markdown
## Need
The problem or opportunity that triggered this — factual, no solution talk.
2-4 sentences; only the facts that justify the decision below.

## Validated solution
What will be built, described precisely. State it as the plan of record.
One line: "Validated by <name>" plus their reason paraphrased in a few words
— not a quote, not their exact phrasing.

## Alternatives considered
Options raised and discarded, with why, one line each. Omit this section
entirely if none were discussed.

## Scope
Only boundaries that aren't obvious from the two sections above (see
guiding principle). Omit this section entirely if there's nothing like that.

## Links
Figma, related tickets, Slack thread.
```

### 5. Return the link

Return the Notion URL of the created ticket.
