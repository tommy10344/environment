# Android SDK

SDKPATH=${HOME}/Library/Android/sdk

if [ -d "${SDKPATH}" ]; then
    export ANDROID_HOME=${SDKPATH}
    export ANDROID_SDK_TOOLS=${ANDROID_HOME}/tools
    export ANDROID_SDK_PLATFORM_TOOLS=${ANDROID_HOME}/platform-tools
    export PATH=${ANDROID_SDK_TOOLS}/bin:$PATH
    export PATH=${ANDROID_SDK_PLATFORM_TOOLS}:$PATH
fi
