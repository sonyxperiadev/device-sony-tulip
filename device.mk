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

DEVICE_PACKAGE_OVERLAYS += \
    device/sony/tulip/overlay

PRODUCT_COPY_FILES := \
    device/sony/tulip/rootdir/system/etc/sensor/sensord_cfg_axis.txt:system/etc/sensor/sensord_cfg_axis.txt \
    device/sony/tulip/rootdir/system/etc/thermanager.xml:system/etc/thermanager.xml \
    device/sony/tulip/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    device/sony/tulip/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    device/sony/tulip/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml

# Device Init
PRODUCT_PACKAGES += \
    init.recovery.tulip \
    init.tulip \
    ueventd.tulip

# Lights
PRODUCT_PACKAGES += \
    lights.tulip

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
$(call inherit-product, vendor/sony/kanuti-tulip/tulip-vendor.mk)
