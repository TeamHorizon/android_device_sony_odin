#
# Copyright (C) 2013 The CyanogenMod Project
#           (C) 2017 The LineageOS Project
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
# Release name
PRODUCT_RELEASE_NAME := odin

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device
$(call inherit-product, device/sony/odin/device.mk)

# Inherit common product files.
$(call inherit-product, vendor/xenonhd/config/common_full_phone.mk)

# Device display
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Set those variables here to overwrite the inherited values.
BOARD_VENDOR := sony
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := odin
PRODUCT_NAME := xenonhd_odin
PRODUCT_MANUFACTURER := Sony
PRODUCT_MODEL := Xperia ZL

# Device Maintainer
PRODUCT_PROPERTY_OVERRIDES += ro.xenonhd.maintainer="AlexM0rtis"
TARGET_VENDOR := 

# Root options
ROOT_METHOD=magisk
# Without any of these flags the builds will be unrooted and won't include Adaway & KernelAdiutor

# 3rd party apps - choose which you want to build
PRODUCT_PACKAGES += \
    Adaway \
    KernelAdiutor \
    MiXplorer
    
# Camera
PRODUCT_PACKAGES += \
  Snap

# Use the latest approved GMS identifiers unless running a signed build
ifneq ($(SIGN_BUILD),true)
PRODUCT_BUILD_PROP_OVERRIDES += \
  PRODUCT_NAME=C6503 \
  TARGET_DEVICE=odin \
  BUILD_FINGERPRINT=Sony/C6503/C6503:5.1.1/10.7.A.0.228/3219080026:user/release-keys \
  PRIVATE_BUILD_DESC="C6503-user 5.1.1 10.7.A.0.228 3219080026 release-keys"
endif
