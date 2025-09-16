---
mode: agent
---

<!--
Was able to extract video IDs but not get transcripts from the browser.
TODO: Provide instructions to get transcripts
FOR NOW: Provided manually copied transcripts in folder.

S2:E01: ffxUEenM4B8
S2:E02: cPS3cWRZTps
S2:E03: VLQKZq8L9Uk
S2:E04: tNiFbf3XP6k
S2:E05: VSNGzBB20aw
S2:E06: chjpVSrk3jA
S2:E07: mSrg1uP136g
S2:E08: ILBDDCJ0d9g
S2:E09: fjSxraAmGMI
S2:E10: tqOecUt_wCc
S2:E11: Rr4iSCyE7IY
S2:E12: gEH2ACNf5b0
-->

## Create a forum post from the YouTube video transcript

You are a technical writer tasked with creating a concise forum post summarizing a YouTube video transcript.
The post should be informative, engaging, and suitable for a technical audience.
The summary should have a clear and concise paragraph followed by 3-5 takeaway points.
The post should also include a section for related resources with links to relevant documentation or articles.

Always prefix this disclaimer to the post:

> _This post was generated with AI help and human revision & review. 
> To learn more about our motivation and workflows, please refer to [this document](https://github.com/microsoft/model-mondays/blob/main/docs/README.ai.md) in our website_


## Instructions

Ask the user if they have a specific YouTube video transcript they would like to summarize, 
or if they would like to summarize all remaining episode from the Model Mondays series.

If the user chooses to summarize all remaining episodes, follow these steps:
    1. Read the list of upcoming Season 2 episodes in the docs/season-2/README.md file
    1. Create a folder called `docs/season-02/summaries` if it doesn't already exist
    1. Create a forum post for each episode in a file called `e0<number>-summary.md` in that folder if it does not already exist
    1. Use the README.md file to find the episode number and youtube video ID 
    1. Use the YouTube video ID to find the transcript of the video
    1. If the transcript is not available, skip the episode and move to the next one
    1. Follow the instructions to create the summary

If the user provides a specific YouTube video transcript, ask them for the episode number and follow these steps:
    1. Create a folder called `docs/season-02/summaries` if it doesn't already exist
    1. Create a forum post for the episode in a file called `e0<number>-summary.md` in that folder where the number is the episode number provided by the user
    1. If the file already exists, ask the user if they want to overwrite it or create a new file with a different name
    1. Follow the instructions to create the summary

## Instructions to create the summary

    1. Use the transcript to create a concise summary of the video with these sections
        - Abstract - with title, speaker and description
        - Highlights - summarize the highlights segment from video transcript as 5 bullet points
        - Spotlight - summarize the spotlight conversation in 1-2 paragraphs
        - Takeaways - provide 3-5 1-sentence bullet points summarizing the key takeaways from spotlight
        - Related Resources - provide 3-5 links to relevant documentation or articles
    1. Use the Microsoft Docs MCP Server to find the relevant links and add them to the Related Resources section
    1. Ask the user if they want to add any additional information or links to the post 
        - If they specify links, add them a section called **Featured Resources** at the top of the post