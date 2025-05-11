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

# Force Cromite as default
resetprop -n ro.com.android.webview.provider com.android.webview
resetprop -n ro.com.google.android.webview.provider com.android.webview
settings put global webview_provider com.android.webview

# Android 10+ specific
if [ "$(getprop ro.build.version.sdk)" -ge 29 ]; then
    cmd webviewupdate set-webview-implementation com.android.webview
fi

# Disable competitors
for pkg in $(pm list packages | grep -E 'webview|chromium' | sed 's/package://g'); do
    if [ "$pkg" != "com.android.webview" ]; then
        pm disable "$pkg"
        pm disable-user "$pkg"
        pm hide "$pkg"
    fi
done

# Kill WebView processes
pkill -f "webview"
pkill -f "webview_zygote"