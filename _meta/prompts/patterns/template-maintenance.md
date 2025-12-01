---
description: The "Factory OS" for maintaining the template project itself.
globs: "_meta/**/*", "prompts-library/**/*", ".cursor/rules/**/*"
---

# Pattern: Template Maintenance Mode (The Factory OS)

This pattern defines the **Operating System** for the **Toolmaker**.
It enforces strict protocols to prevent "Factory Contamination" and ensure "Asset Integrity".

## 🎯 Mission
To build the **Capability to Build Features**. We are the factory that produces the tools.

## 👥 Factory Staff (Role Matrix)
You must explicitly **activate** these internal agents for their respective tasks. DO NOT attempt to simulate them loosely.

| Task Domain | Mandatory Agent | Source File |
| :--- | :--- | :--- |
| **Prompt Engineering** | **Prometheus** | `_meta/prompts/capabilities/prometheus-prompt-engineer.md` |
| **Rule/Syntax QA** | **Rule Checker** | `_meta/prompts/ops/rule-checker.md` |
| **Map Integrity** | **Map Updater** | `_meta/prompts/ops/map-updater.md` |
| **Version Control** | **Version Bumper** | `_meta/prompts/ops/version-bumper.md` |
| **Project Genesis** | **Project Incubator** | `_meta/prompts/ops/project-incubator.md` |

---

## 🛡️ Core Protocols (Atomic Operations)

### Protocol P1: Prometheus Engineering (The Forge)
*   **Context**: Creating or Refactoring a Prompt/Capability/Pattern.
*   **Steps**:
    1.  **Activate Prometheus**: Use his "Mental Model" to design the artifact.
    2.  **Draft**: Output the raw markdown.
    3.  **Self-Correction**: Prometheus runs his own `<critique>` phase.

### Protocol P2: Safe Surgery (The Modification)
*   **Context**: Editing an existing Rule or Pattern.
*   **Steps**:
    1.  **Read**: Ingest the current file content.
    2.  **Edit**: Apply the changes.
    3.  **🚨 Regression Check (CRITICAL)**:
        *   *Compare*: Old Content vs. New Content.
        *   *Ask*: "Did I accidentally delete a logic branch?" "Did I break the JSON structure?"
        *   *Verify*: "Is the business logic (SOP) still intact?"
    4.  **QA**: Activate **Rule Checker** to validate syntax/globs.

### Protocol P3: Version Control (The Heartbeat)
*   **Context**: Deciding when to commit.
*   **Trigger Logic**:
    *   **Immediate Commit**: After completing a "Workflow" (A/B/C/D).
    *   **Deferred Commit**: If making minor edits, you may batch them.
    *   **Major Commit**: After a Refactor or New Feature.
*   **Action**: Activate **Version Bumper**.

---

## 🔄 Composite Workflows (The Scenarios)

### Workflow A: Rule Maintenance (Routine)
*   **Trigger**: "Fix bug in rule", "Optimize trigger".
*   **Execution**:
    1.  Execute **Protocol P2 (Safe Surgery)**.
    2.  Execute **Protocol P3 (Version Control)**.

### Workflow B: Asset Injection (New Capabilities)
*   **Trigger**: "Add new Role", "Create Capability".
*   **Execution**:
    1.  Execute **Protocol P1 (Prometheus)** to draft the file.
    2.  **Register**: Add to parent Pattern if applicable.
    3.  Activate **Map Updater** to sync structure.
    4.  Execute **Protocol P3 (Version Control)**.

### Workflow C: Pattern Genesis (New Teams)
*   **Trigger**: "Create new Team", "Add Orchestrator".
*   **Execution**:
    1.  **Design**: Execute **Protocol P1 (Prometheus)** following the *Team Genesis Protocol*.
    2.  **Bind**: Create the Trigger Rule (.mdc).
    3.  **Verify**: Execute **Protocol P2 (Safe Surgery)** on the new files to ensure links are correct.
    4.  **Map**: Activate **Map Updater**.
    5.  Execute **Protocol P3 (Version Control)**.

### Workflow D: Evolution Protocol (Wisdom Harvest)
*   **Trigger**: "Refactor Architecture", "Fix Process Flaw".
*   **Execution**:
    1.  **Diagnosis**: Identify root cause.
    2.  **Execution**: Use P1/P2 to refactor.
    3.  **Record**: Create `docs/learnings/YYYY-MM-DD-[Topic].md`.
    4.  **Commit**: Execute **Protocol P3**.

### Workflow E: Project Incubation (The Delivery)
*   **Trigger**: "Create new project", "Start new app".
*   **Execution**:
    1.  **Activate**: `_meta/prompts/ops/project-incubator.md`.
    2.  **Interview**: Determine Project Name and Required Teams (Streamlit vs SRA).
    3.  **Execute**: Run `generate-project.ps1` with correct params.
    4.  **Handover**: Provide "Day 1 Guide".

---

## 🛠️ Quality Checklist
1.  **Agent Authority**: Did I use Prometheus for Prompts and Rule Checker for Rules?
2.  **Regression Zero**: Did I confirm no existing logic was deleted during edits?
3.  **Map Sync**: Is `模板项目地图.md` up to date?
4.  **Isolation**: Is `src/` untouched?
