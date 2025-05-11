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
### Via Magisk Manager
```bash
1. Download latest release
2. Open Magisk/KernelSU app
3. Install from storage
4. Reboot device
```

### ADB Method
```bash
adb push CromiteWebView-Magisk.zip /sdcard/
adb shell su -c "magisk --install-module /sdcard/CromiteWebView-Magisk.zip"
adb reboot
```

## 📊 ROM Compatibility
| ROM | Status | Notes |
|-----|--------|-------|
| Evolution X | ✅ Fully Working | Tested on v9.7 |
| LineageOS | ✅ Working | Needs  |
| Pixel Experience | ✅ Working | - |


## 🏗️ Technical Details
## Module File Structure

<pre>
<span style="color:#569CD6">CromiteWebView-Magisk/</span>
│
├── <span style="color:#9CDCFE">META-INF/com/google/android/</span>
│   ├── <span style="color:#D8D8D8">update-binary</span>
│   └── <span style="color:#D8D8D8">updater-script</span>
│
├── <span style="color:#9CDCFE">system/</span>
│   ├── <span style="color:#9CDCFE">etc/</span>
│   │   ├── <span style="color:#9CDCFE">init/</span><span style="color:#D8D8D8">webview-zygote.rc</span>
│   │   ├── <span style="color:#9CDCFE">permissions/</span><span style="color:#D8D8D8">webview.xml</span>
│   │   ├── <span style="color:#9CDCFE">sysconfig/</span>
│   │   │   ├── <span style="color:#D8D8D8">webview-config.xml</span>
│   │   │   └── <span style="color:#D8D8D8">webview-hiddenapi-package-allowlist.xml</span>
│   │   └── <span style="color:#9CDCFE">webview/</span><span style="color:#D8D8D8">providers.allowlist.xml</span>
│   │
│   └── <span style="color:#9CDCFE">priv-app/WebViewGoogle/</span>
│       └── <span style="color:#CE9178">CromiteWebView.apk</span>
│
├── <span style="color:#9CDCFE">common/</span>
│   └── <span style="color:#D8D8D8">uninstall.sh</span>
│
├── <span style="color:#D8D8D8">customize.sh</span>
├── <span style="color:#D8D8D8">module.prop</span>
├── <span style="color:#D8D8D8">post-fs-data.sh</span>
└── <span style="color:#D8D8D8">zygote.sh</span>
</pre>
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