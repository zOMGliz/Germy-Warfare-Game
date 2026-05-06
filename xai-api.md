# xAI API Documentation

**Official Documentation**: https://docs.x.ai/  
**API Base URL**: `https://api.x.ai/v1` (regional endpoints also available, e.g. `eu-west-1.api.x.ai`)  
**Console**: https://console.x.ai/ (API keys, billing, models, collections)  
**Last Compiled**: April 2026

## Overview

The xAI API provides access to frontier Grok models (Grok 4.20 series and later) with industry-leading reasoning, very low hallucination rates, strict prompt adherence, native tool use, vision, image/video generation, voice, and up to **2,000,000 token** context windows.

Key capabilities:
- **Responses API** (`/v1/responses`) — modern primary endpoint (recommended)
- Built-in **server-side tools** (web search, X search, code execution, file search, collections/RAG, MCP)
- Strong **vision** (image understanding) and **multimodal** support
- **Structured outputs** / JSON mode with schema enforcement
- **Files & Collections** — attach PDFs, Markdown (.md), code files, CSVs, JSON, TXT, etc. (automatically triggers `attachment_search`)
- Streaming, function calling, multi-agent capabilities
- Highly compatible with **OpenAI SDK**, **xAI SDK**, and **Vercel AI SDK**

Knowledge cutoff is approximately November 2024. Use search tools for current information.

## Authentication

All requests require:

```http
Authorization: Bearer $XAI_API_KEY
```

Create an account at https://accounts.x.ai/sign-up, then generate a key in the console.

Recommended: Set the environment variable:
```bash
export XAI_API_KEY="xai-..."
```

The official SDKs automatically read `XAI_API_KEY`.

## Quickstart

### 1. Install SDKs

```bash
# Official Python SDK
pip install xai-sdk

# OpenAI compatible (Python)
pip install openai

# Vercel AI SDK (JS/TS)
npm install ai @ai-sdk/xai
```

### 2. Text Generation Examples

**Python — Official xAI SDK**
```python
import os
from xai_sdk import Client
from xai_sdk.chat import user, system

client = Client(api_key=os.getenv("XAI_API_KEY"))

chat = client.chat.create(model="grok-4.20-reasoning")
chat.append(system("You are Grok, a highly intelligent, helpful, and truthful AI."))
chat.append(user("What is the meaning of life, the universe, and everything?"))

response = chat.sample()
print(response.content)
```

**Python — OpenAI SDK (compatible)**
```python
from openai import OpenAI

client = OpenAI(
    api_key=os.getenv("XAI_API_KEY"),
    base_url="https://api.x.ai/v1",
)

completion = client.responses.create(
    model="grok-4.20-reasoning",
    input=[
        {"role": "system", "content": "You are Grok, a highly intelligent, helpful AI."},
        {"role": "user", "content": "Explain quantum computing in simple terms."},
    ],
)

print(completion.output_text)
```

**JavaScript (OpenAI SDK style)**
```javascript
import OpenAI from 'openai';

const client = new OpenAI({
    apiKey: process.env.XAI_API_KEY,
    baseURL: 'https://api.x.ai/v1',
});

const response = await client.responses.create({
    model: 'grok-4.20-reasoning',
    input: [
        { role: 'user', content: 'Hello, Grok!' }
    ]
});

console.log(response.output_text);
```

**cURL**
```bash
curl https://api.x.ai/v1/responses \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $XAI_API_KEY" \
  -d '{
    "model": "grok-4.20-reasoning",
    "input": [
      {"role": "user", "content": "What is the capital of France?"}
    ]
  }'
```

### 3. Vision (Image Understanding)

Images can be passed via URL (or base64 in some SDKs). Max ~20 MiB, jpg/png supported.

Example (OpenAI SDK style):
```python
completion = client.responses.create(
    model="grok-4",
    input=[{
        "role": "user",
        "content": [
            {"type": "input_image", "image_url": "https://..."},
            {"type": "input_text", "text": "What's in this image?"}
        ]
    }]
)
```

## Available Models & Pricing (April 2026)

### Language / Reasoning Models (Grok 4.20 series)

- `grok-4.20-reasoning` / `grok-4.20-0309-reasoning` — flagship, best reasoning & tool use
- `grok-4.20-multi-agent-0309` — multi-agent capabilities
- `grok-4.20-non-reasoning` variants
- Faster/cheaper: `grok-4-1-fast-reasoning`, `grok-4-1-fast-non-reasoning`

**Context Window**: Up to **2,000,000 tokens**  
**Pricing example**: ~$2.00 / $6.00 per million tokens (input/output) for flagship; cheaper for fast variants.  
**Batch API**: 50% off token pricing.

### Image, Video & Voice

- **Image Generation**: `grok-imagine-image` ($0.02/image), `grok-imagine-image-pro` ($0.07/image)
- **Video Generation**: `grok-imagine-video` (~$0.05 per second)
- **Voice Agent API**: $0.05 per minute
- **Text-to-Speech**: $4.20 per 1M characters

**Tool Invocation Costs** (additional to tokens):
- `web_search`, `x_search`, `code_execution`: ~$5 per 1k calls
- `attachment_search` / file search: ~$10 per 1k calls
- Collections search: ~$2.50 per 1k calls

Full up-to-date pricing, rate limits, and model aliases: https://docs.x.ai/developers/models

## Main API Endpoints

- `POST /v1/responses` — Primary modern endpoint (chat, reasoning, tools, vision, structured outputs, streaming)
- `GET /v1/responses/{response_id}` — Retrieve stored response (responses stored for 30 days)
- `POST /v1/chat/completions` — Legacy OpenAI-compatible endpoint
- `GET /v1/models`, `/v1/language-models`, etc. — List models with details
- Image/Video generation endpoints (`/v1/images/generations`, `/v1/videos/generations`)
- Embeddings, document search, tokenization, etc.

Full REST reference: https://docs.x.ai/developers/rest-api-reference

## Tools & Advanced Features

Built-in server-side tools (no client-side execution needed for web/X/code):
- `web_search`
- `x_search` (Twitter/X posts, profiles, threads)
- `code_execution` / code interpreter
- `attachment_search` (when files are attached)
- `collections_search` (persistent RAG over uploaded documents)
- Custom function calling & Remote MCP tools

Enable by including `tools` in the request or letting the model decide (`tool_choice: "auto"`).

**Files support**: Plain text, **.md** (Markdown), .py, .js, .java, .csv, .json, .pdf, and many other formats.

## SDKs & Compatibility

- Official: https://github.com/xai-org/xai-sdk-python
- OpenAI SDK (change `base_url`)
- Vercel AI SDK (`@ai-sdk/xai`)
- Anthropic-compatible endpoints also available for some legacy paths

## Important Notes

- Reasoning models may not support or may ignore certain legacy parameters (`logprobs`, `presencePenalty`, `frequencyPenalty`, `stop`, etc.).
- Use model aliases (`grok-4.20-reasoning-latest`) for latest versions.
- Check model availability per team/region in the console.
- Usage guidelines violations may incur a small fee.

## Resources

- Quickstart: https://docs.x.ai/developers/quickstart
- Models & Pricing: https://docs.x.ai/developers/models
- Tools Overview: https://docs.x.ai/developers/tools/overview
- Files & Collections: https://docs.x.ai/developers/files
- REST API Reference: https://docs.x.ai/developers/rest-api-reference
- OpenAPI Spec: https://docs.x.ai/openapi.json

---

*This document was compiled from official xAI sources. Always refer to https://docs.x.ai for the most current information, as models, pricing, and features evolve rapidly.*
