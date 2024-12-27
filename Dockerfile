FROM ubuntu:latest

# 设置 安卓 环境变量
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV PATH=${PATH}:${ANDROID_SDK_ROOT}/tools:${ANDROID_SDK_ROOT}/platform-tools:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin

# 安装必要的工具和 OpenJDK 17
RUN apt-get update && \
  apt-get install -y openjdk-17-jdk git wget unzip && \
  apt-get clean

# 下载并安装 Android SDK Command-Line Tools
RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools && \
  cd ${ANDROID_SDK_ROOT}/cmdline-tools && \
  wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip && \
  unzip commandlinetools-linux-11076708_latest.zip && \
  rm commandlinetools-linux-11076708_latest.zip && \
  mv cmdline-tools latest

# 安装 Android SDK Platform 34
RUN yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platforms;android-34"

# 安装 Android SDK Build-Tools 34.0.0
RUN yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "build-tools;34.0.0"

# 安装 cmake
RUN yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "cmake;3.22.1"

# 安装 ndk
RUN yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "ndk;26.1.10909125"

# 安装 Git
RUN apt-get update && apt-get install -y curl && apt-get clean

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN curl -o node.tar.gz https://nodejs.org/dist/v20.14.0/node-v20.14.0-linux-x64.tar.gz \
  && tar -xzf node.tar.gz -C /usr/local --strip-components=1 \
  && rm node.tar.gz


ENV PATH="/usr/local/bin:${PATH}"

# 设置淘宝镜像
RUN npm config set registry https://registry.npmmirror.com

# 安装yarn
RUN npm install -g yarn@1.22.22

# 设置工作目录
WORKDIR /app

COPY . /app

# 暴露应用程序端口（根据需要修改）
EXPOSE 999
