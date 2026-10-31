#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

# TODO:
# - main with parameters is not supported yet
# - @Test is not supported yet

import argparse
import re
import sys
import os
from pathlib import Path
from typing import *
import time

func_cj_main = "func cj_main"
cangjie_main_start = """
@C
public func cangjie_main(): Unit {
    var ret = 1
    try {"""
call_cj_main_Int = "\n        ret = Int64(cj_main())"
call_cj_main_Unit = "\n        cj_main()\n        ret = 0"
call_cj_unsafe_main_Int = "\n        ret = unsafe {cj_main()}"
call_cj_unsafe_main_Unit = "\n        unsafe {cj_main()}\n        ret = 0"

call_cj_ut_start = """
\tlet config = Configuration()
\tlet testGroupBuilder = TestGroup.builder(@sourcePackage())
"""
call_cj_ut_pref = "\n\ttestGroupBuilder.add("
call_cj_ut_suff = "().asTestSuite())"
call_cj_ut_end = """
\tlet testGroup = testGroupBuilder.build()
\tlet testReport = testGroup.runTests(config)
\ttestReport.reportTo(ConsoleReporter(colored: false))
\tret = testReport.errorCount + testReport.failedCount
\tif (ret != 0) { ret = 1 }"""
cangjie_main_end = """
    } catch (e: Exception) {
        ret = 1
        e.printStackTrace()
    } finally {
        print("cj_main_return_start${ret}cj_main_return_end")
    }
}"""

# The executable route (cjc --output-type=exe) requires a Cangjie main entry
# inside the package; that entry calls @C cangjie_main in an unsafe context
# (native functions are not callable from a safe context). A real device has
# no way to obtain the process's true exit code, so the result is reported
# back via the cj_main_return marker printed by cangjie_main.
cangjie_exe_main = """

main(): Int64 {
    unsafe { cangjie_main() }
    return 0
}"""


def print_log(str):
    if IS_DEBUG:
        print(str)


def has_return_statement(func_body: str) -> bool:
    """Detect whether the function body contains a non-Unit return statement"""
    # Exclude `return Unit` and labeled `return@label` forms
    clean_body = re.sub(r'//.*?$|/\*.*?\*/|".*?"', '', func_body, flags=re.DOTALL)
    return bool(re.search(r'\breturn\b(?!\s*Unit\b)(?!\s*@)', clean_body))


def modify(data, emit_main=False):
    pattern_cangjie_main = r'(^\s*.*\s*func\s*cangjie_main\s*\(\)\s*:?\s*.*\s*\{)'
    # If the file about to be modified already contains a cangjie_main entry,
    # return as-is without any processing and without raising
    if re.search(pattern_cangjie_main, data, re.M):
        return data
        # raise Exception("[ERROR] a cangjie_main function already exists")

    modified = data + cangjie_main_start
    pattern_main = r'(^\s*main\s*\(\)\s*(?::\s*([^\s\{]+)\s*)?\{)'
    matches_main = re.findall(pattern_main, data, re.M)
    pattern_unsafe_main = r'(^\s*unsafe\s*main\s*\(\)\s*(?::\s*([^\s\{]+)\s*)?\{)'
    matches_unsafe_main = re.findall(pattern_unsafe_main, data, re.M)

    if len(matches_main) + len(matches_unsafe_main) > 1:
        raise Exception(f"[ERROR] matched {len(matches_main)} main functions")
    elif len(matches_main) == 1:
        replaced, return_type = matches_main[0]
        print_log(f"matched main function: {repr(replaced)}")
        print_log(f"return type: {repr(return_type)}")

        # Extract the function body
        func_start = data.find(replaced) + len(replaced)
        func_end = data.find("\n}", func_start)
        func_body = data[func_start:func_end]

        # Decide how to handle the return value
        need_return = (
                (return_type and "Int" in return_type) or
                (not return_type and has_return_statement(func_body))
        )

        modified = modified.replace(replaced, replaced.replace("main", func_cj_main))
        modified += call_cj_main_Int if need_return else call_cj_main_Unit
    elif len(matches_unsafe_main) == 1:
        replaced, return_type = matches_unsafe_main[0]
        print_log(f"matched main function: {repr(replaced)}")
        print_log(f"return type: {repr(return_type)}")

        # Extract the function body
        func_start = data.find(replaced) + len(replaced)
        func_end = data.find("\n}", func_start)
        func_body = data[func_start:func_end]

        # Decide how to handle the return value
        need_return = (
                (return_type and "Int" in return_type) or
                (not return_type and has_return_statement(func_body))
        )

        modified = modified.replace(replaced, replaced.replace("main", func_cj_main))
        modified += call_cj_unsafe_main_Int if need_return else call_cj_unsafe_main_Unit
    else:
        pattern_unittest = r"^\s*@Test\s*(?:public)?\s*class\s*(.*?)\s*{$"
        matches = re.findall(pattern_unittest, data, re.M)
        if len(matches) < 1:
            # No-op
            # raise Exception(f"[ERROR] neither main nor @Test found; cannot process")
            return data
        modified += call_cj_ut_start
        for idx, ut_class_name in enumerate(matches, 1):
            modified += call_cj_ut_pref + ut_class_name + call_cj_ut_suff
        modified += call_cj_ut_end

    result = modified + cangjie_main_end
    if emit_main:
        result += cangjie_exe_main
    return result


# Locate the file that actually holds the entry main, via the info file
def process_info_file(test_info_file_path: Path) -> list[Path]:
    dependency_list: List[Path] = list()
    cj_files = list(test_info_file_path.parent.glob('*.cj'))
    dependency_list.extend(cj_files)
    # The test-header file itself is also checked for a main and is examined
    # first, hence first in the list
    dependency_list.append(test_info_file_path)
    with open(test_info_file_path, 'r', encoding='utf-8') as f:
        for line in f.readlines():
            pattern_dependence = r'^\s*//\s*DEPENDENCE\s*:\s*(.+)'
            matches_dependence = re.search(pattern=pattern_dependence, string=line, flags=re.IGNORECASE)
            if matches_dependence:
                content = matches_dependence.group(1).strip()
                # %n is the test-header file name without its extension
                content = content.replace('%n', test_info_file_path.stem)
                l = re.split(r'[,\s]+', content)
                print_log('l = {}'.format(l))
                for i in l:
                    dependency_list.append(Path(Path(i).name))
                # An info file normally declares only one DEPENDENCE; after the
                # first hit there is no need to keep scanning
                break
            else:
                # No DEPENDENCE on this line; continue with the next
                pass


    print_log('dependency_list = {}'.format(dependency_list))
    # Open each candidate file and check whether it contains main
    main_file_list: List[Path] = list()
    main_file_list.append(test_info_file_path)
    # pattern_main = r'(^\s*main\s*\(\s*(.*?)\s*\)\s*:?\s*(.*?)\s*\{)(?!\})'
    pattern_main = r'(^\s*main\s*\(\)\s*(?::\s*([^\s\{]+)\s*)?\{)'
    for dependency_path in dependency_list:
        # Skip if it does not exist
        if not dependency_path.exists():
            continue
        elif dependency_path.is_file():
            print_log('reading {}'.format(dependency_path))
            # The dependency is a file: read it directly
            try:
                with open(dependency_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                    print_log('content = {}'.format(content))
                    # if re.findall(pattern_main, content):
                        # main_file_list.append(dependency_path)
                    main_file_list.append(dependency_path)
            except Exception as e:
                # On a read failure, skip the check for this file
                pass
        elif dependency_path.is_dir():
            # The dependency is a directory: walk all files and read each one
            for file_path in dependency_path.rglob('*'):
                if file_path.is_file():
                    try:
                        with open(file_path, 'r', encoding='utf-8') as f:
                            content = f.read()
                            # if re.findall(pattern_main, content):
                            #     main_file_list.append(file_path)
                            main_file_list.append(file_path)
                    except Exception as e:
                        # On a read failure, skip the check for this file
                        pass

    return main_file_list
    # raise Exception(f"[ERROR] no source file owning a main was found")


def process_file(input_path: Path, output_path: Path, emit_main: bool = False) -> None:
    # Decide whether the input is an info file; if so, read its DEPENDENCE
    # entries to locate the real case entry
    entry_source_file_path_list = process_info_file(input_path)
    for entry_source_file_path in entry_source_file_path_list:
        try:
            # Read the original content
            with open(entry_source_file_path, 'r', encoding='utf-8') as f:
                original_data = f.read()
            # Rewrite it
            modified_data = modify(original_data, emit_main)
            # Write the output file
            with open(entry_source_file_path, 'w', encoding='utf-8') as f:
                f.write(modified_data)
            print_log(f"file processed successfully; output: {entry_source_file_path}")
        except FileNotFoundError:
            raise Exception(f"[ERROR] input file does not exist: {entry_source_file_path}")
        except Exception as e:
            raise Exception(f"[ERROR] processing failed: {str(e)}")


def main():
    parser = argparse.ArgumentParser(
        description="Rewrite a cj file to satisfy the Cangjie iOS test route",
        formatter_class=argparse.RawTextHelpFormatter
    )
    parser.add_argument('input', help='input file path')
    parser.add_argument('-o', '--output', required=True, help='output file path')
    parser.add_argument("--ignore-exception", action="store_true", help="ignore exceptions and continue")
    parser.add_argument("--exe", action="store_true",
                        help="also generate a Cangjie main entry calling cangjie_main "
                            "(for the real-device executable route, cjc --output-type=exe)")
    args = parser.parse_args()
    global IS_DEBUG
    IS_DEBUG = False if args.ignore_exception else True

    process_file(Path(args.input), Path(args.output), args.exe)


if __name__ == '__main__':
    try:
        main()
    except Exception as e:
        print_log(str(e))
        sys.exit(255 if IS_DEBUG else 0)