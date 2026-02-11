# Model Mondays S2:E01 – Advanced Reasoning

**Speaker:** Nitya (host), Charmela (co-host), Marlene Mahungami (guest, Developer Advocate, Python team)

## Abstract
Season 2 of Model Mondays kicks off with a deep dive into advanced reasoning models. The session covers the latest updates from Azure AI Foundry, introduces new models and features, and spotlights how reasoning models can be leveraged for high-quality, step-by-step problem solving. Marlene Mahungami demonstrates practical applications of reasoning models using DeepSeek and LangChain, highlighting their strengths, limitations, and best practices for integrating them into real-world AI solutions.

## News Highlights
- Azure AI Foundry now offers a broader range of models, including DeepSeek, XAI, Meta, and Mistral, under Microsoft’s service terms.
- The new Video Playground in Foundry enables prompt-to-video generation with exportable code and enterprise-ready pipelines.
- Model Router allows automatic selection of the best model for a given use case, optimizing for cost and performance.
- Grok 3 and Grok 3 Mini models are now available, offering long context and advanced reasoning capabilities.
- DeepSeek R1-10528 introduces improved reasoning, hallucination blocking, and is ideal for agents and co-pilots.

## Tech Spotlight
Marlene Mahungami presents a hands-on lab demonstrating how to build a deep researcher using reasoning models with LangChain and DeepSeek. She explains that reasoning models, trained with reinforcement learning, provide more detailed and higher-quality outputs than standard chat models. The demo showcases how to separate the model’s thought process (enclosed in <think> tags) from the final user-facing response, and how to customize output formats (e.g., tables, bullet points) via system prompts. Marlene also discusses integrating external tools and context, such as web search, to enhance the model’s knowledge and relevance, and highlights the importance of evaluation and self-reflection in model outputs.

The conversation addresses the trade-offs between different reasoning models (OpenAI, DeepSeek, Grok), considerations for local vs. cloud deployment, and the value of open-source options for privacy and cost savings. The session concludes with a Q&A on evaluation strategies, prompt consistency, and the mechanics of reasoning content in model outputs.

## Takeaways
- Reasoning models deliver higher-quality, step-by-step outputs but may have longer response times.
- Separating the model’s reasoning from the final answer improves user experience and application design.
- Customizing prompts and output formats enables tailored, production-ready solutions.
- Integrating external data sources enhances the relevance and accuracy of reasoning models.
- Continuous evaluation and self-reflection are essential for maintaining quality and consistency in AI applications.

## Related Resources
- [How to use reasoning models with Azure AI Foundry Models (Python)](https://learn.microsoft.com/en-us/azure/ai-foundry/foundry-models/how-to/use-chat-reasoning)
- [How to use reasoning models with Azure AI Foundry Models (Java)](https://learn.microsoft.com/en-us/azure/ai-foundry/foundry-models/how-to/use-chat-reasoning#use-reasoning-capabilities-with-chat)
- [How to use reasoning models with Azure AI Foundry Models (C#)](https://learn.microsoft.com/en-us/azure/ai-foundry/foundry-models/how-to/use-chat-reasoning#use-reasoning-capabilities-with-chat)
- [How to use reasoning models with Azure AI Foundry Models (JavaScript)](https://learn.microsoft.com/en-us/azure/ai-foundry/foundry-models/how-to/use-chat-reasoning#use-reasoning-capabilities-with-chat)
- [Azure AI Foundry Model Inference Documentation](https://learn.microsoft.com/en-us/azure/ai-foundry/model-inference/)
