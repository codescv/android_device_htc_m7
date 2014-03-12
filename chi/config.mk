#ADDITIONAL_DEFAULT_PROPERTIES += \
    #ro.adb.secure=0

#PRODUCT_BUILD_PROP_OVERRIDES += \
    #ro.adb.secure=0
    #ro.secure=0

# custom overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# use teamseven kernel
TARGET_KERNEL_CONFIG := teamseven_m7_defconfig

# prebuilt packages
$(call inherit-product-if-exists, $(LOCAL_PATH)/prebuilt/package_select.mk)
