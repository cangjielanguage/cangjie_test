#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

# Unified packaging/execution driver for objcffi and non-_exe iOS cfgs
# (invoked by run_ios_*_{objcffi,executable}.sh): xcodebuild packaging ->
# signing (real device: full chain against the profile entitlements;
# simulator: ad-hoc) -> simctl / devicectl install and launch -> stdout and
# exit code handed back to the framework. The device branch is the devicectl
# stack (the legacy idevice toolchain is deprecated).
import argparse
import subprocess
import sys
import json
import os
import shutil
import time
from glob import glob
import re
import traceback


def check_tool_exists(tool):
    if shutil.which(tool) is None:
        raise Exception(f"Error: Required tool '{tool}' not found. Please install it.")

def validate_simulator_udid(udid):
    try:
        output = check_output(['xcrun', 'simctl', 'list', 'devices', '--json'])
        data = json.loads(output)
        for runtime in data['devices']:
            for device in data['devices'][runtime]:
                if device['udid'] == udid and device['isAvailable']:
                    return True
        raise Exception(f"Error: Simulator with UDID {udid} not found or unavailable.")
    except Exception as e:
        raise Exception(f"Error validating simulator: {str(e)}")

def find_simulator_udid(simulator_name, os_version):
    try:
        output = check_output(['xcrun', 'simctl', 'list', '--json'])
        data = json.loads(output)
        
        target_runtime = None
        for runtime in data['runtimes']:
            if 'iOS' in runtime['name'] and os_version in runtime['version']:
                target_runtime = runtime['identifier']
                break
        
        if not target_runtime:
            raise Exception(f"Error: iOS {os_version} runtime not found.")
        
        for device in data['devices'].get(target_runtime, []):
            if device['name'] == simulator_name and device['isAvailable']:
                return device['udid']
        
        raise Exception(f"Error: No available simulator found with name '{simulator_name}' and iOS {os_version}.")
    except Exception as e:
        raise Exception(f"Error finding simulator: {str(e)}")

def check_and_start_simulator(udid):
    output = check_output(['xcrun', 'simctl', 'list', 'devices', udid, '--json'])
    data = json.loads(output)
    
    for runtime in data['devices']:
        for device in data['devices'][runtime]:
            if device['udid'] == udid:
                if device['state'] == 'Booted':
                    pid = get_simulator_pid()
                    if pid:
                        print_log(f"Simulator process ID: {pid}")
                    return True
                print_log(f"Starting simulator {udid}...")
                run_cmd(['xcrun', 'simctl', 'boot', udid])

                # Wait for boot completion
                start_time = time.time()
                while time.time() - start_time < 30:
                    output = check_output(['xcrun', 'simctl', 'list', 'devices', udid, '--json'])
                    status = json.loads(output)
                    current_state = status['devices'][runtime][0]['state']
                    if current_state == 'Booted':
                        pid = get_simulator_pid()
                        if pid:
                            print_log(f"Simulator process ID: {pid}")
                        return True
                    time.sleep(1)
                raise Exception("Error: Simulator failed to boot within 30 seconds.")
    raise Exception(f"Error: Simulator {udid} not found.")

def find_app_path(derived_data, configuration, is_simulator):
    platform = "iphonesimulator" if is_simulator else "iphoneos"
    build_dir = os.path.join(derived_data, "Build", "Products", f"{configuration}-{platform}")
    apps = glob(os.path.join(build_dir, "*.app"))
    if not apps:
        raise Exception("Error: No .app file found in build directory.")
    return apps[0]

def uninstall_app(device_type, udid, bundle_id):
    if device_type == "simulator":
        run_cmd(['xcrun', 'simctl', 'uninstall', udid, bundle_id])
    else:
        run_cmd(['xcrun', 'devicectl', 'device', 'uninstall', 'app', '--device', udid, bundle_id])
    print_log(f"Successfully uninstalled {bundle_id}")

def print_log(str):
    if IS_DEBUG:
        print(str)

def get_simulator_pid():
    try:
        result = subprocess.run(['pgrep', '-f', 'Simulator'], capture_output=True, text=True)
        if result.returncode == 0:
            return result.stdout.strip()
    except:
        pass
    return None

def get_app_pid_by_bundle_id(udid, bundle_id):
    try:
        result = subprocess.run(
            ['xcrun', 'simctl', 'spawn', udid, 'launchctl', 'list'],
            capture_output=True, text=True, timeout=10
        )
        if result.returncode == 0:
            for line in result.stdout.split('\n'):
                if bundle_id in line:
                    parts = line.split()
                    if parts:
                        return parts[0]
    except Exception as e:
        print_log(f"Error getting app pid: {e}")
    return None

def launch_app_and_get_pid(udid, bundle_id, workspace):
    try:
        result = subprocess.run(
            ['xcrun', 'simctl', 'launch', udid, bundle_id],
            capture_output=True, text=True, timeout=30
        )
        match = re.search(rf'{re.escape(bundle_id)}:\s*(\d+)', result.stdout)
        if match:
            pid = match.group(1)
            print_log(f"App launched with PID: {pid}")
            return pid
        
        time.sleep(1)
        pid = get_app_pid_by_bundle_id(udid, bundle_id)
        if pid:
            print_log(f"Found app PID via launchctl: {pid}")
        return pid
    except Exception as e:
        print_log(f"Error launching app: {e}")
    return None

def check_output(command):
    print_log(f'command: {command}')
    return subprocess.check_output(command, text=True)

def run_cmd(command):
    print_log(f'command: {command}')
    subprocess.run(command, check=True, capture_output=not IS_DEBUG, text=True)

def run_app(command):
    print_log(f'command: {command}')
    try:
        process = subprocess.Popen(
            command,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE
        )
        cmd_out, cmd_err = process.communicate()
        cmd_out = cmd_out.decode("utf-8", errors="ignore") if cmd_out else ""
        cmd_err = cmd_err.decode("utf-8", errors="ignore") if cmd_err else ""
        return process.returncode, cmd_out, cmd_err
    finally:
        process.terminate()

def main():
    parser = argparse.ArgumentParser(description="iOS Build & Run with Direct Console Output")
    parser.add_argument("--project-path", required=True, help="Path to .xcodeproj or .xcworkspace")
    parser.add_argument("--scheme", required=True, help="Build scheme name")
    parser.add_argument("--device-type", required=True, choices=["simulator", "device"], 
                    help="Target device type")
    parser.add_argument("--simulator-name", help="Simulator name (required if not using --udid for simulator)")
    parser.add_argument("--os-version", help="iOS version for simulator (required if not using --udid)")
    parser.add_argument("--udid", help="Device/simulator UDID")
    parser.add_argument("--dest-arch", default="", help="Explicit destination arch (e.g. x86_64) for dual-arch simulator UDIDs")
    parser.add_argument("--bundle-id", required=True, help="App bundle identifier")
    parser.add_argument("--configuration", default="Debug", help="Build configuration")
    parser.add_argument("--workspace", default="./", help="Specify working directory")
    parser.add_argument("--clean", action="store_true", help="Clean before building")
    parser.add_argument("--uninstall", action="store_true", help="Uninstall app after running")
    parser.add_argument("--objcffi", action="store_true", help="objcffi test")
    parser.add_argument("--launch", action="store_true", help="Build, install, launch app and print PID for debugging")
    parser.add_argument("--skip-build", action="store_true", help="Skip build, only install and launch")
    args = parser.parse_args()
    global IS_DEBUG
    IS_DEBUG = args.configuration == "Debug"

    # Validation
    if args.device_type == "simulator" and not args.udid and (not args.simulator_name or not args.os_version):
        parser.error("For simulator, either provide --udid or both --simulator-name and --os-version")
    if args.device_type == "device" and not args.udid:
        parser.error("--udid is required for device")

    # Check tools
    check_tool_exists("xcodebuild")
    check_tool_exists("xcrun")
    if args.device_type == "device":
        # devicectl (Xcode 26 stack) replaces legacy ideviceinstaller/idevicedebug
        check_tool_exists("xcrun")

    # Handle simulator
    udid = args.udid
    if args.device_type == "simulator":
        if not udid:
            udid = find_simulator_udid(args.simulator_name, args.os_version)
        else:
            validate_simulator_udid(udid)
        check_and_start_simulator(udid)

    # Build parameters
    workspace = os.path.abspath(args.workspace)
    derived_data = os.path.join(workspace, "build_output")
    is_workspace = args.project_path.endswith(".xcworkspace")

    # Build (skip if --skip-build)
    if not args.skip_build:
        build_cmd = ["xcodebuild"]
        if args.clean:
            build_cmd.append("clean")
        build_cmd += [
            "build",
            "-scheme", args.scheme,
            "-configuration", args.configuration,
            "-derivedDataPath", derived_data
        ]
        if is_workspace:
            build_cmd += ["-workspace", args.project_path]
        else:
            build_cmd += ["-project", args.project_path]
        if args.device_type == "simulator":
            # One simulator UDID exposes arm64/x86_64 destination variants;
            # an x86_64 product needs an explicit arch or xcodebuild picks the
            # arm64 variant and fails validation
            dest = f"id={udid},arch={args.dest_arch}" if args.dest_arch else f"id={udid}"
            build_cmd += ["-destination", dest]
        else:
            # xcodebuild's device discovery for real devices walks the classic
            # UDID: a coredevice UUID goes unrecognized by xcodebuild when the
            # Xcode cache is stale (devicectl still shows connected) and the
            # destination reports no available devices — convert to classic
            # form before passing it in
            dest_id = args.udid
            if dest_id.count("-") == 4:
                det = subprocess.run(["xcrun", "devicectl", "device", "info",
                                      "details", "--device", dest_id],
                                     capture_output=True, text=True).stdout
                for line in det.splitlines():
                    if "• udid:" in line:
                        dest_id = line.split(":", 1)[1].strip()
                        break
            build_cmd += ["-destination", f"platform=iOS,id={dest_id}"]
            # Device-package signing is applied after build by this script
            # with the keychain development identity (without a project team
            # the xcodebuild signing phase fails outright); signing is disabled
            # during build
            build_cmd += ["CODE_SIGNING_ALLOWED=NO",
                          # A real device's iOS version may be lower than the
                          # simulator-era deployment target (iOS 26); squash to
                          # 12.0 at build time for older devices — the effective
                          # floor is decided by clang's -miphoneos-version-min
                          "IPHONEOS_DEPLOYMENT_TARGET=12.0"]
        build_cmd += ["LD_RUNPATH_SEARCH_PATHS='@executable_path/Frameworks'"]
        run_cmd(build_cmd)

    # Install and run
    is_simulator = args.device_type == "simulator"
    app_path = find_app_path(derived_data, args.configuration, is_simulator)

    # objcffi: backfill missing runtime dylibs in app/Frameworks + uninstall
    # the stale package before install. The project Copy Files phase is a
    # static list; when the SDK runtime library set evolves (new dylibs) the
    # list lags behind -> the app misses @rpath dependencies -> dyld crashes
    # at startup. Backfill from the project tree objc_ffi_test/ios_aarch64_cjnative/
    # (the runner sh has already copied the full runtime set there), immune to
    # list drift; then re-sign ad-hoc. A stale package makes dyld keep loading
    # the old bundle after an incremental install ("no such file" illusion),
    # so uninstall before install.
    if args.objcffi:
        fw_dir = os.path.join(app_path, "Frameworks")
        bridge_rt = os.path.join(os.path.dirname(os.path.abspath(args.project_path)),
                                 "objc_ffi_test", "ios_aarch64_cjnative")
        if os.path.isdir(bridge_rt) and os.path.isdir(fw_dir):
            patched = 0
            for f in os.listdir(bridge_rt):
                if f.endswith(".dylib") and not os.path.exists(os.path.join(fw_dir, f)):
                    src = os.path.join(bridge_rt, f)
                    # Skip self-instrumented libraries (e.g. libstdx.fuzz's
                    # sancov stubs): the runtime has no sanitizer-coverage stub
                    # symbols, and the plugin manager crashes when it dlopens one
                    try:
                        undef = subprocess.run(["nm", "-u", src],
                                               capture_output=True, text=True).stdout
                        if "_sanitizer_cov" in undef:
                            continue
                    except OSError:
                        pass
                    dst = os.path.join(fw_dir, f)
                    shutil.copy2(src, dst)
                    subprocess.run(["codesign", "--force", "--sign", "-", dst],
                                   capture_output=True)
                    patched += 1
            if patched:
                subprocess.run(["codesign", "--force", "--sign", "-", app_path],
                               capture_output=True)
                print(f"objcffi runtime patch: copied {patched} missing dylib(s), re-signed")

    if is_simulator:
        if args.objcffi:
            subprocess.run(["xcrun", "simctl", "uninstall", udid, args.bundle_id],
                           capture_output=True)
        # Install to simulator
        run_cmd(["xcrun", "simctl", "install", udid, app_path])
        # Install to simulator
        run_cmd(["xcrun", "simctl", "install", udid, app_path])
        
        # Handle --launch mode: launch app and return PID for debugging
        if args.launch:
            app_pid = launch_app_and_get_pid(udid, args.bundle_id, workspace)
            if app_pid:
                print(f"IOS_PID:{app_pid}")
                print(f"IOS_APP_PATH:{app_path}")
                sys.exit(0)
            else:
                print("Error: Failed to get app PID after launch")
                sys.exit(1)
        
        # The cmd with console output: start the syslog stream in the
        # background (ios_sim.log feeds the [CANGJIE:RUNTIME] line extraction)
        # and launch with console-pty in the foreground to capture case stdout
        # and the exit code
        run_app_cmd = [
            'bash', '-c',
            f'xcrun simctl spawn {udid} log stream --style syslog --level info &> ios_sim.log & '
            f'SIMCTL_CHILD_MRT_LOG_LEVEL=i xcrun simctl launch --console-pty --terminate-running-process {udid} {args.bundle_id} --workspace {workspace}'
        ]
    else:
        # Device route via devicectl (Xcode 26 stack). Legacy
        # ideviceinstaller/idevicedebug are not part of Xcode and may be
        # absent; codesign with the keychain "Apple Development" identity
        # after build (xcodebuild device builds without a project team would
        # fail signing), then install/launch/uninstall via devicectl.
        sign_id = os.environ.get("IOS_DEVICE_SIGN_IDENTITY", "")
        if not sign_id:
            idl = subprocess.run(["security", "find-identity", "-v", "-p", "codesigning"],
                                 capture_output=True, text=True).stdout
            for line in idl.splitlines():
                if "Apple Development" in line:
                    sign_id = line.strip().split()[1]
                    break
        if sign_id:
            # Canonical signing chain (same as ios_device_common.sh sign_bundle):
            # extract Entitlements from the provisioning profile (a freeprofile
            # signature's entitlements must match the profile; default
            # entitlements yield 0xe8008016 invalid entitlements) -> sign each
            # nested dylib -> sign the main bundle
            import tempfile, plistlib
            prof = os.environ.get("IOS_DEVICE_PROVISION_PROFILE", "")
            ent = None
            if prof and os.path.isfile(prof):
                dec = subprocess.run(["security", "cms", "-D", "-i", prof],
                                     capture_output=True, text=True)
                if dec.returncode == 0 and "<plist" in dec.stdout:
                    try:
                        d = plistlib.loads(dec.stdout.encode())
                        ent = d.get("Entitlements")
                    except Exception:
                        ent = None
            tmpd = tempfile.mkdtemp()
            ent_path = None
            if ent:
                ent_path = os.path.join(tmpd, "entitlements.plist")
                plistlib.dump(ent, open(ent_path, "wb"))
                # A freeprofile's application-identifier is not a wildcard
                # (team.cangjie.wbt-proj): the app's bundle id must fall inside
                # the profile's coverage or installd reports 0xe8008016 invalid
                # entitlements — rewrite Info.plist before signing and align the
                # bundle id of the subsequent launch/uninstall
                appid = ent.get("application-identifier", "")
                if appid and "." in appid:
                    prof_bid = appid.split(".", 1)[1]
                    info_pl = os.path.join(app_path, "Info.plist")
                    if os.path.isfile(info_pl):
                        d = plistlib.load(open(info_pl, "rb"))
                        if d.get("CFBundleIdentifier") != prof_bid:
                            d["CFBundleIdentifier"] = prof_bid
                            plistlib.dump(d, open(info_pl, "wb"))
                        args.bundle_id = prof_bid
                # Embed the profile into the app (a CODE_SIGNING_ALLOWED=NO
                # build product lacks it; installd with no profile to verify
                # reports the same 0xe8008016)
                prof_file = prof
                if prof_file and os.path.isfile(prof_file):
                    shutil.copy2(prof_file, os.path.join(app_path, "embedded.mobileprovision"))
            sign_args = (["--entitlements", ent_path] if ent_path else
                         ["--generate-entitlement-der"])
            for root, _, files in os.walk(app_path):
                for f in files:
                    if f.endswith(".dylib"):
                        subprocess.run(["codesign", "-f", "-s", sign_id,
                                        "--timestamp=none"] + sign_args +
                                       [os.path.join(root, f)], capture_output=True)
            subprocess.run(["codesign", "-f", "-s", sign_id, "--timestamp=none"]
                           + sign_args + [app_path], capture_output=True)
        else:
            print("Warning: no Apple Development identity found; trying unsigned install")

        run_cmd(["xcrun", "devicectl", "device", "uninstall", "app", "--device", args.udid, args.bundle_id])
        run_cmd(["xcrun", "devicectl", "device", "install", "app", "--device", args.udid, app_path])

        # Run with console output
        run_app_cmd = [
            "xcrun", "devicectl", "device", "process", "launch", "--console",
            "--terminate-existing", "--device", args.udid, args.bundle_id
        ]
    # Run App
    com_out = ""
    com_err = ""
    sys_log_content = ""
    try:
        return_code, com_out, com_err = run_app(run_app_cmd)
        if return_code != 0:
            raise Exception(f"Failed to run app: '{run_app_cmd}', return code: {return_code}!")
        com_out = com_out.replace('\r\n', '\n').replace('\r', '\n')
        com_err = com_err.replace('\r\n', '\n').replace('\r', '\n')
        
        # Read the log contents (ios_sim.log is a simulator log-stream product;
        # the device route has no such file)
        if not is_simulator:
            sys_log_content = ""
            spring_board_line = []
        else:
          with open('ios_sim.log', 'r', encoding='utf-8') as f:
            cangjie_runtime_log_lines = []
            for line in f.readlines():
                line = line.rstrip('\n')
                if '[CANGJIE:RUNTIME]' in line:
                    cangjie_runtime_log_lines.append(line)
                if 'Process exited:' in line and '(SpringBoard)' in line:
                    cangjie_runtime_log_lines.append(line)
            spring_board_line = [line for line in cangjie_runtime_log_lines if '(SpringBoard)' in line]
            if len(spring_board_line) == 1:
                exit_message = spring_board_line[0]
            else:
                exit_message = ''
            
            # Filter out unrelated stdout/stderr lines
            cangjie_runtime_log_lines = [line for line in cangjie_runtime_log_lines if 'signpost functions all loaded successfully' not in line and '(SpringBoard)' not in line]
            sys_log_content = '\n'.join(cangjie_runtime_log_lines)

        if not args.objcffi:
            if "cj_main_return_start" in com_out and "cj_main_return_end" in com_out:
                com_out=re.sub(rf"{args.bundle_id}: [0-9]+\n?", "", com_out)
                return_code = int(com_out.split("cj_main_return_start")[1].split("cj_main_return_end")[0])
                com_out = com_out.split("cj_main_return_start")[0] + com_out.split("cj_main_return_end")[1]
            else:
                # Missing cj_main_return_start/end markers usually mean a global
                # exception was thrown
                if 'An exception has occurred' in sys_log_content:
                    # An exception was thrown during global static init: rewrite
                    # the exit code to 1 and surface the log content on stdout
                    return_code = 1
                elif 'CJNative Handle signal: 11.' in sys_log_content or 'SIGSEGV(11)' in exit_message:
                    # SIGSEGV(11) -> 139
                    return_code = 139
                elif 'CJNative Handle signal: 6.' in sys_log_content or 'SIGABRT(6)' in exit_message:
                    # SIGABRT(6) -> 134
                    return_code = 134
                else:
                    # Other unknown causes
                    raise Exception(f"unknown condition occurred.")
        sys.exit(return_code)
    finally:
        sys.stdout.write(sys_log_content)
        sys.stdout.write(com_out)
        sys.stderr.write(com_err)
        if args.uninstall:
            uninstall_app(args.device_type, udid, args.bundle_id)

if __name__ == "__main__":
    try:
        try:
            main()
        except subprocess.CalledProcessError as e:
            sys.stdout.write(e.stdout if e.stdout else "")
            sys.stderr.write(e.stderr if e.stderr else "")
            raise
    except SystemExit:
        raise
    except:
        exc_type, exc_value, exc_traceback = sys.exc_info()
        print("Traceback (most recent call last):", file=sys.stderr)
        traceback.print_tb(exc_traceback, file=sys.stderr)
        print(f"{exc_type.__name__}: {exc_value}", file=sys.stderr)
        sys.exit(255)
