#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

# objcffi cases' xcode-project execution chain (real-device domain).
# Invoked by run_ios_dispatch.sh (entered when the RUN expansion contains
# .dylib); run_ios.py performs xcodebuild packaging (project signing skipped)
# -> full-chain signing with the keychain development identity against the
# profile entitlements -> devicectl install/launch.
# Responsibility: copy the case build artifacts (dylib/.o/.h) and sources
# (src/objc) into the objc_ffi_test template project tree, lay out the runtime
# libraries, then hand off to run_ios.py.
# Prerequisites: the envsetup real-device gate has run
# (XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST and IOS_DEVICE_PROVISION_PROFILE
# exported by envsetup / the caller).
# Note: as with the simulator objcffi chain, this chain is only entered when
# the RUN string contains .dylib (legacy dylib form).

set -e

WORKSPACE=$(cd `dirname $0`; pwd)
TARGET=$1

PROJ=$WORKSPACE/objc_ffi_test/objc_ffi_test.xcodeproj
BRIDGE=$PROJ/../objc_ffi_test
SCHEME=objc_ffi_test
BUNDLE_ID=test.objc-ffi-test
CONFIGURATION=Release
DEVICE_TYPE=device

if [ -z "${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST}" ]; then
    echo "Error: XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST is not set (envsetup real-device gate should export it)" >&2
    exit 255
fi

# —— Remove the previous case's generated leftovers in the template tree
#    (keep the App skeleton trio) to prevent cross-case pollution ——
find "$BRIDGE" -maxdepth 1 -name "*.o" -delete
find "$BRIDGE" -maxdepth 1 -name "*.m" -not -name "AppDelegate.m" -not -name "SceneDelegate.m" -not -name "ViewController.m" -delete
find "$BRIDGE" -maxdepth 1 -name "*.h" -not -name "AppDelegate.h" -not -name "SceneDelegate.h" -not -name "ViewController.h" -delete

# —— Copy in this case's build artifacts and sources ——
cp -f src/objc/*.* "$BRIDGE/"
find objc-gen -maxdepth 1 -type f -name "*.h" -exec cp {} "$BRIDGE/" \;
find objc-gen -maxdepth 1 -type f -name "*.o" -exec cp {} "$BRIDGE/" \;

# —— Lay out the runtime libraries (full cangjie runtime + stdx set) into the
#    project tree ios_aarch64_cjnative/ ——
mkdir -p "$BRIDGE/ios_aarch64_cjnative"
cp -r $CANGJIE_HOME/runtime/lib/$TARGET/*.dylib "$BRIDGE/ios_aarch64_cjnative/"
for sx_dir in "$CANGJIE_STDX_PATH" "$CANGJIE_STDX_PATH/../../dynamic/stdx"; do
    [ -d "$sx_dir" ] && find "$sx_dir" -maxdepth 1 -name "*.dylib" -exec cp {} "$BRIDGE/ios_aarch64_cjnative/" \;
done
# Drop the sancov self-instrumented orphan libraries (libstdx.fuzz*) — same
# as the simulator chain, prevents dyld flat-namespace resolution crashes;
# the objcffi case domain does not cover fuzz
find "$BRIDGE/ios_aarch64_cjnative" -name "libstdx.fuzz*.dylib" -delete

cp libcjworld.dylib "$BRIDGE/libcjworld.dylib"
[ -f libobjc.foundation.dylib ] && cp libobjc.foundation.dylib "$BRIDGE/libobjc.foundation.dylib"
[ -f libdep.dylib ] && cp libdep.dylib "$BRIDGE/libdep.dylib"

# —— Hand off to run_ios.py for packaging (signing deferred) and devicectl-
#    stack install/launch; signing / entitlements / bundle-id alignment /
#    classic-UDID fallback are all handled by run_ios.py's device branch
python3 "$WORKSPACE/run_ios.py" --objcffi \
    --project-path "$PROJ" --scheme "$SCHEME" --bundle-id "$BUNDLE_ID" \
    --configuration "$CONFIGURATION" --uninstall --device-type "$DEVICE_TYPE" \
    --udid "$XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST"
