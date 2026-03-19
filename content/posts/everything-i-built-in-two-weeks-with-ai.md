---
title: "Everything I Built in 2.5 Weeks With AI"
date: 2026-03-18 23:00
draft: false
tags: ["ai", "agents", "building", "inventory"]
description: "The full list of what one solo builder shipped in 2.5 weeks with AI tools, a $12 server, and zero computer science background."
---
**Timeline:** March 3 → March 16. ~13 active session days. 23 handoff docs. 251 tests. $12/month server. Half a penny per product.

Two and a half weeks ago i opened my laptop in a hospital room and started experimenting with AI agents. i was trying to automate a small task. Instead i ended up building an orchestration system, a publishing pipeline, and several live projects — all running on a $12 AWS Lightsail server with 2GB RAM and 2 vCPUs. No Kubernetes. No cluster. No expensive AI infrastructure. Just a small Linux box and a lot of software... although i experimented with several platforms before landing here, this has been the sweet spot.

As i started building, this phrase, this AI created philosophy started repeating from GPT:

**Agents generate ideas. Software controls reality.**

It's been 2.5 weeks since i opened my laptop in a hospital room and started learning how to build with AI agents.

Here's what exists.

---
### The numbers

- $0.005 per product through the full pipeline
- 62+ products generated and published
- 251 tests written
- 23 handoff documents across 11 session days
- $12/month server
- Timeline: 2.5 weeks

---

## The Numbers That Surprised Even Me

- **33 products** via v2 pipeline + **~17 products** via dominate-orchestrator + a **12-product viral batch**
- **First live publish milestone:** March 15
- **$0.005 per product** through the full pipeline — half a penny in AI cost per product
- **251 tests written** (settled at 213)
- **23 handoff documents** across 11 session days
- **1,273 Printify blueprints** cached and searchable
- **6 real fonts, 5 design recipes, 10 product templates** — premium typography built in
- **26 Gmail labels** across 18 companies with automated routing
- **Tax spreadsheet** — Google Sheets integration for expense tracking
- **Gumroad product built** — 2 ZIP bundles (Starter $39 / Premium $97), 755-line landing page, blocked only on payment info
- **HashiCorp Vault** — real secret management with scoped tokens, not just env files
- **36% malicious rating** found on skillsmp.com — AMOS stealer distribution identified and flagged
- **Installed LLM Qwen 7B on llama-server

## When you zoom out, the system that emerged looks like this:

**Execution Control**
- Orchestrator
- State machine
- Event-driven execution
- Closed action vocabulary

**Safety**
- Validation layer
- Budget gates
- Token controls
- Human approval gates
- Price band enforcement
- Transparency enforcement (corner-pixel sampling)
- Deterministic validators
- Product binding invariant

**Memory**
- Shared state JSON
- Layered memory (3 tiers with topic-routed loading)
- Research directories
- Handoff documents
- Session logs
- Standing rules
- Prompt caching (stable prefix + dynamic suffix)

**Reliability**
- Idempotency (SHA-256 hash)
- Job ledger
- Model routing
- State machine fixes
- Retry loop (POLISH→REVALIDATE up to 5 cycles)

**Cost Optimization**
- Subagent model routing (haiku/sonnet/opus tiered)
- OpenRouter lowest-cost routing
- $0.005 per product through full pipeline
- Token limits per stage

## The Philosophy

Through all of this, one idea kept coming back:

**Agents generate ideas. Software controls reality.**

**The model should never control the system. The system must control the model.**
