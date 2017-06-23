# Copyright (C) 2015 The CyanogenMod Project
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

# inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/j5-common

# Platform
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno306
TARGET_BOOTLOADER_BOARD_NAME := MSM8916

# Arch
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_CORTEX_A53 := true

TARGET_SPECIFIC_HEADER_PATH := device/samsung/j5-common/include

# Text Relocations
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Kernel
TARGET_KERNEL_ARCH           := arm
BOARD_DTBTOOL_ARG            := -2
BOARD_KERNEL_CMDLINE         := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci
BOARD_KERNEL_BASE            := 0x80000000
BOARD_KERNEL_OFFSET          := 0x00008000
BOARD_RAMDISK_OFFSET         := 0x02000000
BOARD_KERNEL_TAGS_OFFSET     := 0x01e00000
BOARD_KERNEL_SEPARATED_DT    := true
BOARD_CUSTOM_BOOTIMG_MK      := hardware/samsung/mkbootimg.mk
BOARD_KERNEL_PAGESIZE        := 2048
BOARD_FLASH_BLOCK_SIZE       := 131072
BLOCK_BASED_OTA              := true

# Malloc Implementation
MALLOC_SVELTE := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/j5-common/configs/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Release Tools
TARGET_RELEASETOOLS_EXTENSIONS := $(LOCAL_PATH)/releasetools

# CMHW
BOARD_HARDWARE_CLASS += device/samsung/j5-common/cmhw

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
TARGET_QCOM_AUDIO_VARIANT := caf
USE_CUSTOM_AUDIO_POLICY := 1

# Boot animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Enable QCOM FM feature
TARGET_QCOM_NO_FM_FIRMWARE := true
BOARD_HAVE_QCOM_FM := true
AUDIO_FEATURE_ENABLED_FM := true

# Custom RIL class
BOARD_RIL_CLASS := ../../../device/samsung/j5-common/ril/
USE_DEVICE_SPECIFIC_DATASERVICES := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGER_ENABLE_SUSPEND := true

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_PROVIDES_WCNSS_QMI        := true
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_CTRL           := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_MAX_PARTITIONS := 65

# Camera
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Workaround to avoid issues with legacy liblights on QCOM platforms
TARGET_PROVIDES_LIBLIGHT := true

# Qcom
#TARGET_USES_NEW_ION_API := true
HAVE_SYNAPTICS_I2C_RMI4_FW_UPGRADE := true
TARGET_USES_QCOM_BSP := true
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
TARGET_GLOBAL_CFLAGS += -DQCOM_BSP
BOARD_USES_QC_TIME_SERVICES := true

# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := true

# Media
TARGET_QCOM_MEDIA_VARIANT := caf
#TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Enable HW based full disk encryption
TARGET_HW_DISK_ENCRYPTION := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true
TARGET_SWV8_DISK_ENCRYPTION := true 

# Display
TARGET_CONTINUOUS_SPLASH_ENABLED := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    $(LOCAL_PATH)/sepolicy

# Misc.
TARGET_SYSTEM_PROP := device/samsung/j5-common/system.prop

# Keys
BOARD_HAS_NO_SELECT_BUTTON := true

# Storage
#RECOVERY_VARIANT := twrp
TARGET_RECOVERY_FSTAB := device/samsung/j5-common/rootdir/etc/fstab.qcom
BOARD_MTP_DEVICE := "/dev/mtp_usb"
RECOVERY_SDCARD_ON_DATA := true
TARGET_USERIMAGES_USE_F2FS := true

# TWRP Support - Optional
ifeq ($(RECOVERY_VARIANT),twrp)
-include $(LOCAL_PATH)/twrp.mk
endif

# Misc.
BOARD_USES_MMC_UTILS := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_HAS_NO_MISC_PARTITION := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
BOARD_RECOVERY_SWIPE := true

# Toolchain
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
