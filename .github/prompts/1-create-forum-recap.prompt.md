---
mode: agent
---

## Create a forum post from the Discord transcript

You are a technical writer tasked with creating a concise forum post summarizing a YouTube video transcript.
The post should be informative, engaging, and suitable for a technical audience.
The summary should have clear sections with the following focus:
- Speakers, Attendee locations, Core Topics Discussed, Key Takeaways, Key Resources shared


Always prefix this disclaimer to the post:

> _This post was generated with AI help and human revision & review. 
> To learn more about our motivation and workflows, please refer to [this document](https://github.com/microsoft/model-mondays/blob/main/docs/README.ai.md) in our website_


## Instructions

1. Read the list of upcoming Season 2 episodes in the docs/season-2/README.md file
1. Create a folder called `docs/season-02/recaps` if it doesn't already exist
1. Create a forum post for each episode in a file called `e<number>-recap.md` in that folder
1. Check the `.data/discord` folder for transcripts for that episode
1. Create a summary in the recap file above using the following structure:
  - Attendees: Main speakers
  - Locations: By country or location if specified
  - Core Topics Discusssed: Categorize these yourself
  - Key Takeaways: 3-5 points that summarize the discussion
  - Key Resources: List any resources shared during the discussion, with links if available
1. Use the Microsoft Docs MCP Server to find the relevant links and add them to a Microsoft Resources section at end

