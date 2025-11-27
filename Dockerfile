# 使用官方 PowerShell Alpine 镜像作为基础，体积小且安全
FROM mcr.microsoft.com/powershell:lts-alpine

# 设置工作目录
# 我们将代码放在 /usr/src/template 而不是 /app，以免挂载卷时覆盖代码
WORKDIR /usr/src/template

# 复制项目文件到镜像中
COPY . .

# 定义容器启动时的默认行为
# 我们不设置 Entrypoint 为脚本，而是保持 pwsh shell，
# 这样用户可以灵活传入参数，或者在容器内进行调试。
# 用户可以使用如下命令运行：
# docker run --rm -v $(pwd):/output cursor-template ./generate-project.ps1 -ProjectName "MyNewProj" -DestinationPath /output

CMD ["pwsh", "-Help"]

