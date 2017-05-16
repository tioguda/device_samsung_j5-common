#!/sbin/sh
#
# Copyright (C) 2017 The LineageOS Project
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

# Detect variant and copy its specific-blobs
. /tmp/install/bin/variant_hook.sh

# Mount /system
mount_fs system

if [ $VARIANT == "j5ltexx" ]; then
	rm -rf /system/lib/hw/nfc_nci.MSM8916.so
	rm -rf /system/lib/libnfc*.so
	rm -rf /system/etc/libnfc*.conf
	rm -rf /system/etc/nfcee*.xml
	rm -rf /system/etc/permissions/com.android.nfc_extras.xml
	rm -rf /system/etc/permissions/android.hardware.nfc.xml
	rm -rf /system/etc/permissions/android.hardware.nfc.hce.xml
	rm -rf /system/priv-app/*Nfc*
	rm -rf /system/app/*Nfc*
fi
