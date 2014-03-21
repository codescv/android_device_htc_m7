include $(LOCAL_PATH)/definitions.mk

PRODUCT_PACKAGES += \
    $(call all-apk-files-under, apps) \
    $(call all-apk-files-under, gapps/system/app) \
    $(call all-apk-files-under, gapps/system/priv-app) \
    $(call all-so-files-under, gapps/system/lib) \
    Chrome.apk \
    Velvet.apk \
    CalendarGoogle.apk
    #GoogleHome.apk \

PRODUCT_COPY_FILES += \
    $(call include-copy-all-files, gapps/system/framework, system/framework) \
    $(call include-copy-all-files, gapps/system/lib, system/lib) \
    $(call include-copy-all-files, system, system)

#$(call include-copy-all-files, gapps/system/etc, system/etc) \
#$(warning >>>>>>> copy files: $(call include-copy-all-files, gapps/system/etc,    system/etc))
#$(warning >>>>>>> copy files: $(call include-copy-all-files, "gapps/system/lib",   "system/lib"))
