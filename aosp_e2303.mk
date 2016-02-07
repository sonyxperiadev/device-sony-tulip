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

TARGET_KERNEL_CONFIG := aosp_kanuti_tulip_defconfig

DEVICE_PACKAGE_OVERLAYS += \
    device/sony/tulip/overlay

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, device/sony/kanuti/platform.mk)
$(call inherit-product, vendor/sony/tulip/tulip-vendor.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

PRODUCT_COPY_FILES += \
    device/sony/tulip/rootdir/system/etc/sensor/sensord_cfg_axis.txt:system/etc/sensor/sensord_cfg_axis.txt \
    device/sony/tulip/rootdir/system/etc/thermanager.xml:system/etc/thermanager.xml \
    device/sony/tulip/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    device/sony/tulip/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    device/sony/tulip/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_NAME := aosp_e2303
PRODUCT_DEVICE := tulip
PRODUCT_MODEL := Xperia M4 Aqua (AOSP)
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320 \
    ro.usb.pid_suffix=1C4
