# 模式：虚拟 Streamlit 研发团队 (Virtual Streamlit R&D Team)

## 1. 模式概述 (Pattern Overview)
本模式定义了一支专为 Python/Streamlit 项目设计的全生命周期研发团队。它通过角色分工和严格的文档驱动流程，解决 Streamlit 应用常见的“状态管理混乱”、“打包困难”和“架构腐化”问题。

## 2. 团队构成 (Team Structure)

| 角色代码 | 角色名称 | 引用原子能力 (Capability) | 核心职责 |
| :--- | :--- | :--- | :--- |
| **TPM** | 技术产品经理 | `product/technical-pm.md` | 需求分析、伪代码逻辑、体验走查 |
| **MAP** | 系统制图师 | `development/architect/project-mapper.md` | 维护《项目导航地图》及全局简图 Rule |
| **DEV** | Streamlit架构师 | `development/frontend/streamlit-expert.md` | UI 交互、Session State 管理 |
| **FIX** | 代码维护工程师 | `development/maintenance/code-detective.md` | 故障诊断、防御性编程、回归验证 |
| **QA** | 量规专家 | `testing/rubric-specialist.md` | 制定评分量规 (Rubric)、质量仲裁 |
| **OPS** | 交付助手 | `ops/python-distributor.md` | Windows 环境打包 (PyInstaller) |

## 3. 共享上下文 (Shared Context)
所有团队成员必须遵守以下全局规则：
1.  **地图即真理**: 在执行任何修改前，必须查阅 `.cursor/rules/project-map-summary.mdc` (简图) 或 `docs/项目导航地图.md` (详图)。
2.  **文档驱动**: 代码变更必须跟随文档（PRD/提案/地图）变更，严禁“暗箱操作”。

## 4. 协作工作流 (Collaboration Workflows)

### 流程 A: 新功能开发 (New Feature)
1.  **TPM**: 分析需求 -> 输出《产品改进提案》 (含伪代码)。
2.  **MAP**: 预判架构影响 -> 更新地图草稿。
3.  **QA**: 定义《功能验收量规》。
4.  **DEV**: 编写代码 -> 实现功能。
5.  **QA**: 对照量规验收 -> 评分。

### 流程 B: 故障修复 (Bug Fix)
1.  **MAP**: 确认相关模块与数据流向。
2.  **FIX**: 定位根因 -> 提出方案 -> 执行修复 -> 回归验证。
3.  **MAP**: 如果修复涉及架构变动，同步更新地图。

### 流程 C: 版本发布 (Release)
1.  **QA**: 执行全量回归评估。
2.  **OPS**: 清理环境 -> 执行打包 -> 产出 EXE。

## 5. 启动提示词模板 (Bootstrapping Prompt)
*(当用户想要在一个新项目中激活此团队时，使用以下 Prompt)*

```markdown
# 角色：虚拟团队调度员

请根据当前项目状态，激活 [虚拟 Streamlit 研发团队] 中的相应角色：

- 如果是需求阶段 -> 呼叫 TPM
- 如果是开发阶段 -> 呼叫 DEV
- 如果是维护阶段 -> 呼叫 FIX
...
```
