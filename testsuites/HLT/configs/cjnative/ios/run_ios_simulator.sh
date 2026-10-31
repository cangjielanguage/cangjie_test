#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

# Static-library merge execution chain for the NON-_exe iOS cfgs
# (mac_aarch64-ios_simulator_{aarch64,x64}/basic|O2|static_O2): merges all .a
# archives in the working directory into a single libcangjie_main.a, drops it
# into the test_cangjie_ios_175 template project's bridge_cangjie, and hands
# off to run_ios.py for packaging and execution.
# Note: the _exe cfgs (*_exe/ directories) take the run_ios_dispatch.sh
# direct-executable chain instead and never reach this script.
# Default simulator name/OS matches this machine (iPhone 17 Pro / iOS 26.3);
# envsetup or the sweep side may override via the XCODE_* environment variables.

set -e

WORKSPACE=$(cd `dirname $0`; pwd)
TARGET=$1
if [ -z ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} ]; then
    XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST=${WORKSPACE}/xcode_project_of_cangjie_ios_test/test_cangjie_ios_175.xcodeproj
    if [ -z ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST} ]; then
        XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST=${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST}/../test_cangjie_ios_175/bridge_cangjie
    fi
fi
XCODE_SCHEME_OF_CANGJIE_IOS_TEST="${XCODE_SCHEME_OF_CANGJIE_IOS_TEST:-test_cangjie_ios_175}"
XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST="${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST:-cangjie.test-cangjie-ios-175}"
XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST="${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST:-Release}"
XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST="${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST:-simulator}"

# Uninstall toggle for trace-style cases; default true (clean per case)
IS_UNINSTALL_ON_SIMULATOR="${IS_UNINSTALL_ON_SIMULATOR:-true}"

# —— Merge every .a in the working directory (except libcangjie_main.a itself) ——
#    into a single libcangjie_main.a ——
CWD=$(pwd)
TEMP_DIR="$CWD/merge_temp"
mkdir -p "$TEMP_DIR"

find . -name "*.a" -type f | grep -v "libcangjie_main.a" | while read -r file; do
    (cd "$(dirname "$file")" && ar x "$(basename "$file")" && mv *.o "$TEMP_DIR/" 2>/dev/null || true)
done

if [ "$(ls -A "$TEMP_DIR"/*.o 2>/dev/null)" ]; then
    ar r libcangjie_main.a "$TEMP_DIR"/*.o &> /dev/null || true
fi
if [ "$(ls -A "$CWD"/*.o 2>/dev/null)" ]; then
    ar r libcangjie_main.a "$CWD"/*.o &> /dev/null || true
fi

rm -rf "$TEMP_DIR"
rm -f ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/libcangjie_main.a
cp libcangjie_main.a ${XCODE_BRIDGE_CANGJIE_DIR_OF_CANGJIE_IOS_TEST}/libcangjie_main.a

# —— Hand off to run_ios.py (auto-picks a simulator by name/OS when UDID is unset) ——
# For a TARGET of ios_simulator_x86_64_cjnative the destination needs an
# explicit arch=x86_64: one simulator UDID exposes arm64/x86_64 destination
# variants and the default picks arm64, which fails to link an x86_64 .a
DEST_ARCH_ARGS=""
case "$TARGET" in
    *x86_64*) DEST_ARCH_ARGS="--dest-arch x86_64" ;;
esac
# No iPhone 15/17.5 combination exists on this machine; defaults are
# iPhone 17 Pro / 26.3 (settled 1107)
if [ -z ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST} ]; then
    XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST="${XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST:-iPhone 17 Pro}"
    XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST="${XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST:-26.3}"
    if [ "${IS_UNINSTALL_ON_SIMULATOR}" = "true" ]; then
        python3 ${WORKSPACE}/run_ios.py ${DEST_ARCH_ARGS} --project-path ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} --scheme ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --bundle-id ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} --configuration ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} --uninstall --device-type ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} --simulator-name "${XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST}" --os-version "${XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST}"
    else
        python3 ${WORKSPACE}/run_ios.py ${DEST_ARCH_ARGS} --project-path ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} --scheme ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --bundle-id ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} --configuration ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} --device-type ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} --simulator-name "${XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST}" --os-version "${XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST}"
    fi
else
    if [ "${IS_UNINSTALL_ON_SIMULATOR}" = "true" ]; then
        python3 ${WORKSPACE}/run_ios.py ${DEST_ARCH_ARGS} --project-path ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} --scheme ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --bundle-id ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} --configuration ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} --uninstall --device-type ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} --udid ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST}
    else
        python3 ${WORKSPACE}/run_ios.py ${DEST_ARCH_ARGS} --project-path ${XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST} --scheme ${XCODE_SCHEME_OF_CANGJIE_IOS_TEST} --bundle-id ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST} --configuration ${XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST} --device-type ${XCODE_DEVICE_TYPE_OF_CANGJIE_IOS_TEST} --udid ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST}
    fi
fi
