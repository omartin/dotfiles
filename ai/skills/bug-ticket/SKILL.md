---
name: bug-ticket
description: >-
  Qualify a bug reported in a Slack thread and create the matching ticket in
  Kolet's Notion "Sprint planning" database. Use when the user pastes a Slack
  link and asks to create a bug ticket. Separates facts from proposed solutions
  (never prescriptive) so the developer who picks it up can form their own opinion.
---

# Create a bug ticket (Slack → Notion)

From a Slack link pasted by the user, read the thread, extract a **synthetic**
qualification, and create the ticket directly in Notion.

## Guiding principle

The ticket exists for **post-hoc analysis**, not to impose a solution.

- Separate **facts** (what was observed) from **solutions/opinions** raised in the thread.
  A diagnosis of *what went wrong* (e.g. "an in-use eSIM was recycled") is a **fact** —
  put it in _Observed symptom_ and the title, even when someone stated it in the thread.
  Only proposed *remedies/fixes* go in _Proposed leads_.
- Report any proposed solution under _"Proposed leads"_, attributed to who raised it,
  as what was said — not as the decided fix. Do not add disclaimers like
  "(to challenge)" or "not prescriptive": neutral, attributed phrasing is enough.
- Stay synthetic. No filler — only the information needed for analysis.
- Ignore thread coordination / social noise (who cc'd or tagged whom, "will
  check", "let's look tomorrow", scheduling) **and how the report surfaced**
  (which escalation tool/plugin routed it, who forwarded it). Keep only what
  helps understand or resolve the bug. A proposed lead must be a substantive
  technical hypothesis — if there is none, omit the section entirely.
- Write the **whole ticket** (title + body) in **English**, even when the Slack
  thread is in another language — translate as needed.

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

- Identify the **core problem to investigate** — the underlying defect, which is
  often not the most visible symptom (a wrong UI display is usually the
  consequence of a deeper data/process bug). Frame the **title** and _Observed
  symptom_ around this core problem, not the surface artifact.
- Identify the **reporter** (who raised the problem).
- Extract the observed symptom and impact.
- Capture the useful links posted in the thread — especially the **Intercom
  conversation** and the **CS admin user page** (back-office), plus any related ticket.
- Set aside any proposed solution for the "Proposed leads" section.

### 3. Resolve Notion fields

- **Next sprint**: fetch the data source (`collection://1762ab24-9563-8160-a2f5-000b4a691546`),
  read the `Sprint` options (each name contains a `DD/MM/YYYY` date), pick the one
  whose date is the **nearest strictly after today**.
- **Raised by**: resolve the reporter to a Notion user via `notion-get-users`
  (query on their name). If no match, leave it empty and name them in _Context_.

### 4. Create the ticket directly

`notion-create-pages` with `parent: { type: "data_source_id", data_source_id: "1762ab24-9563-8160-a2f5-000b4a691546" }`
and always `icon: "🐛"` on the page.

Properties (SQLite values — person/multi-select fields are JSON strings):

| Property | Value |
|---|---|
| `Name` | `[Bug] <short factual summary>` |
| `Status` | `To-do` |
| `Lead` | `["25bd872b-594c-8186-a84b-0002bf987d0c"]` (me, Olivier) |
| `Sprint` | exact option name of the next sprint (see step 3) |
| `Objective` | `["RUN"]` |
| `Raised by` | `["<user_id>"]` if resolved, otherwise omit |
| `Link` | Slack permalink |

Body (`content`, Notion Markdown), concise:

```markdown
## Observed symptom
Raw facts, what was actually seen.

## Impact
Affected users and scope — factual, no editorializing adjectives.

## Proposed leads
Solutions / hypotheses raised in the thread, attributed to who raised them
(e.g. "Kaustubh suggested …"). Reported neutrally.

## Links
Intercom conversation, CS admin user page, Slack thread, related tickets.
```

### 5. Return the link

Return the Notion URL of the created ticket.
