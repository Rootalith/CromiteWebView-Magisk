```markdown
# Cromite WebView Magisk Module

A robust Magisk/KernelSU module that replaces the system WebView with Cromite - a privacy-focused Chromium fork. Implements secure installation methods with proper permission handling and clean uninstallation.

## Core Features

- **Safe Installation**: Proper permission and SELinux context handling
- **Clean Integration**: Replaces stock WebView without system modification
- **Automatic Recovery**: Fallback to stock WebView if issues occur
- **Update Friendly**: Preserves functionality across ROM updates
- **Multiple Root Support**: Works with both Magisk and KernelSU

## Requirements

- Android 8.0+ (API 26+)
- Magisk 20.4+ or KernelSU
- Unlocked bootloader
- Root access

## Installation

### Via Magisk Manager
1. Download latest release zip
2. Open Magisk Manager
3. Tap Modules → Install from storage
4. Select downloaded zip
5. Reboot device

### Manual Installation
```bash
# Clone repository
git clone https://github.com/yourusername/cromite-webview-module

# Build module
cd cromite-webview-module
zip -r CromiteWebView.zip .

# Install via recovery or Magisk
```

## Implementation Details

### Critical Files

#### 1. module.prop
```properties
id=cromite-webview
name=Cromite WebView
version=v1.0.0
versionCode=1
author=Selven-1
description=Replaces system WebView with Cromite
```

#### 2. customize.sh
```bash
#!/system/bin/sh
SKIPUNZIP=1

# Set permissions
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm_recursive $MODPATH/system/priv-app 0 0 0755 0644
set_perm $MODPATH/system/priv-app/WebViewGoogle/CromiteWebView.apk 0 0 0644

# SELinux contexts
chcon -R u:object_r:system_file:s0 $MODPATH/system
```

#### 3. post-fs-data.sh
```bash
#!/system/bin/sh
MODDIR=${0%/*}

# Disable stock WebView
pm disable com.google.android.webview
pm disable com.android.webview

# Install Cromite
pm install -r "$MODDIR/system/priv-app/WebViewGoogle/CromiteWebView.apk"

# Set as default
cmd webviewupdate set-webview-implementation com.android.webview
```

#### 4. uninstall.sh  
```bash
#!/system/bin/sh

# Restore stock WebView
pm enable com.google.android.webview
pm enable com.android.webview

# Clean up
rm -rf /data/app/com.android.webview*
```

### XML Configurations

#### webview.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<webviewproviders>
    <webviewprovider 
        description="Cromite WebView"
        packageName="com.android.webview"
        availableByDefault="true">
    </webviewprovider>
</webviewproviders>
```

## File Structure
```
cromite-webview-module/
├── LICENSE
├── META-INF/
│   └── com/
│       └── google/
│           └── android/
│               └── update-binary
├── customize.sh
├── module.prop
├── post-fs-data.sh
├── system/
│   ├── etc/
│   │   └── webview.xml
│   └── priv-app/
│       └── WebViewGoogle/
│           └── CromiteWebView.apk
└── uninstall.sh
```

## Verification

Check current WebView provider:
```bash
su -c "cmd webviewupdate get-current-webview-package"
# Should return: com.android.webview
```

## Troubleshooting

### Common Issues

1. **WebView Not Switching**
```bash
# Force disable stock WebView
su -c "pm disable com.google.android.webview"
su -c "pm disable com.android.webview"
```

2. **Installation Fails**
- Check Magisk logs
- Verify device compatibility
- Ensure sufficient storage space

3. **Apps Crashing**
- Clear WebView data
- Verify Cromite installation
- Check SELinux status

## License

```
Copyright 2024 Your Name

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

## Disclaimer

THIS SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND. BY USING THIS SOFTWARE YOU ACKNOWLEDGE:

- Risk of device malfunction
- Possible warranty voiding
- Potential data loss
- Need for proper backup
- Your responsibility for any damages

## Support

- Open issues on GitHub
- Join discussion on XDA
- Check release notes for updates

## Credits

- [Cromite Project](https://github.com/uazo/cromite)
- Magisk by topjohnwu
- KernelSU Team
- Android Open Source Project

---

**Note**: Always test on a backup device first and maintain proper backups before installation.

# CromiteWebView-Magisk
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## About
Systemless Cromite WebView installer compatible with Magisk and KernelSU.

## License
Licensed under the [Apache License 2.0](LICENSE)