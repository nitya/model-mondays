# Using AI For Content Authoring

You may see the following disclaimer in specific content items for this series. This includes blog posts and AMA recaps. 

> _This post was generated with AI help and human revision & review. To learn more about our motivation and workflows, please refer to [this document](https://github.com/microsoft/model-mondays/blob/main/docs/README.ai.md) in our website_

The document linked above is _this one_.


## Why This Document?

AI is playing a growing role in content creation and code generation workflows across the industry. We want to explore AI from two perspectives - (a) as a productivity tool that can help us automate the repetitive or boilerplate tasks, and (b) as a research tool that can help us quickly collect and organize relevant information with the use of curated prompts and relevant tools.

We know this is a fast-evolving space so we want to approach this with two goals in mind:

|Goal|Description|
|-----|-----------|
|Transparency| We want to be responsible in our use of AI and ensure that our readers know when, why, and how, it is used in generating the content they read.|
|Experimentation| We want to share our own experiments and process with the community so they can potentially learn from our experience and adapt them to their own needs if useful.|
||

Using AI for content creation can be as simple as _crafting the right prompt_ for an AI model to execute. In our case, we want to focus on using a specific set of tools that can allow others to _reproduce_ and adapt our process, for their own needs.

1. We will use [GitHub Copilot in Visual Studio Code](https://code.visualstudio.com/docs/copilot/overview) as the primary interface. This lets us conduct all our experiments within the same IDE that we use to maintain the Model Mondays repository.
1. We will use [Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) for automating tasks that require changes to be made to files or content in the repository. For instance, this allows us to generate _boilerplate_ drafts from a template.
1. We will use [MCP Servers](https://code.visualstudio.com/mcp) to ground our models in relevant context sources where possible. This allows us to ensure _correctness_ of content created by requiring it to provide citations used for generation.

From a _content creation_ perspective, we want to operate with these guiding principles in mind:

| |Description|
|-----|---------|
| Consistency | This is a weekly series. We want each post to have a familiar structure and flow to users can navigate it easily. And help support search & discovery with standard metadata.|
| Quality | This is a technical series. We want content to be accurate and relevant to the topic while also reflecting new insights or perspectives that readers may not have considered.|
| Authenticity | This is a learning series. AI does not have the lived experience of human learners. So we want to ensure that personal perspectives & insights are woven seamlessly into content. |
||

Check back regularly to see updates or new experiments we will conduct with AI in this Model Mondays series. IF you have questions or suggestions for improvement, please [post an Issue](https://github.com/microsoft/model-mondays/issues) and let us know. 


<br/> 

## Exercise 1: [This Week in Model Mondays](https://aka.ms/model-mondays/blog)


**Objective:** <br/> 
Assist author(s) in streamlining the creation of weekly recap blog posts in [this series](https://aka.ms/model-mondays/blog).

**Motivation:** <br/> 
[This Week in Model Mondays](https://aka.ms/model-mondays/blog) is a weekly recap of the livestream session that is ideally posted within 48 hours of the live event. This presents two challenges that AI can help with:


| | |
|--------|-------------|
| Topic Complexity | The topics covered in Model Mondays are often complex and require a good understanding of the underlying concepts. AI can help summarize and clarify these topics for easier understanding. |
| Time Pressure | The weekly nature of the blog posts means that there is a tight deadline to meet. AI can assist in drafting content quickly, allowing the team to focus on quality and insights rather than starting from scratch. |
| | |

**Approach:** <br/> 
We are experimenting with AI in an iterative manner. The process is documented below. Note that while AI may be used to assist in content creation or research, the final blog post is only published after human review and revisions by the author(s).

|  | |
|------|-------------|
| [S2:E01](https://techcommunity.microsoft.com/blog/educatordeveloperblog/s2e01-recap-advanced-reasoning-session/4425738) | The first post of the series was written manually with no AI assistance. This helped to establish a baseline template for the components of the blog post. |
| [S2:E02](https://techcommunity.microsoft.com/blog/educatordeveloperblog/model-mondays-s2e2---understanding-model-context-protocol-mcp/4427914) | The second post used [Visual Studio GitHub Copilot Chat](https://code.visualstudio.com/docs/copilot/chat/getting-started-chat) to gain insights into a topic (MCP) by summarizing related resources. Authors manually added select segments into the post. |
| [S2:E03](https://techcommunity.microsoft.com/blog/educatordeveloperblog/s2e3-understanding-slms-and-reasoning-with-mojan-javaheripi/4429758) | The third post used [Visual Studio GitHub Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) to generate a _base draft_ using the prior posts as "templates" and the [Season 2 schedule](./../docs/season-02/README.md) as "context" for filling boilerplate sections (metadata, CTA etc). The AI was instructed to leave some sections completely empty (e.g., highlights) for authors to manually fill in. And it provided default content for others (e.g., spotlights) for authors to review and revise (or replace) to reflect their perspectives. |
| |


<br/> 

## 2. Exercise 2: [Create Forum Posts](https://github.com/orgs/azure-ai-foundry/discussions/categories/ask-me-anything-ama?discussions_q=category%3A%22Ask+Me+Anything+%28AMA%29%22++Foundry+Friday)


**Objective:** <br/> 
Streamline the creation of [Foundry Friday recap posts](https://aka.ms/model-mondays/forum) reflecting the community discussions on [Microsoft Foundry Discord](https://aka.ms/model-mondays/discord) for that week's episode.

**Tasks:** <br/>
The forum posts need to be created **in advance of the Friday AMA** and updated after the session with a summary of the discussion and relevant resources. This gives the community a place to post questions ahead of time (with topic context), and provides a destination for them to revisit the discussion later. Here are the main tasks we want to automate with AI:

| | |
|--------|-------------|
| AMA Announcement | Start a forum post for each week ahead of time, announcing the AMA. This provides the community a place to post questions _ahead_ of the AMA. |
| Spotlight Summary | After the Monday livestream, update the discussion thread with a post containing a link to replay, an optional summary, relevant resources, and links to session slides. |
| AMA Recap | Update the discussion thread after the Friday AMA to summarize the discussion and share relevant insights & resources for community to revisit later |
| | |

**Approach:** <br/> 
For the initial experiment, we will use AI to _create the initial draft_ within the repository - then revise it and publish it manually to the Discussions forum. Here are the tools we'll use, to build the initial draft:

| | |
|--------|-------------|
| Manual Template | The first 3 announcements were generated manually. The "AMA transcript" follow-up for the posts was then added from an AI-generated summary of the Discord chat transcript. |
| [Agent Mode / Announce](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode)| Use scheduled in season-2/README.txt - use a _custom prompt_ to create announcement with resources from docs. _See: `docs/season-2/announcements` folder for results_. Review & Post manually.|
| [Agent Mode / Summary ](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode)| Retrieve the YouTube transcript for the spotlight episode from [the Playlist](https://aka.ms/model-mondays/playlist) - and use a _custom prompt_ to create a standard summary with resources from docs. _See: `docs/season-2/summaries` folder for results_. Review & Post manually.  |
| [Agent Mode / AMA Recap ](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode)| Retrieve the Discord transcript for the spotlight episode from [the Discord Chat](https://aka.ms/model-mondays/discord) - and use a _custom prompt_ to create a standard summary with resources from docs. _See: `docs/season-2/recaps` folder for results_. Review & Post manually.  |
| [Agent Mode / MCP Servers](https://code.visualstudio.com/mcp)| Use GitHub, Hugging Face, and Microsoft MCP servers to retrieve relevant references for the topics covered in either AMA or YouTube transcripts, automatically.  |
| | |

The custom prompts and model choices will be documented by comments in the respective posts found in the _`docsforum/recaps/final`_ folder once generated.