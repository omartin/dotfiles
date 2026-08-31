---
name: incident-analysis
description: >-
  Investigate a suspected attack, fraud, or traffic anomaly on Kolet
  infrastructure using Cloudflare, Datadog and Vercel MCPs. Read-only:
  cross-reference sources, produce non-samplé numbers, distinguish cause
  from consequence, and never make changes without explicit authorization.
  Use when the user pastes logs, screenshots, or asks to investigate
  suspicious traffic, DDoS, scraping, fraud patterns, or a production
  incident.
---

# Incident analysis (attack / fraud / traffic anomaly)

Investigate a suspected incident by cross-referencing Cloudflare, Datadog and
Vercel data. **Read-only** — never modify configuration, DNS, firewall rules,
protection settings, or anything else without explicit user go-ahead. Propose
commands, do not execute mutating ones.

## Guiding principles

- **Facts before hypotheses.** Every claim ("this was a DDoS", "this was a
  scraper", "this bypassed CF") must be backed by a number pulled live from
  a source. If it can't be verified, label it as a hypothesis.
- **Read the handler before asserting endpoint behavior.** Never infer what
  an endpoint does from its path, name, or convention. Before writing "this
  endpoint sends an SMS / charges a card / creates a user / triggers X",
  open the handler in the codebase and read it. This applies to
  recommendations too — e.g., before proposing a rate limit tier on
  `/auth/request-otp` based on "it must send an SMS", read the handler to
  confirm the side-effect. If unable to read the code, mark the claim as an
  **explicit hypothesis** ("hypothesis: name suggests X, to confirm by
  reading the handler") — never as a fact.
- **Single-source analysis lies.** A Vercel log export shows only what hit
  Vercel; a Cloudflare dashboard shows only what CF proxied; Datadog shows
  only what the app instrumented. Cross-reference at least two before
  concluding.
- **Cloudflare dashboard is sampled.** Use the **GraphQL Analytics API**
  (`httpRequests1mGroups`, `httpRequestsAdaptiveGroups`) for exact counts.
  The dashboard's "N requests" is a lower bound.
- **Ask about architecture before flagging internal UAs.** Kolet's own
  services call each other (frontend SSR → API, partner shops SSR → API,
  Google Cloud Tasks, etc.). A spike from an internal-looking User-Agent
  is usually amplification, not an attacker. Confirm with the user before
  labelling internal traffic as suspicious.
- **Separate cause from consequence.** If the frontend gets hammered, the
  API takes the hit too (via SSR). Identify the entry point of the load,
  not just where the errors show up.
- **Time-align in UTC.** Vercel logs, CF logs, Datadog spans — align on the
  same UTC window before comparing.
- **Write in the user's language.** Match the language used by the user
  (French by default in this project, English if the user switches).
  Neutral/professional register, no franglais.

## Read-only mandate

Never call any of these without an explicit user request in the same session:

- Cloudflare: any `POST/PUT/PATCH/DELETE` to `/zones/*`, `/accounts/*`,
  `/user/*`. In particular: DNS record changes, firewall rules, WAF, page
  rules, workers, access policies, cache purge.
- Vercel: `deploy_to_vercel`, `pause_project`, `unpause_project`,
  `update_project_deployment_protection`, `buy_*`, `create_git_project`.
- Datadog: any monitor/dashboard/notebook/workflow write, any
  `_write_api` or config-mutating call.
- Local: git write commands, npm install, file edits outside notes.

If a fix is warranted, **propose the exact command / config change and stop.**
Wait for the user to say go.

## Investigation workflow

### 1. Frame the incident

Get from the user (ask if missing):
- The **time window** in UTC (or convert from local).
- The **hostname(s)** or product surface affected.
- Any starting evidence: log excerpt, screenshot, ticket, Slack link.
- What "wrong" looks like: 500 spike, latency, cost, suspicious content
  requests, unusual sign-ins, refund pattern, coupon abuse, etc.

Do not start querying blindly across hours of data without a window.

### 2. Verify the perimeter before analysing traffic

**Always check DNS proxy status first** when the user reports an incident
on a public hostname. This alone can flip the whole story (grey-cloud
records mean CF sees nothing).

```
cloudflare.request({ method: "GET", path: `/zones`, query: { name: "<apex>" } })
cloudflare.request({ method: "GET", path: `/zones/<zoneId>/dns_records`, query: { name: "<host>" } })
```

Interpret:
- `proxied: true` → CF proxies traffic, WAF/rate-limit apply, CF Analytics
  has full data.
- `proxied: false` ("DNS only", grey cloud) → CF only resolves the name,
  traffic goes straight to the origin (Vercel, GCP, etc.). CF Analytics
  will show **zero** for this host. **Any "CF didn't block" story starts
  here.**

### 3. Get non-sampled Cloudflare numbers

Use GraphQL Analytics via `mcp__cloudflare__execute`. Ask for exact counts,
not dashboard aggregates.

Kolet Cloudflare account id: `0fbf3fd1279e88dacca90fbfd862a293` (already
pre-set in the MCP as `accountId`).

Kolet main zone: `kolet.com` — look it up dynamically via
`/zones?name=kolet.com`, don't hardcode the zone id in the skill.

Useful queries:

```graphql
# Per-minute request + status breakdown on a zone
query {
  viewer {
    zones(filter: { zoneTag: "<zoneId>" }) {
      httpRequests1mGroups(
        limit: 60,
        filter: { datetime_geq: "<startUTC>", datetime_lt: "<endUTC>" },
        orderBy: [datetime_ASC]
      ) {
        dimensions { datetime }
        sum {
          requests
          cachedRequests
          responseStatusMap { edgeResponseStatus requests }
        }
      }
    }
  }
}
```

```graphql
# Top hosts / paths / UAs / methods
query {
  viewer {
    zones(filter: { zoneTag: "<zoneId>" }) {
      httpRequestsAdaptiveGroups(
        limit: 25,
        filter: { datetime_geq: "<startUTC>", datetime_lt: "<endUTC>",
                  clientRequestHTTPHost: "<host>" },
        orderBy: [count_DESC]
      ) {
        count
        dimensions { userAgent clientRequestHTTPMethodName edgeResponseStatus clientRequestPath }
      }
    }
  }
}
```

Filter operators to know:
- exact match: `field: "value"`
- pattern: `field_like: "%value%"`
- range: `datetime_geq`, `datetime_lt`

If a query returns `[]`, that means **zero matching groups** — often a
signal (host not proxied, path never hit, etc.).

### 4. Cross-reference Vercel

If the user provides a Vercel CSV export:
- Parse method, status, host, path, UA, duration, cache status columns.
- Compare **volumes** and **User-Agents** against CF for the same window.
- Discrepancies are meaningful:
  - Vercel sees traffic that CF doesn't → the host is not proxied, or the
    client hits the raw Vercel deployment URL. Check DNS.
  - CF sees more than Vercel → some requests were served from CF cache /
    blocked before reaching origin.

Vercel runtime logs / errors via MCP:
- `mcp__claude_ai_Vercel__get_runtime_logs`
- `mcp__claude_ai_Vercel__get_runtime_errors`
- `mcp__claude_ai_Vercel__list_deployments` (to identify the deployment id
  named in logs)

### 5. Bring Datadog in for the app-side story

Use for what CF/Vercel can't see: business logic errors, DB latency,
downstream service saturation, LLM/API spend, fraud signals in app
events.

Discovery pattern (per MCP instructions):
- `mcp__claude_ai_Datadog__list_datadog_skills` with a fuzzy query.
- `mcp__claude_ai_Datadog__load_datadog_skill` on any clear match, and
  additionally load `datadog/visualizations` when charting is helpful.
- Then use `analyze_datadog_logs`, `search_datadog_logs`,
  `aggregate_spans`, etc.

Kolet services likely relevant: `api`, `web-main`, partner shops, and
whatever else the user names in the incident.

### 6. Distinguish attack patterns

Signals that guide the read:

| Pattern | Signal |
|---|---|
| **DDoS (network)** | Rate spike across many IPs/ASNs, mixed UAs, mixed paths, short duration. Often absorbed by CF; visible in CF `firewallEventsAdaptiveGroups` if rules matched. |
| **DDoS (app-layer / cache-busting)** | Modest req/s but all `MISS`, all forcing SSR, single UA or narrow signature, long-lived 500s at origin. |
| **Scraping (content)** | GET-heavy, deep path coverage, response body actually consumed (byte counts non-zero), throttled or slow pacing. |
| **Enumeration / link check** | HEAD-only or very small GETs across many URLs, exhaustive coverage of a catalogue/sitemap. **HEAD-only ≠ scraping** (no body returned). |
| **Credential stuffing / auth abuse** | POST to `/login`, `/auth/*`, high 401/403 rate, many usernames. |
| **Card testing / payment fraud** | Bursts of small-amount transactions, high decline rate, unusual geo/UA mix. Cross-check with Datadog app logs. |
| **Coupon / referral abuse** | Same coupon or referral code redeemed at anomalous rate; correlate with account creation velocity. |
| **Internal amplification (not an attack)** | Spike from an internal UA (SSR client, background job, retry storm) tied to a real user surge or a deploy. Confirm architecture before flagging. |

### 7. Report as you go

Format is conversational — no imposed template. Guidelines:
- State the finding, then the number that proves it, then the source.
- When numbers disagree between sources, name both and explain the gap.
- If a hypothesis remains unverified, say so — don't dress it as fact.
- End the investigation with:
  - What happened (facts)
  - Why (verified cause, or best hypothesis clearly labelled)
  - Blast radius (who was impacted)
  - Recommended actions (propose, do not execute)

### 8. Recommendations: propose, don't apply

Typical follow-ups after an incident — always as proposals:

- Flip a grey-cloud DNS record to proxied (with SSL mode considerations).
- Add a WAF rate-limit rule on the abused path.
- Restrict Vercel origin access to CF IPs or require a shared secret
  header via `update_project_deployment_protection`.
- Adjust Datadog monitors to catch the pattern earlier.

For each: state exactly what to change, why, and the risk. Then stop.

## Anti-patterns to avoid

- Concluding from Vercel logs alone without checking CF DNS proxy status.
- Using CF dashboard numbers when GraphQL is available.
- Treating an internal service UA as an attacker.
- Recommending a WAF rule for a host that isn't proxied.
- Running mutating MCP calls (DNS change, WAF push, project pause) without
  explicit user go.
- Producing a long summary the user didn't ask for. Match the user's
  requested depth.
- Guessing an endpoint's cost or side-effect from its path (e.g., assuming
  `/auth/request-otp` sends an SMS, or `/checkout` charges a card). Open
  the handler and read the code first.
- Building a recommendation (rate limit tier, WAF rule scope, allowlist)
  on top of an unverified assumption about what an endpoint does.
