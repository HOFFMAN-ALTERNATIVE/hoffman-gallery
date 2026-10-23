# 0001. Collections are first-class, front end stays static

Status: accepted
Date: 2026-10-23

## Context
A single long page of photos does not scale and hides series. Each series needs its own cover, title, date and count.

## Options
1. One mixed page with filters: simple, poor for series.
2. Collections as entities, each on its own page, static front end over a small JSON API.
3. Full CMS: more than one photographer needs.

## Decision
Option 2.

## Consequences
Series are easy to browse and share. Writes need authentication and upload limits. Revisit if more than one author publishes.
