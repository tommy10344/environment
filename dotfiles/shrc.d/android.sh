# Android SDK
# https://developer.android.com/tools/variables

SDKPATH_ANDROID=${HOME}/Library/Android/sdk
SDKPATH_XAMARIN=${HOME}/Library/Developer/Xamarin/android-sdk-macosx

if [ -d "${SDKPATH_ANDROID}" ]; then
  export ANDROID_HOME=${SDKPATH_ANDROID}
  export PATH=${ANDROID_HOME}/tools:$PATH
  export PATH=${ANDROID_HOME}/tools/bin:$PATH
  export PATH=${ANDROID_HOME}/platform-tools:$PATH
  export PATH=${ANDROID_HOME}/cmdline-tools/latest/bin:$PATH
elif [ -d "${SDKPATH_XAMARIN}" ]; then
  export PATH=${SDKPATH_XAMARIN}/platform-tools:$PATH
fi
