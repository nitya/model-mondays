# Model Mondays Maintainer Guidance

`AGENTS.md` is the canonical repository contract. This guide summarizes the human workflow.

## Source of truth

- Structured metadata lives in `data/*.json`.
- Published content lives in `docs/`.
- Public assets live in `docs/assets/`.
- The root `README.md` and `docs/index.md` showcase the active Model Mondays season.
- `docs/foundry-fridays/README.md` is the canonical AMA index.

Do not copy current assets into `data/assets/`; that tree is legacy and will be consolidated separately.

## Model Mondays workflow

1. Confirm the episode number, date, title, host, guests, description, and approved banner.
2. Add `docs/assets/model-mondays/S<season>-E<episode>.png`.
3. Create `docs/model-mondays/YYYY-MM-DD-sNN-eNN.md`.
4. Add/update the matching `data/livestreams.json` record.
5. Update season totals/status in `data/seasons.json`.
6. Update `README.md` and `docs/index.md`.
7. Run validation.

Optional sections such as news, resources, biographies, customer stories, and replay links should appear only when source content is available.

## Foundry Friday workflow

Foundry Fridays is on demand and independent of Model Mondays seasons.

1. Find the largest `number` in `data/amas.json` and allocate the next number.
2. Confirm date, title, speakers, description, status, links, and approved banner.
3. Add `docs/assets/foundry-fridays/AMA-NNN.png`.
4. Create `docs/foundry-fridays/YYYY-MM-DD-ama-NNN.md`.
5. Add the matching `ama-NNN` record to `data/amas.json`.
6. Add the event to `docs/foundry-fridays/README.md` in reverse chronological order.
7. If it is the featured upcoming event, update the AMA spotlight in `README.md`.
8. Run validation.

Do not assign a season/episode pair or related livestream unless the relationship is explicitly provided.

## Speaker workflow

Speaker records use stable kebab-case IDs. Empty optional fields are allowed. Only add biographies, social links, expertise, or profile images supplied by an approved source.

## Validation and review

```bash
bash .github/scripts/validate-repo.sh
mkdocs build --strict
git diff --check
```

Review generated/public changes for:

- dates and numbers matching banners;
- title and name spelling;
- valid relative links;
- no placeholder text;
- no stale season-based AMA links;
- no changes to unrelated dirty files.

## Current state

- Active season: Season 4 — Model Spotlights for Agent Builders.
- Season 4: 12 episodes, August 10-November 2, 2026.
- Foundry Fridays: AMA #001-#049 in one global sequence.
