#!/system/bin/sh
#
# Copyright 2024 Rootalith
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
MODDIR=${0%/*}

# Force Cromite on zygote start
cmd webviewupdate set-webview-implementation com.android.webview
settings put global webview_provider com.android.webview

# Ensure proper SELinux context
chcon -R u:object_r:system_file:s0 "$MODDIR/system"