---
created: 2025-11-27
status: in_progress
priority: medium
---

# 任务：Docker 化项目 (Dockerize Project)

## 背景
用户希望将当前的 Cursor 协作模板项目打包成 Docker。鉴于这是一个基于 PowerShell 的模板生成器项目，"打包"的最佳实践是创建一个包含所有模板文件和生成脚本的容器镜像，使用户可以在任何支持 Docker 的环境中生成新项目，而无需配置本地 PowerShell 环境。

## 目标
1. 提供 `Dockerfile` 以构建包含模板和生成脚本的镜像。
2. 提供 `.dockerignore` 以优化构建上下文。
3. 提供简单的使用说明。

## 计划
- [ ] 分析 `generate-project.ps1` 的路径处理逻辑 (已完成)
- [ ] 创建 `.dockerignore`
- [ ] 创建 `Dockerfile`
- [ ] 验证构建命令和运行命令 (文档说明)

## 交付物
- `Dockerfile`
- `.dockerignore`
- 使用文档 (添加到回复或 README)

