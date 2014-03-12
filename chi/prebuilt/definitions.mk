define all-apk-files-under
    $(shell cd $(LOCAL_PATH) ; \
          find -L $(1) -name "*.apk" | xargs -n 1 basename)
endef

define all-so-files-under
    $(shell cd $(LOCAL_PATH) ; \
          find -L $(1) -name "*.so" | xargs -n 1 basename)
endef

# include-copy-all-files, from, to
# copy all files from "from", and replace the path to "to" as the dest path
# eg. when from = "xxx/yyy" and to = "zzz" then copy file "xxx/yyy/foo/bar" to "zzz/foo/bar"
define include-copy-all-files
    $(shell cd $(LOCAL_PATH); \
	find -L $(1) -type f | sed -e 's~$(strip $(1))/\(.*\)~$(LOCAL_PATH)/$(strip $(1))/\1:$(strip $(2))/\1~')
endef

define include-prebuilt-app
    include $$(CLEAR_VARS)
    LOCAL_MODULE := $(1)
    LOCAL_SRC_FILES := $(2)
    LOCAL_MODULE_CLASS := APPS
    LOCAL_MODULE_PATH := $(3)
    LOCAL_OVERRIDES_PACKAGES := $(4)
    LOCAL_CERTIFICATE := PRESIGNED
    include $$(BUILD_PREBUILT)
endef

define include-prebuilt-so
    include $$(CLEAR_VARS)
    LOCAL_MODULE := $(1)
    LOCAL_SRC_FILES := $(2)
    LOCAL_MODULE_CLASS := SHARED_LIBRARIES
    LOCAL_CERTIFICATE := PRESIGNED
    include $$(BUILD_PREBUILT)
endef

define include-prebuilt-data-app
$(eval $(call include-prebuilt-app, $(1), $(2), $(TARGET_OUT_DATA_APPS), $(3)))
endef

define include-prebuilt-sys-app
$(eval $(call include-prebuilt-app, $(1), $(2), $(TARGET_OUT)/app, $(3)))
endef

define include-prebuilt-sys-priv-app
$(eval $(call include-prebuilt-app, $(1), $(2), $(TARGET_OUT)/priv-app, $(3)))
endef

define include-all-apk-under-data
$(foreach apk, $(call all-apk-files-under, $(1)), $(call include-prebuilt-data-app, $(apk), $(1)/$(apk), $(2)))
endef

define include-all-apk-under-sys
$(foreach apk, $(call all-apk-files-under, $(1)), $(call include-prebuilt-sys-app, $(apk), $(1)/$(apk), $(2)))
endef

define include-all-apk-under-sys-priv
$(foreach apk, $(call all-apk-files-under, $(1)), $(call include-prebuilt-sys-priv-app, $(apk), $(1)/$(apk), $(2)))
endef

define include-all-so
$(foreach so, $(call all-so-files-under, $(1)), $(eval $(call include-prebuilt-so, $(so), $(1)/$(so))))
endef

