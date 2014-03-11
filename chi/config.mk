#ADDITIONAL_DEFAULT_PROPERTIES += \
    #ro.adb.secure=0

#PRODUCT_BUILD_PROP_OVERRIDES += \
    #ro.adb.secure=0
    #ro.secure=0

# custom overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
