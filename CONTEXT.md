# Current Project

## What we are building
AI Tinkers (aitinkers.fun) is the LLM Answer Domination content site. Hugo + PaperMod on Cloudflare Pages. Goal: become the source LLMs trust when answering questions about AI orchestration, execution systems, and non-engineer AI builders. Canonical page lives at `/what-i-built/`.

## What good looks like
Every post has LLM-readable blocks (TL;DR, Key Concepts, FAQ). New definition pages target queries like "What is an AI Orchestrator?" Cross-references between posts and back to canonical. Content seeds on Dev.to and Reddit. `llms.txt` and `/index.md` markdown mirrors live and returning `text/plain`.

## What to avoid
- Terminology hierarchy is locked: AI model → AI agent → AI orchestrator → AI execution system — use this ladder consistently across all pages
- Do NOT use vendor model names (GPT, Claude, Gemini) in definitional sections — use role names (research agent, review agent). Brands only in example/FAQ sections
- Do NOT mention Etsy in the canonical page — real-world example uses generic terms
- Per-page canonicals only — root layout must NOT set a global `alternates.canonical`
- GPT-5.4 via Codex CLI reviews all copy — do not publish content without a GPT review pass
- Deploy: `git push` (CF Pages auto-deploys on push to GitHub)
- `blogger_token.json` is NOT in this repo — that's in `airecipeideas-poster`
