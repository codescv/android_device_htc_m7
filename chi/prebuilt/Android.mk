LOCAL_PATH := $(call my-dir)

include $(LOCAL_PATH)/definitions.mk

# Additional apps
$(call include-all-apk-under-data, apps)

# GMS
$(call include-all-apk-under-sys, gapps/system/app)
$(call include-all-apk-under-sys-priv, gapps/system/priv-app)
$(call include-all-so, gapps/system/lib)

# use GMS apps to override AOSP ones
$(call include-prebuilt-sys-app,Chrome.apk,gapps/overrides/Chrome.apk,Browser)
$(call include-prebuilt-sys-app,CalendarGoogle.apk,gapps/overrides/CalendarGoogle.apk,Calendar)
$(call include-prebuilt-sys-app,GoogleHome.apk,gapps/overrides/GoogleHome.apk,Launcher3 Trebuchet)
$(call include-prebuilt-sys-priv-app,Velvet.apk,gapps/overrides/Velvet.apk,QuickSearchBox)
# $(call include-prebuilt-sys-app,LatinImeGoogle.apk,gapps/overrides/LatinImeGoogle.apk,LatinIME libjni_latinime)

#include $(CLEAR_VARS)
## Module name should match apk name to be installed.
#LOCAL_MODULE := TouchPal.apk
#LOCAL_SRC_FILES := TouchPal.apk
#LOCAL_MODULE_CLASS := APPS
#LOCAL_MODULE_PATH := $(TARGET_OUT)/app
#LOCAL_CERTIFICATE := PRESIGNED
#include $(BUILD_PREBUILT)
