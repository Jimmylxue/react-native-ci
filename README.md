# react-native-ci Pipeline 🚀

欢迎使用 **react-native-ci** 项目！本项目旨在提供一个高效的自动化打包解决方案，专为 React Native 应用程序设计。通过简单的配置，您可以快速实现 CI/CD 流程，确保应用的持续集成与交付。

## 效果展示

支持自定义输入 react-native 打包时需要的各种依赖版本安装，借助 github-action 打包，并将打包的结果上传至 github-release 中

<img width="1449" alt="image" src="https://github.com/user-attachments/assets/e142f4df-f928-417b-bbd7-bd49833c7a5e" />

<img width="1470" alt="image" src="https://github.com/user-attachments/assets/cd231d05-a268-478c-8bd0-c7c39c9805c8" />

## 快速开始

### 1. Fork 本项目

首先，点击右上角的 "Fork" 按钮，将本项目复制到您的 GitHub 账户中。

### 2. 修改配置

在您的 forked 仓库中，您需要进行以下几个文件做单独的配置：

- **build.yml**

  核心的 CI 文件，在这个文件中需要以各自的项目做对应的修改配置：

  - 修改 `Upload APK to Existing Release` step

    因为我们需要将打包出来的 apk 上传到 github-release 中，所以需要先获取一些 github 的 token 内容。

    - **upload_url**

      这个需要修改为您的仓库 release 的 upload_url，先创建一个 release，然后做对应的修改，url 规范为：`https://uploads.github.com/repos/{用户名}/{仓库名}/releases/{releaseId}/assets?name=${{ github.run_number }}-${{ github.run_id }}.apk`

      其中获取 releaseId，可以访问：`https://api.github.com/repos/{用户名}/{仓库名}/releases`获取

    - **GITHUB_TOKEN**

      生成一个 github 账号的 token，并给上足够的权限，添加至 `secrets`中

### 3. 自动化打包

完成配置后，你可以通过 `github-action` 完成自动化打包。每当你推送代码、或主动执行打包指令时，系统将自动构建你的 `Docker` 镜像。完成打包，并将打包结果的 apk 上传至 `github-release` 中

## 贡献

欢迎任何形式的贡献！如果你有建议或问题，请随时提交 issue 或 pull request。
