# https://developer.android.com/ndk/guides/android_mk.html

LOCAL_PATH := $(call my-dir) # Set $LOCAL_PATH to the current directory that stores this Android.mk file

# Every dir is relative to LOCAL_PATH

# $(CLEAR_VARS) clean $(LOCAL_XXX), such as LOCAL_MODULE, LOCAL_SRC_FILES, and LOCAL_STATIC_LIBRARIES. Only $LOCAL_PATH is not cleaned.
# This is necessary because Android.mk support multiple modules per file
# You need call it before each module, defined by LOCAL_MODULE
include $(CLEAR_VARS)

LOCAL_MODULE := sqlite 

# source files are relative to $(LOCAL_PATH)
FILE_LIST := $(wildcard $(LOCAL_PATH)/../../SQLiteCpp/src/*.cpp)
FILE_LIST += $(wildcard $(LOCAL_PATH)/../../SQLiteCpp/sqlite3/*.c)
LOCAL_SRC_FILES :=  $(FILE_LIST:$(LOCAL_PATH)/%=%)

# heades locations need to be prefixed by $(LOCAL_PATH)//
LOCAL_C_INCLUDES := $(LOCAL_PATH)//../../SQLiteCpp/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)//../../SqliteCpp/sqlite3

# Enable JSON1 extension 
LOCAL_CFLAGS := -DSQLITE_ENABLE_JSON1

LOCAL_CPP_FEATURES := exceptions # Enable exception support. exceptions and rtti is disabled by default.
include $(BUILD_SHARED_LIBRARY) # Build the module

# =========================================
# Next module here
# include $(CLEAR_VARS)
# LOCAL_MODULE :=  module-name
