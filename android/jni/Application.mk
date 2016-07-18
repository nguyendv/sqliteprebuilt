APP_ABI := all # Support all abi

# Android NDK Native APIs
# Must not greater than the minSdkVersion
# See here for list of NDK Native APIs: https://developer.android.com/ndk/guides/stable_apis.html
APP_PLATFORM := android-15 

# Standard C++ runtime
# See here forthe list of run time: https://developer.android.com/ndk/guides/cpp-support.html#runtimes
# Read the "Shard runtimes" section for important notes if you choose to use a shared runtime
APP_STL := gnustl_shared

APP_CPPFLAGS += -std=c++11
