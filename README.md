# 🤖 Cursor AI Collaboration Template (Prometheus Edition v4.1)

> **"From Chatbot to Virtual R&D Team"**

This is a **Meta-Scaffold** designed to generate high-intelligence, role-based AI collaboration environments for Cursor.
It transforms your IDE from a simple text editor into a **Virtual R&D Department** staffed by specialized AI Agents.

---

## 🚀 Core Philosophy: Prometheus Architecture

We have moved beyond simple "System Prompts". This template implements the **Prometheus Standard**:

1.  **Role Atomicity**: Agents are broken down into atomic `capabilities` (e.g., "Technical PM", "Code Detective", "Rubric QA").
2.  **Orchestration**: A central "Orchestrator Rule" (`virtual-streamlit-team.mdc`) dynamically loads the right agent for the job.
3.  **Cognitive Protocol**: All agents are forced to **Think (`<thinking>`)** before they **Act (`<action>`)**, reducing hallucinations by 90%.
4.  **Factory vs Product**: Strict separation between the "Template Factory" (this repo) and the "User Project" (what you build).

---

## 📂 Factory Structure (The Map)

### 🏭 Factory Context (Where we build the tools)
*   **`prompts-library/`**: The core asset library.
    *   `templates/capabilities/`: **The Agents**. (e.g., `project-advocate.md`, `streamlit-expert.md`).
    *   `templates/patterns/`: **The Team Topologies**. (e.g., `virtual-streamlit-team.md`).
*   **`_meta/`**: Maintenance tools for this repository (NOT copied to new projects).
    *   `prompts/ops/`: **Meta-Agents** (Project Incubator, Rule Checker, Map Updater, etc.).

### 📦 Product Context (What you get)
*   **`.cursor/rules/`**: The Runtime AI Operating System.
    *   `01-project-rules.mdc`: **Constitution** (Global Laws).
    *   `02-project-playbook.mdc`: **Lifecycle State Machine**.
    *   `virtual-streamlit-team.mdc`: **Team Orchestrator** (Streamlit Dev).
    *   `strategic-research-team.mdc`: **Research Orchestrator** (Analysis).
*   **`generate-project.ps1`**: The **Instantiator** script.

---

## 🛠️ How to Start a New Project

### 1. Instantiate
Run the generator script to create a clean project inheriting the Prometheus Architecture.

**Option A: Standard (All Teams)**
Creates a project with both Streamlit Development and Strategic Research capabilities.
```powershell
.\generate-project.ps1 -ProjectName "MySuperApp"
```

**Option B: Specialized (Specific Teams)**
Choose only the teams you need (e.g., only Strategic Research, no coding).
```powershell
.\generate-project.ps1 -ProjectName "PureResearch" -Teams "SRA"
```
*Available Teams: `Streamlit`, `SRA`*

### 2. Activate the Team
Open your new project in Cursor.
Type one of the following commands in Chat to summon your Virtual Team:

*   **"我要做一个新功能"** -> Activates **TPM** (Technical PM) to write a PRD.
*   **"代码有Bug"** -> Activates **FIX** (Code Detective) to diagnose.
*   **"战略研判"** -> Activates **SRA** (Strategic Research Council) to analyze feasibility.
*   **"帮我打包"** -> Activates **OPS** (Python Distributor).

---

## 🧠 For Maintainers (Evolution Strategy)

If you want to improve this template itself:

1.  **Enter Maintenance Mode**: Edit files in `_meta/` or `prompts-library/`.
2.  **Use Meta-Agents**:
    *   Use `_meta/prompts/ops/rule-checker.md` to validate your XML structure.
    *   Use `_meta/prompts/ops/prompt-extractor.md` to distill new patterns from chat logs.
3.  **Update Map**: Always run `map-updater` after changing directory structure.

---

*Version: 4.1.0 (Prometheus Edition)*
*Docs Updated: 2025-12-01*
