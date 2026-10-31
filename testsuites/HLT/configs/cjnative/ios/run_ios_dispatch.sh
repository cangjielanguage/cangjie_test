#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

# [run] dispatcher: lets one cfg seat serve both case families' RUN chains —
#   plain cases  (direct-executable chain; RUN expansion yields the "main" executable)
#   objcffi cases (xcode-project chain; RUN expansion yields libcangjie_main.dylib)
# Dispatch rule: if the RUN expansion string ($2) contains ".dylib" it is the
# objcffi form. Runtime domain is chosen by the TARGET form:
#   TARGET contains "simulator"  -> simulator pair (simulator_objcffi / simulator_executable)
#   otherwise (ios_aarch64_cjnative) -> device pair (device_objcffi / device_executable)
# Arguments: $1 = TARGET (from the cfg [run] line); $2 = RUN command expansion
# (quoted, passed by the framework); $3+ = redirect / compare remainder.

set -e
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)
TARGET=$1; shift

RUN_CMDLINE="$1"
case "$TARGET" in
    *simulator*)
        OBJC_RUNNER="$SCRIPT_DIR/run_ios_simulator_objcffi.sh"
        PLAIN_RUNNER="$SCRIPT_DIR/run_ios_simulator_executable.sh"
        ;;
    *)
        OBJC_RUNNER="$SCRIPT_DIR/run_ios_device_objcffi.sh"
        PLAIN_RUNNER="$SCRIPT_DIR/run_ios_device_executable.sh"
        ;;
esac
case "$RUN_CMDLINE" in
    *.dylib*)
        exec bash "$OBJC_RUNNER" "$TARGET" "$@"
        ;;
    *)
        exec bash "$PLAIN_RUNNER" "$@"
        ;;
esac
