mkdir react-native-project

cd react-native-project

git clone https://github.com/Jimmylxue/h5pack-native.git

cd h5pack-native

yarn --force

yarn release

ls

exit

docker cp my_rn_container:/app/react-native-project/h5pack-native/android/app/build/outputs/apk/release/app-release.apk /tmp/app.apk

cd /tmp

ls