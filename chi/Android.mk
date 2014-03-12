LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# including subdir makefiles
include $(call all-makefiles-under,$(LOCAL_PATH))
