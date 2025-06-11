# 任务卡 001：攻克多模态财报解析

**关联文档**: `../docs/2025-06-10-initial-strategy-and-setup.md`

**发起日期**: 2025-06-10

**状态**: <font color="orange">进行中</font>

---

## 🎯 核心目标

开发一个稳定的 Python 程序，该程序能够：
1.  接收一份 PDF 格式的上市公司财报。
2.  准确、结构化地提取出财报中的 **文字**、**表格** 和 **图表** 三种核心元素。

这是我们 Agent **感知模块** 的基石，其完成质量直接影响整个项目的上限。

---

## ✅ 任务清单与分步推进

| 步骤 | 任务内容 | 关键工具/库 | 状态 | 产出/备注 |
| :-- | :--- | :--- | :--- | :--- |
| **1** | **环境搭建与工具选型** | `PyMuPDF (fitz)`, `camelot-py`, `tabula-py`, `pandas` | <font color="red">未开始</font> | 确保所有依赖库都已正确安装在本地环境中。 |
| **2** | **基础实践：文本提取** | `PyMuPDF` | <font color="red">未开始</font> |  |
| | 2.1. 寻找一份A股上市公司的年度财报PDF作为实验材料。 | - | <font color="red">未开始</font> | 建议选择内容复杂的，如制造业或银行。 |
| | 2.2. 编写脚本，提取PDF前5页的所有文字。 | `PyMuPDF` | <font color="red">未开始</font> | 目标是验证文本提取的基本能力。 |
| **3** | **基础实践：表格提取** | `camelot-py` | <font color="red">未开始</font> | |
| | 3.1. 研究 `camelot-py` 的使用方法。 | `camelot-py` | <font color="red">未开始</font> | 重点理解其两种解析模式：`lattice` 和 `stream`。 |
| | 3.2. 尝试提取财报中任意一个标准表格。 | `camelot-py` | <font color="red">未开始</font> | 输出应为一个 pandas DataFrame。 |
| **4** | **难点探索：图表识别** | `PyMuPDF` | <font color="red">未开始</font> | |
| | 4.1. 编写脚本，定位PDF中所有图片（图表）的边界框（bounding box）。 | `PyMuPDF` | <font color="red">未开始</font> | 目标是能准确框出图表的位置。 |
| | 4.2. 将识别出的图表区域，单独保存为图片文件。 | `PyMuPDF`, `Pillow` | <font color="red">未开始</font> | 为后续的图表内容解析做准备。 |

---

## 🏁 完成标准

- [ ]  能够稳定运行的 Python 脚本。
- [ ]  脚本可以将一份财报 PDF 作为输入，输出一个结构化的结果，至少包含：
    - [ ]  按页码组织的纯文本内容。
    - [ ]  成功提取的表格数据（以 DataFrame 或 CSV 格式）。
    - [ ]  从文档中分离出的图表图片文件。

---

## 困难与解决方案

*（此部分将在我们遇到问题时进行记录）* 