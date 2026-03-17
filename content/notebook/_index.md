---
title: "Agent Runtime Map"
date: 2026-03-17
draft: false
tags: ["architecture", "agents", "runtime"]
---

## Purpose

This note tracks how the orchestrator routes work across agents.

## Diagram

![Agent runtime map](/images/agent-runtime-map.png)

## Notes

- orchestrator assigns work
- ledger records transitions
- validators gate publish steps
- memory layer prevents relearning

## Command snippets

```bash
hugo server -D
sqlite3 state/jobs.db
