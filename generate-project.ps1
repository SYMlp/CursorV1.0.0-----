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

.EXAMPLE
    .\generate-project.ps1 -ProjectName "MyNewWebApp"
    #>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$ProjectName,

    [Parameter(Mandatory=$false)]
    [string]$DestinationPath = ".."
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
    Write-Host "开始创建新项目 '$ProjectName'..."

    # 定义需要排除的文件和目录列表
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