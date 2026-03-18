---
title: "How I Accidentally Built an AI Orchestrator"
date: 2026-03-17
draft: false
tags: ["ai", "agents", "building", "origin-story"]
description: "I didn't set out to build a system. I set out to stop repeating myself."
---
How I Accidentally Built an AI Orchestrator
By spiz · AI Tinker

I didn't set out to build a system. I set out to stop repeating myself.

But i knew i had to get into the Agentic AI game before the beginning of this boom closed and it normalized with mainstream culture. Openclaw had dropped a week or two ago and my anxiety to learn this was THROUGH THE ROOF! every hour that i didn't dig in i felt exponentially more irrelevant and losing a lot of sleep. It was in the hospital, while i waited for my Moms surgery for cancer to finish, that i finally opened my laptop and started learning. I stayed in the room with her overnight - we both knocked out about 6pm. The next day, i jumped back in by her bed and became instantly obsessed with figuring things out while amazing Nurses and Drs came to check on her. i started with OpenClaw, agonized over where to host it - definitely not on my laptop! Finding the best skills, figuring out which brain to give it, how to make it autonomous in my contained environment... etc. At this point i only had a paid subscription to GPT and used all the other tools for free (Claude, Gemini, Perplexity, Kimi, DeepSeek...etc) i've always had a million ideas and said if i knew how to code, i'd be dangerous... and the time has come. 

Before i realized it, i had installed .pixel-agents, .openclaw, .moltbook, .codex, .copilot, .antigravity and a whole nuch more and each one required some level of setup. you don't just install it and it does these amazing things that you hear about. Every time I opened a new session with an AI agent, it was the same thing. Here's are these skills, here is some knowledge - aka, here is your PHD in xyz, as in, subjects that takes us years to learn and master, all in a dump of resources that you can consume and run with almost immediately. Like Trinity in the Matrix instantly learning how to fly the B-21-2 helicopter. i didn't want to ree-explain here's how the pipeline works. Here's what we decided last time. Here's what broke. Here's what's next. Every. Single. Time.

It was Ground hog day every single session with every single new agent. Or the movie 50 First Dates... um, no.

i learned a little trick on TikTok - Handoff documents... REVOLUTIONARY! So i started having the agent create JSON files that say things like: here's where we left off, here's what matters, don't ask me again. I just wanted continuity. I wanted to sit down and say "CC, do the thing!" and have that actually mean something.

So, i set out to stop repeating myself and to move all of the agents that i install under one main hub. One ring to bind them... i said... can't we just move all the agents under one directory and have them all understand from the same skill and knowledge pool? that was kind of how that prompt went....

AND THEN...

GPT started doing what GPT does. "Let me show you how to structure that." "Want me to set up a config for that?" "Here's how you could route different tasks to different models." And I kept saying yes. Not because I had a grand plan. Because each yes solved the thing that was annoying me right now.

Yes, keep the agents from hallucinating and keep them on topic!
Yes, give the agents a shared state file so they stop losing context.
Yes, optimize token use so the cheapest best agent for the job runs instead of the hard hitter robbing me for a general lookup.
Yes, split the research agent from the builder agent so they stop tripping over each other.
Yes, put rules in one place so I stop copy-pasting them into every prompt.
Yes, add a validation layer so I stop manually checking if the output is garbage.

And then one day I looked at what I had and realized — oh.

This isn't a collection of fixes. This is an architecture. There's a state machine. There's a job ledger. There's model routing. There's cost controls. There's memory layers. There's an orchestrator that isn't an AI — it's just software, doing what software does best: saying no to things that shouldn't happen.

I accidentally built the thing I didn't know I needed.

A former directionless lost kid that roamed the streets and never got a college degree of any level, somehow built a production-grade AI orchestration system on a $10/month server. Because i got tired of repeating myself and wanted all agents under one brain (herding cats), 1 point of contact, and i kept saying yes to the next small fix suggested by GPT.

That's the whole origin story. No bootcamp. No CS degree. No venture funding. Just a single 50 year old woman, some AI tools, and the curiosity, excitement, anticipation and drive to keep going when nothing made sense yet.

This is the first post in a series about building AI agent systems from scratch — the real version, not the tutorial version. The version where things break at 2am and you're Googling "OAuth redirect localhost SSH tunnel" in your pajamas because you haven't left the house, seen any friends or even really talked to your Mom sitting in the same room for the past few weeks. It's literally been wake up, have an hour of reading, daily things, jump on and start building, stop, log into work, log out of work, jump back in to building until 2-3am. Wake up at 6am and do it again.... weekends.... O, they are the sweetest spots! i actually let myself sleep in though because a couple hours of sleep every night for a few weeks... um. but from wake up until 2-3am i'm spending the full day building and i thought that stopping to document the journey was going to be impossible because SO MUCH CHANGED EVEN WITHIN ONE HOUR! But, the AI forced me to do this. And, as the system finally started producing, i started flying with ideas and published 2 clawhub skill - in two hours actually. there is so much to write about but.... this is just a start, but where do i even start - i need my own human handoff document... even then...where do i evn start... all i can say is that i'm starting to dream again after so many broken dreams.

More at aitinkers.fun
