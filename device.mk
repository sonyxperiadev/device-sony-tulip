# Copyright 2014 The Android Open Source Project
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

# Device path
DEVICE_PATH := device/sony/tulip/rootdir

DEVICE_PACKAGE_OVERLAYS += \
    device/sony/tulip/overlay

# Device Specific Permissions
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml

# Device Sensors
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/system/etc/sensor/sensord_cfg_axis.txt:system/etc/sensor/sensord_cfg_axis.txt

# Thermal Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/etc/thermanager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/thermanager.xml

# Audio Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/etc/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \
    $(DEVICE_PATH)/vendor/etc/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# NFC Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/etc/libnfc-brcm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-brcm.conf \
    $(DEVICE_PATH)/vendor/etc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

# Device Init
PRODUCT_PACKAGES += \
    fstab.tulip \
    init.recovery.tulip \
    init.tulip \
    ueventd.tulip

# Simple PowerHAL
PRODUCT_PACKAGES += \
    power.tulip

# NFC config
PRODUCT_PACKAGES += \
    nfc_nci.tulip

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=320 \
    ro.usb.pid_suffix=1C4

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/kanuti/platform.mk)

# include board vendor blobs
$(call inherit-product-if-exists, vendor/sony/kanuti-tulip/tulip-vendor.mk)

# copy NFC firmware
$(call inherit-product-if-exists, vendor/nxp/nxp-vendor.mk)

# include optional vendor configuration
$(call inherit-product-if-exists, vendor/qcom/proprietary/common/build/qcom-packages.mk)
