mkdir react-native-project

cd react-native-project

# 克隆 react-native 项目 - 这个可换各自的代码仓库
git clone https://github.com/Jimmylxue/h5pack-native.git

# 对应克隆的代码仓库名
cd h5pack-native

# 安装依赖
yarn --force

cd ./android

# 清打包缓存
./gradlew clean 

cd ..

# 执行构建 这个可对应成各自的 打包指令， 如 ./gradlew assemblerelease
yarn release

exit
