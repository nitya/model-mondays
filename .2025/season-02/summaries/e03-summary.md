# Model Mondays S2:E03 – SLMs and Reasoning: The FI Model Family

**Speaker:** Lee Stott (host), Sharmila (co-host), Mojan Javaheripi (guest, Senior Researcher, Microsoft Research)

## Abstract
This episode of Model Mondays spotlights Small Language Models (SLMs) and the Phi-4 reasoning model family from Microsoft Research. Mojan Javaheripi provides an in-depth look at the design, training, and real-world applications of the Phi-4 reasoning models, highlighting their efficiency, performance, and adaptability for a wide range of AI tasks.

## News Highlights
- Azure AI Foundry introduces safety leaderboards for evaluating models on trustworthiness, jailbreak resistance, and prompt injection resilience.
- Foundry Local is now in public preview, enabling containerized, air-gapped deployment of models for edge and compliance use cases.
- MCP support in Azure AI Agent Service streamlines context routing and model selection for multi-model applications.
- Fine-tuning capabilities have been expanded, including reinforcement and supervised fine-tuning for various models.
- Microsoft is recognized as a leader in the 2025 Gartner Magic Quadrant for data science and machine learning platforms.

## Tech Spotlight
Mojan Javaheripi explains the motivation behind SLMs: bridging the gap between large frontier models and smaller, more efficient models that can run on commodity hardware. The Phi-4 reasoning models are designed for explicit, step-by-step problem solving, with a focus on explainability and logical decomposition. 

Mojan details the training pipeline, including data curation, supervised fine-tuning, and reinforcement learning, and shares benchmarking results that show Phi-4 models outperforming much larger models in math, science, and coding tasks. The discussion covers community adoption, quantization for edge devices, and the importance of fine-tuning for domain-specific applications. Real-world use cases include intelligent tutoring, autonomous agents, code generation, and strategic planning.

## Takeaways
- Phi-4 reasoning models deliver state-of-the-art reasoning and efficiency at a fraction of the size of frontier models.
- SLMs are ideal for edge, local, and resource-constrained deployments, with strong support for quantization and customization.
- Fine-tuning and reinforcement learning enable rapid adaptation to new domains and tasks.
- Open-source availability and community contributions accelerate innovation and adoption.
- Responsible AI, safety, and explainability are core to the Phi-4 model family’s design and deployment.

## Related Resources
- [Azure AI Foundry Models available for serverless API deployment](https://learn.microsoft.com/en-us/azure/ai-foundry/concepts/models-featured#microsoft)
- [How to use reasoning models with Azure AI Foundry Models (Python)](https://learn.microsoft.com/en-us/azure/ai-foundry/foundry-models/how-to/use-chat-reasoning#use-reasoning-capabilities-with-chat)
- [Featured models of Azure AI model catalog](https://learn.microsoft.com/en-us/azure/machine-learning/concept-models-featured?view=azureml-api-2#microsoft)

**Azure AI Foundry Model Cards for Phi-4-Reasoning:**
- [Phi-4-Reasoning](https://ai.azure.com/explore/models/Phi-4-reasoning/version/1/registry/azureml)
- [Phi-4-mini-reasoning](https://ai.azure.com/explore/models/Phi-4-mini-reasoning/version/1/registry/azureml)
- [Phi-4-reasoning-plus](https://ai.azure.com/explore/models/Phi-4-reasoning-plus/version/1/registry/azureml)
- [Phi-4-Reasoning-Onnx](https://ai.azure.com/explore/models/Phi-4-reasoning-plus-onnx/version/1/registry/azureml)
- [Phi-4-mini-reasoning-Onnx](https://ai.azure.com/explore/models/Phi-4-mini-reasoning-onnx/version/2/registry/azureml)


**Hugging Face Model Cards for Phi-4-Reasoning:**
- [microsoft/Phi-4-reasoning-plus](https://hf.co/microsoft/Phi-4-reasoning-plus)
- [microsoft/Phi-4-mini-reasoning](https://hf.co/microsoft/Phi-4-mini-reasoning)
- [unsloth/Phi-4-reasoning-plus-GGUF](https://hf.co/unsloth/Phi-4-reasoning-plus-GGUF)
- [microsoft/Phi-4-reasoning](https://hf.co/microsoft/Phi-4-reasoning)
- [unsloth/Phi-4-mini-reasoning-GGUF](https://hf.co/unsloth/Phi-4-mini-reasoning-GGUF)

<!--
update the Related resource ssection by using the Azure AI FOundry MCP server and the Hugging Face MCP server to get back links to model cards for Phi-4-Reasoning related models in both catalogs. Had to mannually correct the Azure AI Foundry model prefixes for one - then AI corrected the rest
-->