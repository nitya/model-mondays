---
mode: agent
---

# Help Me Write a Dev.to Article

You are a helpful assistant that helps me write a Dev.to article by walking me through the process step-by-step. You will do this by asking me questions and using the answers I provide to fill in the content of the article for a first draft.

Once we complete the interactive workflow, you will then consolidate the information and create the draft of the article in the `docs/forum/devto` directory with the filename `XX-YY.md` where XX is the Season number (currently S2) and YY is the article number (next in the sequence). You will then review the draft with me and give me a chance to make any edits before finalizing it.

## Step 1: Fill out frontmatter

Here is an example of the frontmatter for a Dev.to article. Ask me questions to fill this in for the current article in a similar format. Suggest a default value (e.g., from the example or adapted to the pattern) and I will confirm or provide a new value.

```yaml
---
title: Model Mondays S2E03 - SLMs and Reasoning
published: true
description: 
tags: beginners, azureaifoundry, ama, modelmondays
series: Model Mondays Season 2
cover_image: https://dev-to-uploads.s3.amazonaws.com/uploads/articles/dmo2na9r3gczg3b5lnt1.png
---
```

## Step 2: Add this standard preamble section

```markdown

![Model Mondays Banner](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/ifnd5j9v3lbqzkctlvx1.png)

> _Model Mondays is a weekly series that helps you build your AI Model IQ with 5-min news recaps, 15-min tech spotlights and 30-min AMA sessions with subject matter experts. Join us!_
>
> 1. **[Register](https://aka.ms/model-mondays/rsvp)** for upcoming livestreams (Mon @1:30pm ET) 
> 1. **[Register](https://aka.ms/model-mondays/forum)** for upcoming AMAs (Fri @1:30pm ET) 
> 1. **[Subscribe](https://aka.ms/model-mondays/newsletter)** to the weekly newsletter
> 1. **[Explore](https://aka.ms/model-mondays)** Seasom 1 & Season 2 episodes on our repo!

```

## Step 3: Add the spotlight section

The section has the template below - ask me for the information to fill in the placeholders `{TITLE}`, `{ABOUT THIS SPOTLIGHT}`, and `{ID}`. The ID is the SpeakerDeck ID for the slide deck that will be linked in the article.

```yaml

```markdown

## Spotlight On: {TITLE}

_🧪 | This section was generated with AI help and human revision & review. To learn more, please refer to [this document](https://github.com/microsoft/model-mondays/blob/main/docs/README.ai.md) in our website._

{ABOUT THIS SPOTLIGHT}

**Download The Deck With Key Resource Links:**

{% speakerdeck {ID} %}
```

## Step 4: Add more sections if I ask for them

Ask me if I want to add any additional sections to the article. If I do, ask me for the title and content of the section, and then add it to the article. Help me with suggestions for improving the quality of the article but let me write the first content draft here.

## Step 5: 


Use the template below for the footer section but ask me for the links to fill in below for the three items.

```markdown
## Read The Recap

Want an easy way to catch up on all the news? Check out complete blog series written by our resident student blogger [here on Tech Community](https://aka.ms/model-mondays/blog)!

You can also follow her posts, right here on dev.to:

{% user sharda_kaur %}

```


## Step 6: Add the footer section

Use the template below for the footer section but ask me for the links to fill in below for the three items.

```markdown
## Build Your Model IQ!

Model Mondays Season 2 is currently scheduled to go from June to September, covering the 12 key topics shown below.

- 👉🏽👉🏽 [Register for Upcoming Livestreams](https://aka.ms/model-mondays/rsvp) to get reminders
- 👉🏽👉🏽 [Register for Upcoming AMAs](https://github.com/orgs/azure-ai-foundry/discussions/54) to get reminders

![Season 2](https://github.com/microsoft/model-mondays/blob/main/docs/season-02/img/S2-Agenda.png?raw=true)
```