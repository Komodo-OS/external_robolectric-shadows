##############################################
# Compile Robolectric utils
##############################################
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := Robolectric_utils

LOCAL_SRC_FILES := $(call all-java-files-under, src/main/java)

include $(BUILD_HOST_JAVA_LIBRARY)

##############################################
# Compile Robolectric utils tests
##############################################
include $(CLEAR_VARS)

LOCAL_MODULE := Robolectric_utils_tests

LOCAL_SRC_FILES := $(call all-java-files-under, src/test/java)

LOCAL_STATIC_JAVA_LIBRARIES := \
  Robolectric_utils \
  hamcrest \
  guava \
  junit \
  truth-prebuilt

include $(BUILD_HOST_JAVA_LIBRARY)

##############################################
# Execute Robolectric utils tests
##############################################
include $(CLEAR_VARS)

LOCAL_MODULE := Run_robolectric_utils_tests

test_source_directory := $(LOCAL_PATH)/src/test/java

test_runtime_libraries := \
  Robolectric_utils_tests

include external/robolectric-shadows/run_robolectric_module_tests.mk
