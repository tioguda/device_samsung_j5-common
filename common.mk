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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Also get non-open-source specific aspects if available
$(call inherit-product, vendor/samsung/j5-common/j5-common-vendor.mk)

# Common overlay
DEVICE_PACKAGE_OVERLAYS += device/samsung/j5-common/overlay

# Screen density
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

# Doze
PRODUCT_PACKAGES += \
    SamsungDoze
	
# Touch issue workaround
PRODUCT_PACKAGES += \
    InputDisabler

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.primary.msm8916 \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing

# TinyAlsa utils
PRODUCT_PACKAGES += \
    tinyplay \
    tinycap \
    tinymix \
    tinypcminfo

# Display
PRODUCT_PACKAGES += \
    copybit.msm8916 \
    gralloc.msm8916 \
    hwcomposer.msm8916 \
    memtrack.msm8916 \
    libtinyxml

# Lights
PRODUCT_PACKAGES += \
    lights.msm8916

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8916
   
# Healthd packages
PRODUCT_PACKAGES += \
    charger_res_images
	
# Power
PRODUCT_PACKAGES += \
    power.msm8916
	
# Unify
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/releasetools/run_scripts.sh:install/bin/run_scripts.sh \
    $(LOCAL_PATH)/releasetools/functions.sh:install/bin/functions.sh \
    $(LOCAL_PATH)/releasetools/variant_hook.sh:install/bin/variant_hook.sh \
    $(LOCAL_PATH)/releasetools/nfc/copy_nfc_configs.sh:install/bin/nfc/copy_nfc_configs.sh

# Camera
PRODUCT_PACKAGES += \
    Snap \
    camera.msm8916 \
    libstlport \
    libboringssl-compat \
    libmm-qcamera

# GPS HAL
PRODUCT_PACKAGES += \
    gps.msm8916

# Media
PRODUCT_PACKAGES += \
    libextmedia_jni \
    libqcmediaplayer \
    libOmxVidcCommon \
    libOmxVenc \
    libOmxVdec \
    libOmxCore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libstagefrighthw

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc

# Configuration scripts
PRODUCT_PACKAGES += \
    init.qcom.bt.sh \
    init.link_ril_db.sh

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.qcom.power.rc \
    init.recovery.qcom.rc \
    ueventd.qcom.rc

# Filesystem
PRODUCT_PACKAGES += \
    fsck.f2fs

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers

# WCNSS service daemon
PRODUCT_PACKAGES += \
    libwcnss_qmi \
    wcnss_service

# ANT+
PRODUCT_PACKAGES += \
   AntHalService \
   com.dsi.ant.antradio_library \
   libantradio

# Misc
PRODUCT_PACKAGES += \
    libxml2 \
    Stk

# Misc libs
PRODUCT_PACKAGES += \
    libril_shim

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Audio calibration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/acdb/Bluetooth_cal.acdb:system/etc/Bluetooth_cal.acdb \
    $(LOCAL_PATH)/configs/audio/acdb/General_cal.acdb:system/etc/General_cal.acdb \
    $(LOCAL_PATH)/configs/audio/acdb/Global_cal.acdb:system/etc/Global_cal.acdb \
    $(LOCAL_PATH)/configs/audio/acdb/Handset_cal.acdb:system/etc/Handset_cal.acdb \
    $(LOCAL_PATH)/configs/audio/acdb/Hdmi_cal.acdb:system/etc/Hdmi_cal.acdb \
    $(LOCAL_PATH)/configs/audio/acdb/Headset_cal.acdb:system/etc/Headset_cal.acdb \
    $(LOCAL_PATH)/configs/audio/acdb/Speaker_cal.acdb:system/etc/Speaker_cal.acdb

# Media Profile
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    $(LOCAL_PATH)/keylayout/Synaptics_HID_TouchPad.idc:system/usr/idc/Synaptics_HID_TouchPad.idc \
    $(LOCAL_PATH)/keylayout/Synaptics_RMI4_TouchPad_Sensor.idc:system/usr/idc/Synaptics_RMI4_TouchPad_Sensor.idc

# GPS config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/sap.conf:system/etc/sap.conf \
    $(LOCAL_PATH)/configs/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/configs/izat.conf:system/etc/izat.conf

# GPS/location security configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:system/etc/sec_config

# Prima opensource driver files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/prima/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/configs/prima/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/configs/prima/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin

# Wi-Fi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf
    
# Config files for hostapd
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/configs/wifi/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/configs/wifi/hostapd.deny:system/etc/hostapd/hostapd.deny

# SoftAP
PRODUCT_PACKAGES += \
    libcurl \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    hostapd \
    wcnss_service

# CRDA
PRODUCT_PACKAGES += \
    crda \
    linville.key.pub.pem \
    regdbdump \
    regulatory.bin

# WPA supplicant
PRODUCT_PACKAGES += \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf
	
# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=J5RIL

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Default property overrides
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    persist.sys.isUsbOtgEnabled=true

# Common qcom
$(call inherit-product, device/samsung/qcom-common/qcom-common.mk)

# Dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)