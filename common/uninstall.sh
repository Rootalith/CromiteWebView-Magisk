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

# Re-enable original WebViews
for pkg in $(pm list packages -d | grep -E 'webview|chromium' | sed 's/package://g'); do
    pm enable "$pkg"
    pm unhide "$pkg"
done

# Remove markers
find /data/adb/modules/cromite_webview/system -name '.replace' -delete
find /data/adb/modules/cromite_webview/system -name '.disable' -delete

# Clear data and restart
pm clear com.android.webview
am force-stop com.android.webview

# Reset properties
resetprop -n --delete ro.com.android.webview.provider
resetprop -n --delete ro.com.google.android.webview.provider