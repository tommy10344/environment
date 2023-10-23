# Android SDK

SDKPATH_ANDROID=${HOME}/Library/Android/sdk
SDKPATH_XAMARIN=${HOME}/Library/Developer/Xamarin/android-sdk-macosx

if [ -d "${SDKPATH_ANDROID}" ]; then
  export ANDROID_HOME=${SDKPATH_ANDROID}
  export ANDROID_SDK_TOOLS=${ANDROID_HOME}/tools
  export ANDROID_SDK_PLATFORM_TOOLS=${ANDROID_HOME}/platform-tools
  export PATH=${ANDROID_SDK_TOOLS}/bin:$PATH
  export PATH=${ANDROID_SDK_PLATFORM_TOOLS}:$PATH
elif [ -d "${SDKPATH_XAMARIN}" ]; then
  export PATH=${SDKPATH_XAMARIN}/platform-tools:$PATH
fi
