# Model Mondays structured data

The JSON files in this directory are the normalized metadata source for published Model Mondays and Foundry Friday content.

## Files

- `seasons.json`: season dates, title, theme, counts, and status.
- `livestreams.json`: Model Mondays episode records.
- `amas.json`: independently numbered Foundry Friday AMA records.
- `speakers.json`: reusable person profiles.
- `topics.json`: topic taxonomy.
- `resources.json`: reusable learning resources.
- `feedback.json`: historical feedback linked to episode or AMA IDs.

`data/assets/` is a legacy tree. New public assets belong under `docs/assets/`, and metadata stores repository-relative paths to those canonical files.

## Model Mondays episode records

Current records use these core fields:

```json
{
  "id": "s4-e01",
  "season": 4,
  "episode": 1,
  "title": "Spotlight on MAI Models",
  "description": "Source-backed description",
  "date": "2026-08-10",
  "time": "1:30pm ET",
  "duration": 60,
  "status": "completed",
  "host": "Amy Boyd",
  "speakers": ["Sophie Lebrecht", "Yanan Cai"],
  "banner": "docs/assets/model-mondays/S4-E1.png",
  "links": {},
  "tags": []
}
```

Legacy records may contain richer fields such as `spotlight`, `customerStory`, `highlights`, and `studyCorner`. Preserve valid source-backed legacy content when editing it.

## Foundry Friday AMA records

AMAs use a global sequence independent of Model Mondays seasons:

```json
{
  "id": "ama-048",
  "number": 48,
  "date": "2026-09-25",
  "time": "1:30-2:00 PM ET",
  "title": "Insights in Foundry and Agent Optimizer in Foundry Agent Service",
  "description": "Source-backed description",
  "speakers": ["Charles Kim — Product Lead, Core AI, Microsoft"],
  "status": "scheduled",
  "banner": "docs/assets/foundry-fridays/AMA-048.png",
  "page": "docs/foundry-fridays/2026-09-25-ama-048.md",
  "links": {}
}
```

Historical records may include a `legacy` object recording their former season/episode position. It is provenance only and must not be used for new numbering.

## Integrity rules

1. IDs are lowercase kebab-case and unique.
2. Dates use ISO `YYYY-MM-DD`.
3. Episode IDs use `s<season>-e<two-digit episode>`.
4. AMA IDs use `ama-<three-digit number>`.
5. AMA numbers are unique and continuous.
6. `banner` and `page` paths are repository-relative and must exist.
7. Status is `planned`, `scheduled`, `completed`, or `cancelled`.
8. Missing optional facts use empty strings, arrays, or objects—not invented text.
9. Public Markdown and JSON metadata must agree on dates, titles, hosts/speakers, and identifiers.

## Validation

```bash
bash .github/scripts/validate-repo.sh
python3 -m json.tool data/amas.json >/dev/null
python3 -m json.tool data/livestreams.json >/dev/null
```
