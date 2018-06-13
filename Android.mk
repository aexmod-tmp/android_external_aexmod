LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(call all-java-files-under, src) \
		   $(call all-Iaidl-files-under, src)

#LOCAL_SRC_FILES += src/com/github/aexmod/livedisplay/DisplayMode.aidl
#LOCAL_SRC_FILES += src/com/github/aexmod/livedisplay/HSIC.aidl
#LOCAL_SRC_FILES += src/com/github/aexmod/livedisplay/ILineageHardwareService.aidl
#LOCAL_SRC_FILES += src/com/github/aexmod/livedisplay/LiveDisplayConfig.aidl
#LOCAL_SRC_FILES += src/com/github/aexmod/livedisplay/ILiveDisplayService.aidl

LOCAL_MODULE := com.github.aexmod

LOCAL_MODULE_TAGS := optional

LOCAL_CERTIFICATE := platform
#LOCAL_PRIVILEGED_MODULE := true

LOCAL_REQUIRED_MODULES := services

LOCAL_AIDL_INCLUDES := $(LOCAL_PATH)/src/java
LOCAL_AIDL_FLAGS := -n

include $(BUILD_JAVA_LIBRARY)