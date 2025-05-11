# 🛡️ Cromite WebView Magisk Module

![GitHub License](https://img.shields.io/badge/license-Apache%202.0-blue)
![Android Version](https://img.shields.io/badge/Android-8.0%2B-brightgreen)
![Magisk Version](https://img.shields.io/badge/Magisk-20.4%2B-orange)
![KernelSU Support](https://img.shields.io/badge/KernelSU-Compatible-success)

> The ultimate privacy-focused WebView solution for rooted Android devices



## 🌟 Why Cromite Over Stock WebView?
| Feature | Stock WebView | Cromite WebView |
|---------|--------------|-----------------|
| **Privacy Protection** | Basic | Advanced tracking protection |
| **Ad Blocking** | None | Built-in ad blocker |
| **HTTPS Upgrades** | Limited | Forces HTTPS where possible |
| **Script Control** | Minimal | Granular script blocking |
| **Fingerprinting** | Vulnerable | Anti-fingerprinting measures |
| **Update Frequency** | Monthly | Weekly security updates |


## 📦 Features
| Feature | Description |
|---------|-------------|
| **Privacy First** | Built on Chromium with enhanced protections |
| **Systemless** | No system partition modifications |
| **Auto-Recovery** | Fallback to stock WebView if issues occur |
| **Dual Root** | Supports Magisk & KernelSU |
| **Update Safe** | Survives OTA updates |

## ⚙️ Installation


### Method 1: Magisk/KernelSU (Recommended)
1. Download the latest release from [Releases](https://github.com/Rootalith/CromiteWebView-Magisk/releases)
2. Open Magisk/KernelSU app
3. Tap **Install → Install from storage**
4. Select the downloaded zip
5. Reboot your device

### Method 2: Manual Installation (Recovery)
```bash
adb push CromiteWebView-Magisk.zip /sdcard/
adb reboot recovery
```
- In recovery:  
  `Install → Select zip → Swipe to confirm`

### Method 3: Manual Installation (Termux)
```bash
# Download module
wget https://github.com/Rootalith/CromiteWebView-Magisk/releases/download/v1.0/CromiteWebView-Magisk.zip

# Install via Magisk
su -c "magisk --install-module /path/to/CromiteWebView-Magisk.zip"

# Or manually extract
unzip CromiteWebView-Magisk.zip -d /data/adb/modules/cromite_webview
```

### Post-Install Verification
```bash
su -c "cmd webviewupdate get-current-webview-package"
# Should return: com.android.webview
```

### Uninstallation
1. Remove via Magisk/KernelSU app  
   **OR**  
2. Run:  
   ```bash
   su -c "rm -rf /data/adb/modules/cromite_webview
   
```

## 📊 ROM Compatibility
| ROM | Status | Notes |
|-----|--------|-------|
| Evolution X | ✅ Fully Working | Tested on v9.7 |
| LineageOS | ✅ Working | Needs GApps |
| Pixel Experience | ✅ Working | - |
| MIUI | ⚠️ Partial | Requires config changes |
| AOSP | ✅ Working | Android 8.0+ |

## 🏗️ Technical Details
### Module File Structure
```text
CromiteWebView-Magisk/
│
├── META-INF/com/google/android/
│   ├── update-binary
│   └── updater-script
│
├── system/
│   ├── etc/
│   │   ├── init/webview-zygote.rc
│   │   ├── permissions/webview.xml
│   │   ├── sysconfig/
│   │   │   ├── webview-config.xml
│   │   │   └── webview-hiddenapi-package-allowlist.xml
│   │   └── webview/providers.allowlist.xml
│   │
│   └── priv-app/WebViewGoogle/
│       └── CromiteWebView.apk
│
├── common/
│   └── uninstall.sh
│
├── customize.sh
├── module.prop
├── post-fs-data.sh
└── zygote.sh
```

### Key Components
```properties
# module.prop
id=cromite-webview
name=Cromite WebView
version=v1.0
versionCode=1
author=Rootalith
description=Privacy-enhanced WebView solution
```

## 🔍 Verification
```bash
# Check active WebView
su -c "cmd webviewupdate get-current-webview-package"

# Verify version
su -c "dumpsys package com.android.webview | grep versionName"
```

## 🚨 Troubleshooting
| Issue | Solution |
|-------|----------|
| WebView not switching | `su -c "pm disable com.google.android.webview"` |
| App crashes | Clear WebView data in Settings > Apps |
| Installation fails | Check `/data/adb/magisk_debug.log` |



## 📜 Changelog
### v1.0
- Initial release
- Cromite 135.0.7049.58
- Full Magisk/KernelSU support
- Tested on Evolution X, LineageOS, AOSP

## ⚠️ Disclaimer
> **Warning**  
> This module modifies system components.  
> Backup your data before installation.

## 🌟 Credits
- [Cromite Project](https://github.com/uazo/cromite)
- [Magisk](https://github.com/topjohnwu/Magisk) by topjohnwu
- [KernelSU](https://github.com/tiann/KernelSU) Team

## 📄 License
```text
Copyright 2024 Rootalith

Licensed under the Apache License, Version 2.0
You may not use this file except in compliance with the License.
```