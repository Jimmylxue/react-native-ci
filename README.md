## Docker 相关

- 一个 Dockerfile 只能有一个 FROM

### 脚本指令

- 构建镜像：`docker build -t react-native-app .`

- 运行镜像：`docker run -it --rm react-native-app`

- 动态传入脚本：`docker run -v /Users/jimmy/Desktop/code/docker/jdk/start.sh:/app/start.sh -p 8080:8080 react-native-app`

- 持续输入：`docker run -it -v /Users/jimmy/Desktop/code/docker/jdk/start.sh:/app/start.sh -p 8080:8080 react-native-app /bin/bash`

- 创建容器：`docker run -d --name 容器名 镜像名`，如:`docker run -d --name testrn react-native-app`

- 启动容器：`docker start 容器名`，如`docker start testrn`

- 进入容器 cmd:`docker exec -it 容器名 bash`，如`docker exec -it testrn bash`

#### 推荐使用

- 启动容器：`docker run -d --name demo  react-native-app tail -f /dev/null`

  > -d 就是表示在后台持续运行

- 进入容器：`docker exec -it demo /bin/bash`

- rn 加速下载代码：`find node_modules/ -type f \( -name "*.kts" -o -name "*.gradle" \) -exec sed -i 's|mavenCentral()|maven { url = uri("https://maven.aliyun.com/repository/central") }\n    maven { url = uri("https://maven.aliyun.com/repository/public") }\n    maven { url = uri("https://maven.aliyun.com/repository/google") }\n    maven { url = uri("https://maven.aliyun.com/repository/gradle-plugin") }\n    maven { url = uri("https://maven.aliyun.com/repository/jcenter") }\n    mavenCentral()|g' {} +
`

## CI 相关

### 获取 github Release 信息

我们的 CI 处理了，将打包出的 apk 包上传至 Github Release，这里会需要用到 release_id，可以在这个 api 上查看信息

`https://api.github.com/repos/Jimmylxue/react-native-ci/releases`

其中，用户名、仓库名可自行修改
