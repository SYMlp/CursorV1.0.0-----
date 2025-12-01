# 📥 Wisdom Inbox (智慧收件箱)

这里是“智慧回流”的卸货区。当你结束一个外部项目，或者在实战中积累了宝贵经验时，请将相关文件复制到这里。

## 📂 目录结构指南

### 1. `raw-prompts/` (新角色/新技能)
*   **放什么**: 你在项目中手写并验证好用的 System Prompts。
*   **例子**: `sql-optimizer.md`, `creative-writer.md`
*   **处理逻辑**: Refiner 会将其转化为符合 Prometheus 标准的 XML 模板，存入 `prompts-library/templates/capabilities/`。

### 2. `learnings/` (经验教训)
*   **放什么**: 项目复盘文档、最佳实践总结。
*   **例子**: `2025-11-28-streamlit-state-management.md`
*   **处理逻辑**: Refiner 会读取其中的 "Lessons Learned"，更新现有角色的 Mental Model 或 Workflow。

### 3. `bugs/` (错题本)
*   **放什么**: 典型的 Bug 修复记录（包含报错信息和最终修复代码）。
*   **例子**: `module-not-found-fix.md`
*   **处理逻辑**: Refiner 会分析 Root Cause，转化为对应角色的 `<constraint>`（防御性规则）。

---

## 🚀 如何触发提炼 (How to Refine)

1. 将文件放入上述对应目录。
2. 在 Cursor Chat 中输入指令：
   > **"执行智慧提炼"** 或 **"@Refinery 处理收件箱"**
3. Pattern Distiller (Refinery) 将会自动扫描本目录，更新 `prompts-library`，并生成报告。
4. 处理完成后，本目录下的文件将被移至 `_meta/wisdom-archive/` (归档)。

