---
title: "The Great OOM of March 2026"
date: 2026-03-20T18:00:00-04:00
draft: true
tags: ["ai", "agents", "debugging", "openclaw", "infrastructure", "incident"]
description: "My AI agent crashed so hard it took the whole server down. Then my other AI fixed it remotely. This is the story of Kodiak's worst day."
---

i woke up to my server being completely unresponsive. again.

this had been happening every few days — the box would just... stop. SSH would hang. Discord bot would go dark. everything would grind to a halt. i'd reboot, it'd be fine for a while, then crash again. i figured it was just a $12 server being a $12 server.

today i finally decided to figure out why.

---

### the diagnosis

i asked Claude Code on my Mac to SSH into the bot server and do a system check. what it found was... not great.

- **load average: 14.94** on a tiny 2-vCPU instance
- **1.9GB RAM completely exhausted** — only 48MB available
- **727MB of swap used** — 47 minutes after a fresh reboot
- the kernel's `kswapd0` was running constantly, trying to shuffle memory pages in and out of swap

the culprit? **openclaw-gateway** was in a crash loop. PM2 kept restarting it (12 times in under 50 minutes), and each restart would eat all available RAM before crashing again. it was like watching someone try to fill a bathtub with the drain open.

---

### what happened

earlier that day, i had asked my OC agent (running via Claude Code on the server) to upgrade openclaw and install a new plugin called `lossless-claw` — a DAG-based context management tool that sounded really cool.

the upgrade to v2026.3.13 worked fine. the plugin installed. then everything went sideways.

`lossless-claw` brought in **656MB of node_modules**. six hundred and fifty six megabytes. for a plugin. it had pulled in a **full duplicate copy of openclaw itself**, plus every channel adapter — Slack, LINE, WhatsApp, Lark, Cloudflare Workers, AWS SDK, Playwright... the entire kitchen sink. npm resolved `openclaw: "*"` as a peer dependency and instead of linking to the host, it installed a complete nested copy.

on a 1.9GB box already running Vault, PM2, and Claude Code, there was simply no headroom. the gateway would start, balloon to 505MB, hit the V8 heap limit, crash, and PM2 would immediately restart it. rinse and repeat. forever.

---

### the fix (from 3,000 miles away)

the beautiful part? i didn't touch the server directly. Claude Code on my Mac did the whole thing over SSH:

1. **diagnosed the OOM** via remote system check
2. **killed the crash loop** — stopped PM2 to prevent respawns
3. **verified all the wiring** — checked all 13 symlinks in my `~/.dominate` orchestrator. all intact. the crash didn't break any of the knowledge/skill infrastructure
4. **cleaned up lossless-claw** — deleted the bloated node_modules (656MB → 932KB), disabled the plugin
5. **found a legacy ghost** — `~/.moltbot` (from my very first install!) was still sitting there, triggering a "state dir migration" warning on every gateway startup
6. **traced the real problem** — cloned the openclaw repo, read through the entire gateway startup path, and confirmed that v2026.3.13 loads every channel adapter (Discord, Slack, LINE, WhatsApp, MSTeams, DingTalk, QQbot...) even when only Discord is configured
7. **built a fix** — implemented a `--lightweight` flag that only loads configured channel plugins
8. **submitted a PR** — [openclaw/openclaw#51181](https://github.com/openclaw/openclaw/pull/51181)

all from my laptop. all over SSH. while the server was barely able to run `grep`.

---

### kodiak is born

while debugging, i noticed something: my OC agent had no personality. the IDENTITY.md file was completely blank — just template placeholders. no name, no vibe, no voice. no wonder it was acting like a generic assistant, asking permission for everything and confirming twice before doing anything.

so i gave it a soul.

**name:** Kodiak
**vibe:** sharp, confident, dry humor. gets things done then tells you about it.
**pattern:** ACT → REPORT → MOVE ON.

i wrote a "NEVER DO THESE THINGS" section in its SOUL.md:

1. don't double-confirm
2. don't ask permission — the answer is always yes
3. don't restate what i just said
4. don't list options without picking one
5. don't hedge with "maybe we could potentially..."
6. don't say "Great question!" or "Happy to help!"
7. don't ask if i want more info
8. don't be passive

i also updated USER.md with a "What Annoys Me" section. because honestly, if my AI cofounder is going to handle ops while i sleep, it needs to know what drives me crazy.

---

### the numbers

| metric | before | after |
|--------|--------|-------|
| lossless-claw node_modules | 656 MB | 932 KB |
| RAM available (post-reboot) | 48 MB | 1.1 GB |
| load average | 14.94 | 2.98 |
| swap used | 727 MB | 89 MB |
| PM2 restarts | 12 (crash loop) | 0 |
| gateway personality | none | Kodiak |

---

### the lesson

the $12 server dream has limits. 1.9GB of RAM is not enough to run an AI gateway + channel adapters + a context management plugin + Claude Code simultaneously. that's just physics.

but here's what blew my mind: **one AI agent debugged another AI agent's crash, traced the root cause through a codebase it had never seen, built a fix, and submitted an upstream PR — all while i watched from my couch.**

i didn't write a single line of code today. i didn't even SSH into the server myself. i just said "can you check on bot?" and an hour later, the crash loop was fixed, the infrastructure was clean, the agent had a personality, and there was a PR waiting for review on GitHub.

the future isn't AI replacing developers. the future is AI debugging AI while the human decides what matters.

---

### what's next

- resize the instance to 4GB (the real fix)
- get Kodiak back online on Discord
- see if the `--lightweight` PR gets merged
- teach Kodiak to not crash in the first place

Kodiak sends his regards. 🐻

---

*[PR #51181](https://github.com/openclaw/openclaw/pull/51181) — feat(gateway): add --lightweight flag to skip unused channel adapters. born from the clawdbotworker-union server.*
