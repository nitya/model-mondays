# Model Mondays S2:E02 – Model Context Protocol (MCP)

**Speakers:** Nitya (host), Sharmila (co-host), Den Delimarsky (guest, Principal Product Engineer, Microsoft)

## Abstract
This episode of Model Mondays explores the Model Context Protocol (MCP), a foundational standard for connecting AI models to external data and tools. Den Delimarsky  provides a deep dive into MCP, focusing on secure server implementation, the new authorization specification, and best practices for protecting AI infrastructure in the cloud.

## News Highlights
- Cohere models are now available on managed compute in Foundry, enabling secure, scalable deployments on Azure infrastructure.
- Prompt Shields and Azure AI Content Safety provide comprehensive protection against prompt injection and offensive outputs.
- OpenAI’s 03 Pro model and Codex Mini are now available, offering improved performance and specialized code generation.
- MCP has been upgraded with model-based access control, better inference routing, and enhanced telemetry for observability and governance.
- The new MCP authorization spec separates resource and authorization servers, simplifying secure deployments and leveraging standard OAuth 2.1 flows.

## Tech Spotlight
Den Delimarsky explains the core purpose of MCP: providing a universal protocol for supplying context to language models, making it easy to connect LLMs to diverse data sources. He details the importance of secure MCP server deployments, especially in remote/cloud scenarios, and the challenges of managing user context and authorization. 

The new MCP authorization specification enables developers to use existing identity providers (like Entra ID, Okta, AWS Cognito) for token issuance and validation, reducing the need for custom security logic. Den demonstrates the flow of client-server interactions, the structure of protected resource metadata (PRM) documents, and the benefits of off-the-shelf security solutions. The session emphasizes developer ergonomics, security best practices, and the evolving MCP ecosystem.

## Takeaways
- MCP standardizes how LLMs access external data and tools, enabling scalable, secure AI applications.
- The new authorization spec allows developers to use existing identity providers, reducing custom security work.
- Secure MCP deployments require proper token validation, audit logging, and adherence to best practices.
- Local MCP servers are simpler but less relevant for cloud-scale, multi-user scenarios.
- The MCP ecosystem is rapidly evolving, with new specs, SDKs, and best practices being adopted across tools and platforms.

## Related Resources
- [Security best practices for MCP](https://modelcontextprotocol.io/specification/draft/basic/security_best_practices)
- [Understanding and mitigating security risks in MCP implementations](https://techcommunity.microsoft.com/blog/microsoft-security-blog/understanding-and-mitigating-security-risks-in-mcp-implementations/4404667)
- [Connect to Model Context Protocol (MCP) Servers (Preview)](https://learn.microsoft.com/en-us/azure/ai-foundry/agents/how-to/tools/model-context-protocol#how-it-works)
- [What is the Azure MCP Server (Preview)?](https://learn.microsoft.com/en-us/azure/developer/azure-mcp-server/overview)
- [Register and discover remote MCP servers in your API inventory](https://learn.microsoft.com/en-us/azure/api-center/register-discover-mcp-server)
