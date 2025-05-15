# 🛡️ Cromite WebView Magisk Module

[![Telegram Channel](https://img.shields.io/badge/Telegram-Join_Channel-2CA5E0?style=for-the-badge&logo=telegram)](https://t.me/cromitewebview)
![License](https://img.shields.io/badge/license-Apache%202.0-blue?style=for-the-badge)
![Android](https://img.shields.io/badge/Android-8.0%2B-brightgreen?style=for-the-badge)
![Magisk](https://img.shields.io/badge/Magisk-20.4%2B-orange?style=for-the-badge)
![KernelSU](https://img.shields.io/badge/KernelSU-Compatible-success?style=for-the-badge)

```text
  ____                     _ _     __        __   _  __     ___               
 / ___|___  _ __ _ __ ___ (_) |_ __\ \      / /__| |_\ \   / (_) _____      __
| |   / _ \| '__| '_ ` _ \| | __/ _ \ \ /\ / / _ \ '_ \ \ / /| |/ _ \ \ /\ / /
| |__| (_) | |  | | | | | | | ||  __/\ V  V /  __/ |_) \ V / | |  __/\ V  V / 
 \____\___/|_|  |_| |_| |_|_|\__\___| \_/\_/ \___|_.__/ \_/  |_|\___| \_/\_/  
                                                                              
 __  __             _     _      __  __           _       _      
|  \/  | __ _  __ _(_)___| | __ |  \/  | ___   __| |_   _| | ___ 
| |\/| |/ _` |/ _` | / __| |/ / | |\/| |/ _ \ / _` | | | | |/ _ \
| |  | | (_| | (_| | \__ \   <  | |  | | (_) | (_| | |_| | |  __/
|_|  |_|\__,_|\__, |_|___/_|\_\ |_|  |_|\___/ \__,_|\__,_|_|\___|
              |___/                                              
```

> The ultimate privacy-focused WebView solution for rooted Android devices

## 🌟 Key Features
| Privacy Features | Technical Features |
|-----------------|-------------------|
| ✅ Built-in ad/tracker blocking | ✅ Systemless installation |
| ✅ HTTPS enforcement | ✅ Auto-recovery fallback |
| ✅ Anti-fingerprinting | ✅ Dual root support |
| ✅ Script control | ✅ Weekly security updates |

## ⚙️ Installation
### Recommended Method (Magisk/KernelSU):
1. Download from [Releases](https://github.com/Rootalith/CromiteWebView-Magisk/releases)
2. Install via your root manager app
3. Reboot device

### Alternative Methods:
<details>
<summary><b>Recovery Mode</b></summary>

```bash
adb push CromiteWebView-Magisk.zip /sdcard/
adb reboot recovery
```
Then flash via recovery menu.
</details>

<details>
<summary><b>Manual Build from Source</b></summary>

```bash
git clone https://github.com/Rootalith/CromiteWebView-Magisk.git
cd CromiteWebView-Magisk
zip -r CromiteWebView-Magisk.zip * -x ".git*" "README.md"
su -c "magisk --install-module CromiteWebView-Magisk.zip"
```
</details>

## 📜 License Compliance
- **Module Code**: Apache-2.0
- **Bundled Cromite**: GPL-3.0
- Complete licensing details in:
  - [`NOTICE`](NOTICE) 
  - [`3rd-party-licenses/`](3rd-party-licenses/)

## 📊 Compatibility Matrix
| ROM | Status | Notes |
|-----|--------|-------|
| Evolution X | ✅ Full support | Tested v9.7+ |
| LineageOS | ✅ Works | ✅ Works |
| DrepFest | ✅ Works |  Tested 15.1 |
| MIUI | ⚠️ Not Tested | Not Tested |
| Stock AOSP | ✅ Full support | Android 8.0+ |

## 🏗️ Module Structure
<details>
<summary><b>Click to view file structure</b></summary>

```text
CromiteWebView-Magisk/
├── META-INF/com/google/android/
│   ├── update-binary
│   └── updater-script
├── system/
│   └── priv-app/WebViewGoogle/
│       └── CromiteWebView.apk  # GPL-3.0
├── module.prop                # Apache-2.0
└── [other support files]
```
</details>

## 🔍 Post-Install Verification
```bash
# Verify active WebView
su -c "cmd webviewupdate get-current-webview-package"

# Check version
su -c "dumpsys package com.android.webview | grep versionName"
```

## 🚨 Troubleshooting Guide
| Symptom | Solution |
|---------|----------|
| WebView not switching | Run: `su -c "pm disable com.google.android.webview"` |
| App crashes | Clear WebView data in Settings > Apps |
| Installation fails | Check `/data/adb/magisk_debug.log` |

## 📜 Version History
| Version | Highlights |
|---------|------------|
| v1.0 | Initial release with Cromite 135.0.7049.58 |

## ⚠️ Important Notice
> This module modifies core system components.  
> **Always backup your data before installation.**

[➡️ Full Documentation](https://github.com/Rootalith/CromiteWebView-Magisk/wiki) | 
[📢 Support Channel](https://t.me/cromitewebview)
```
