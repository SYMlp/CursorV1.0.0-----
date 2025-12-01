<#
.SYNOPSIS
    从当前的“协作模板母版”项目，生成一个全新的、干净的子项目。

.DESCRIPTION
    此脚本会自动将模板母版中的核心文件和目录（如 .cursor/rules, src, data 等）
    复制到一个新的项目文件夹中。

    它会智能地忽略所有与模板开发相关的元信息文件夹（如 _meta）、版本控制信息（.git）
    以及脚本自身，确保新生成的项目是一个纯净的起点。

.PARAMETER ProjectName
    必需。新项目的名称。脚本将在当前目录的上一级目录创建以此命名的文件夹。
    例如，如果当前在 D:\Coding\Template，运行脚本后会创建 D:\Coding\YourProjectName。

.PARAMETER DestinationPath
    可选。指定新项目创建的路径。默认为当前模板目录的上一级。

.PARAMETER Teams
    可选。指定要启用的团队规则（Team Rules）。
    可选值: 'All' (默认), 'Streamlit', 'SRA' (Strategic Research)。
    支持多选，用逗号分隔，例如 "Streamlit,SRA"。
    如果指定了特定团队，未选中的团队规则将被删除。

.EXAMPLE
    .\generate-project.ps1 -ProjectName "MyNewWebApp"
    # 默认包含所有团队

.EXAMPLE
    .\generate-project.ps1 -ProjectName "PureResearch" -Teams "SRA"
    # 仅启用战略研究团队，不包含 Streamlit 开发团队
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$ProjectName,

    [Parameter(Mandatory=$false)]
    [string]$DestinationPath = "..",

    [Parameter(Mandatory=$false)]
    [string]$Teams = "All"
)

try {
    # 获取脚本所在的目录，即模板母版的根目录
    $templatePath = $PSScriptRoot

    # 解析目标路径
    $resolvedDestination = Resolve-Path -Path (Join-Path -Path $templatePath -ChildPath $DestinationPath)
    
    # 组合出新项目的完整路径
    $newProjectPath = Join-Path -Path $resolvedDestination.Path -ChildPath $ProjectName

    # 检查目标目录是否已存在
    if (Test-Path $newProjectPath) {
        throw "目标项目目录 '$newProjectPath' 已存在。请选择一个不同的项目名称或路径。"
    }

    Write-Host "模板母版路径: $templatePath"
    Write-Host "新项目路径: $newProjectPath"
    Write-Host "启用团队: $Teams"
    Write-Host "开始创建新项目 '$ProjectName'..."

    # 定义需要排除的文件和目录列表 (这些是模板自身的维护工具，不应带入新项目)
    $excludeList = @(
        "_meta",
        ".git",
        "generate-project.ps1"
    )

    # 获取模板目录下的所有项目，准备复制
    $itemsToCopy = Get-ChildItem -Path $templatePath -Exclude $excludeList

    # 创建新项目目录
    New-Item -ItemType Directory -Path $newProjectPath | Out-Null

    # 复制文件和目录
    Write-Host "正在复制模板文件..."
    foreach ($item in $itemsToCopy) {
        $sourceItemPath = $item.FullName
        $destinationItemPath = Join-Path -Path $newProjectPath -ChildPath $item.Name
        
        Copy-Item -Path $sourceItemPath -Destination $destinationItemPath -Recurse
    }

    # --- 核心修正: 清理不需要的规则文件 ---
    # 1. 删除 project-map-summary.mdc (模板母版的简图，新项目应生成自己的地图)
    # 2. 删除 template-maintenance-mode.mdc (模板维护模式，新项目不需要维护模板自身)
    
    $rulesToRemove = @(
        ".cursor/rules/project-map-summary.mdc",
        ".cursor/rules/template-maintenance-mode.mdc"
    )

    foreach ($ruleFile in $rulesToRemove) {
        $fullPath = Join-Path -Path $newProjectPath -ChildPath $ruleFile
        if (Test-Path $fullPath) {
            Remove-Item -Path $fullPath -Force
            Write-Host "已移除母版专用规则: $ruleFile" -ForegroundColor Gray
        }
    }

    # --- 团队规则 (Team Rules) 选择逻辑 ---
    # 定义团队与规则文件的映射
    $teamMap = @{
        "Streamlit" = ".cursor/rules/virtual-streamlit-team.mdc"
        "SRA"       = ".cursor/rules/strategic-research-team.mdc"
    }

    if ($Teams -ne "All") {
        $selectedTeams = $Teams -split "," | ForEach-Object { $_.Trim() }
        
        foreach ($teamKey in $teamMap.Keys) {
            if ($teamKey -notin $selectedTeams) {
                # 如果该团队未被选中，删除对应的规则文件
                $ruleFile = $teamMap[$teamKey]
                $fullPath = Join-Path -Path $newProjectPath -ChildPath $ruleFile
                if (Test-Path $fullPath) {
                    Remove-Item -Path $fullPath -Force
                    Write-Host "已移除未选团队规则 ($teamKey): $ruleFile" -ForegroundColor Yellow
                }
            } else {
                Write-Host "已保留团队规则 ($teamKey)" -ForegroundColor Green
            }
        }
    } else {
        Write-Host "保留所有默认团队规则 (Streamlit, SRA)" -ForegroundColor Green
    }


    # --- 新增: 生成干净的 project-map-summary.mdc ---
    # 母版的 map 包含 _meta 等信息，不适合新项目。
    # 我们需要为新项目注入一个“空壳”地图规则，以便 AI 后续维护。
    
    $newMapContent = @"
---
description: Project Mini-Map - High-level directory structure and architectural topology.
globs: "**/*"
alwaysApply: true
---

# 🗺️ Project Mini-Map (Dynamic)

**Context**: This file provides the **High-Level Topology** for the AI.
**Update Frequency**: Must be updated whenever the directory structure changes.

## 📂 Core Structure

\`\`\`text
$ProjectName/
├── prompts-library/        # [ASSETS] The Intelligence Core
├── .cursor/rules/          # [RUNTIME] Active AI Instructions
├── docs/                   # [DOCS] Project documentation
└── tasks/                  # [TRACKING] Work management
\`\`\`

## 🔗 Key References
*   **Detailed Architecture**: \`docs/project-map.md\` (The Truth)

## 🧭 Navigation Principles
1.  **Map Integrity**: Any change to file structure -> **Immediate** update to this file.
2.  **Rule Hierarchy**: \`01-project-rules\` > \`02-project-playbook\` > Specific Pattern Rules.
"@

    $newMapPath = Join-Path -Path $newProjectPath -ChildPath ".cursor/rules/project-map-summary.mdc"
    Set-Content -Path $newMapPath -Value $newMapContent -Encoding UTF8
    Write-Host "已生成新项目专用地图规则: .cursor/rules/project-map-summary.mdc" -ForegroundColor Cyan


    Write-Host ""
    Write-Host "✅ 新项目 '$ProjectName' 创建成功！" -ForegroundColor Green
    Write-Host "路径: $newProjectPath"
    Write-Host ""
    Write-Host "下一步建议:"
    Write-Host "1. cd $newProjectPath"
    Write-Host "2. git init"
    Write-Host "3. 开始您的新征程！"

}
catch {
    Write-Host ""
    Write-Host "❌ 操作失败。" -ForegroundColor Red
    Write-Host "错误信息: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
} 
