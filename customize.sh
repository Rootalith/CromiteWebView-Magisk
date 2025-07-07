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

SKIPUNZIP=0
ASH_STANDALONE=1

print_modname() {
  ui_print "*******************************"
  ui_print "     Cromite WebView Module    "
  ui_print "*******************************"
}

on_install() {
  ui_print "- Extracting module files"
  
  # Create required directories
  mkdir -p $MODPATH/system/priv-app/WebViewGoogle
  
  # Install APK to /data/app first to create necessary files
  ui_print "- Installing Cromite WebView to data partition"
  pm install -r "$MODPATH/system/priv-app/WebViewGoogle/CromiteWebView.apk"
  
  # Copy to system
  ui_print "- Installing to system partition"
  cp -f "$MODPATH/system/priv-app/WebViewGoogle/CromiteWebView.apk" "$MODPATH/system/priv-app/WebViewGoogle/CromiteWebView.apk"

  # Set permissions
  ui_print "- Setting permissions" 
  set_perm_recursive $MODPATH 0 0 0755 0644
  set_perm_recursive $MODPATH/system/priv-app/WebViewGoogle 0 0 0755 0644
  set_perm $MODPATH/system/priv-app/WebViewGoogle/CromiteWebView.apk 0 0 0644

  # Wait for app data creation
  sleep 3

  # Disable stock WebViews
  ui_print "- Disabling stock WebView providers"
  pm disable-user com.google.android.webview >/dev/null 2>&1
  pm disable-user com.android.webview >/dev/null 2>&1

  # Configure WebView provider
  ui_print "- Setting Cromite as default WebView"
  cmd webviewsetup enable com.cromite.webview

  ui_print "- Installation completed"
  ui_print "- Rebooting device in 5 seconds..."
  sleep 5
  reboot
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
  set_perm_recursive $MODPATH/system/priv-app/WebViewGoogle 0 0 0755 0644
  set_perm $MODPATH/system/priv-app/WebViewGoogle/CromiteWebView.apk 0 0 0644
}

check_device_compatibility() {
  if [ "$API" -lt 21 ]; then
    abort "! Unsupported Android version. Requires Android 5.0 (API 21) or above"
  fi

  # Check if source APK exists
  if [ ! -f "$MODPATH/system/priv-app/WebViewGoogle/CromiteWebView.apk" ]; then
    abort "! CromiteWebView.apk not found in module path"
  fi
}

# Main
check_device_compatibility
on_install
set_permissions
# SDK Version Check
MIN_SDK=26
CURRENT_SDK=$(getprop ro.build.version.sdk)

if [ "$CURRENT_SDK" -lt "$MIN_SDK" ]; then
  ui_print "! Android 8.0 (SDK 26) required"
  abort
fi
