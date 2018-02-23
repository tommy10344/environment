# Android SDK

SDKPATH=${HOME}/Library/Android/sdk

if [ -d "${SDKPATH}" ]; then
    export ANDROID_HOME=${SDKPATH}
    export ANDROID_SDK_TOOLS=${ANDROID_HOME}/tools
    export PATH=${ANDROID_SDK_TOOLS}/bin:$PATH
fi
