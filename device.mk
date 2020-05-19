# Copyright (C) 2013-2016, The CyanogenMod Project
# Copyright (C) 2017-2018, The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Inherit from vendor
$(call inherit-product-if-exists, vendor/zuk/z2_plus/z2_plus-vendor.mk)

# Inherit from msm8996-common
$(call inherit-product, device/zuk/msm8996-common/msm8996.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Ramdisk
PRODUCT_PACKAGES += \
    init.zuk.rc

# Misc
PRODUCT_PACKAGES += \
    libdrm \
    libion \
    vendor.display.config@1.7

# init scripts
PRODUCT_PACKAGES += \
    init.halium.rc \
    init.disabled.rc \
    on-post-data.sh
   

# Media
PRODUCT_PACKAGES += \
    libmedia_omx \
    android.frameworks.displayservice@1.0 \
    drmserver \
    mediadrmserver \
    mediaextractor


# UBPorts
PRODUCT_PACKAGES += \
    libion \
    libmedia_compat_layer \
    libui_compat_layer \
    libsf_compat_layer 

#  droidmedia
PRODUCT_PACKAGES += \
    libdroidmedia \
    minimediaservice \
    minisfservice \
    miniafservice 


# Ubuntu
PRODUCT_PACKAGES += \
    libbiometry_fp_api \
    libubuntu_application_api

PRODUCT_PACKAGES += \
    sensorservice

# Disable FakeSensorServer so UBports can use it
MINIMEDIA_SENSORSERVER_DISABLE := 1


# Vendor properties
-include $(LOCAL_PATH)/vendor_prop.mk
