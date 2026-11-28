#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

# objcffi cases' xcode-project execution chain (simulator domain).
# Invoked by run_ios_dispatch.sh (entered when the RUN expansion contains
# .dylib); run_ios.py performs xcodebuild packaging and simctl install/launch.
# Responsibility: copy the case build artifacts (dylib/.o/.h) and sources
# (src/objc) into the objc_ffi_test template project tree, lay out the runtime
# libraries, then hand off to run_ios.py.
# Note: after the cfg unification to output=main, objcffi RUN expansions are
# executable-shaped and dispatch defaults to the executable direct-run chain;
# this chain is only entered when the RUN string contains .dylib (legacy
# dylib form). The template project is not tracked in git (.gitignore) and is
# provisioned by the sweep's install_xcodeproj or manually.

set -e

WORKSPACE=$(cd `dirname $0`; pwd)
TARGET=$1

PROJ=$WORKSPACE/objc_ffi_test/objc_ffi_test.xcodeproj
BRIDGE=$PROJ/../objc_ffi_test
SCHEME=objc_ffi_test
BUNDLE_ID=test.objc-ffi-test
CONFIGURATION=Release
DEVICE_TYPE=simulator

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
#    project tree ios_aarch64_cjnative/ so run_ios.py's Frameworks backfill can
#    track SDK library-set evolution (the project Copy phase is a static list;
#    SDK-added dylibs missing from it crash dyld at startup)
mkdir -p "$BRIDGE/ios_aarch64_cjnative"
cp -r $CANGJIE_HOME/runtime/lib/$TARGET/*.dylib "$BRIDGE/ios_aarch64_cjnative/"
for sx_dir in "$CANGJIE_STDX_PATH" "$CANGJIE_STDX_PATH/../../dynamic/stdx"; do
    [ -d "$sx_dir" ] && find "$sx_dir" -maxdepth 1 -name "*.dylib" -exec cp {} "$BRIDGE/ios_aarch64_cjnative/" \;
done
# Drop the sancov self-instrumented orphan libraries (libstdx.fuzz*): under
# the PBXFileSystemSynchronizedRootGroup semantics every dylib in the project
# tree gets auto-Linked into the main binary and Embedded into Frameworks —
# the fuzz library's sanitizer-coverage undefined symbols have no provider in
# the SDK, so dyld flat-namespace resolution crashes immediately; the objcffi
# case domain does not cover fuzz, so these must be dropped before build
find "$BRIDGE/ios_aarch64_cjnative" -name "libstdx.fuzz*.dylib" -delete

cp libcjworld.dylib "$BRIDGE/libcjworld.dylib"
[ -f libobjc.foundation.dylib ] && cp libobjc.foundation.dylib "$BRIDGE/libobjc.foundation.dylib"
[ -f libdep.dylib ] && cp libdep.dylib "$BRIDGE/libdep.dylib"

# —— Hand off to run_ios.py for packaging and execution ——
# For a TARGET of ios_simulator_x86_64_cjnative (x64 simulator bundle) the
# destination needs an explicit arch=x86_64: one simulator UDID exposes both
# arm64/x86_64 destination variants and the default picks arm64, which fails
# validation
DEST_ARCH_ARGS=""
case "$TARGET" in
    *x86_64*) DEST_ARCH_ARGS="--dest-arch x86_64" ;;
esac
if [ -z "${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST}" ]; then
    XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST="${XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST:-iPhone 17}"
    XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST="${XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST:-26.0.1}"
    python3 "$WORKSPACE/run_ios.py" --objcffi ${DEST_ARCH_ARGS} \
        --project-path "$PROJ" --scheme "$SCHEME" --bundle-id "$BUNDLE_ID" \
        --configuration "$CONFIGURATION" --uninstall --device-type "$DEVICE_TYPE" \
        --simulator-name "$XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST" \
        --os-version "$XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST"
else
    python3 "$WORKSPACE/run_ios.py" --objcffi ${DEST_ARCH_ARGS} \
        --project-path "$PROJ" --scheme "$SCHEME" --bundle-id "$BUNDLE_ID" \
        --configuration "$CONFIGURATION" --uninstall --device-type "$DEVICE_TYPE" \
        --udid "$XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST"
fi
