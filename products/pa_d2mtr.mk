# Copyright (C) 2012 ParanoidAndroid Project
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

# Check for target product
ifeq (pa_d2mtr,$(TARGET_PRODUCT))

# Define PA bootanimation size
PARANOID_BOOTANIMATION_NAME := XHDPI

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_d2xx

# Build paprefs from sources
PREFS_FROM_SOURCE ?= false

# Include ParanoidAndroid common configuration
include vendor/pa/config/pa_common.mk
# inherit from common d2
-include device/samsung/d2-common/BoardConfigCommon.mk
# inherit from the proprietary version
-include vendor/samsung/d2mtr/BoardConfigVendor.mk


# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# Inherit from d2usc device
$(call inherit-product, device/samsung/d2mtr/device.mk)
$(call inherit-product, device/samsung/d2mtr/full_d2mtr.mk)
# CM Package Extras
-include vendor/pa/packages/cm.mk
# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/cdma.mk)
# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)


# Override AOSP build properties
PRODUCT_NAME := pa_d2mtr
PRODUCT_DEVICE := d2mtr
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SCH-R530M
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=d2mtr TARGET_DEVICE=d2mtr BUILD_FINGERPRINT="samsung/d2mtr/d2mtr:4.0.4/IMM76D/R530MVQALJ1:user/release-keys" PRIVATE_BUILD_DESC="d2mtr-user 4.0.4 IMM76D R530MVQALJ1 release-keys"

# Update local_manifest.xml
GET_VENDOR_PROPS := $(shell vendor/pa/tools/getvendorprops.py $(PRODUCT_NAME))
GET_PROJECT_RMS := $(shell vendor/pa/tools/removeprojects.py $(PRODUCT_NAME))
GET_PROJECT_ADDS := $(shell vendor/pa/tools/addprojects.py $(PRODUCT_NAME))
GET_CM_PROJECT_ADDS := $(shell vendor/pa/tools/addprojects.py cm.adds)

endif
