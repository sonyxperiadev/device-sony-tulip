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

include device/sony/kanuti/PlatformConfig.mk

TARGET_BOOTLOADER_BOARD_NAME := E2303

BOARD_KERNEL_CMDLINE += androidboot.hardware=tulip

# Platform
PRODUCT_PLATFORM := kanuti

# Recovery config
BOARD_SONY_INIT_FLAGS += -DDEV_BLOCK_FOTA_NUM="21"
