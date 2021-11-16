#!/usr/bin/env python3
# -*- encoding: utf-8 -*-

"""
@Author  :   l00473412

@Time    :   2021/08/20

@Desc    :   parse debug info of panda and check results

"""

import sys
import argparse


def get_function_line(filename):
    """
    Parse actual result txt.
    Return set of (function_start_line, function_end_line)

    :param filename: file name of actual result
    :return: a set of tuple, (function_start_line, function_end_line)
    """
    function_start = -1
    function_start_end = []
    for (num, value) in enumerate(open(filename, "r")):
        if value.find("function") != -1:
            function_start = num
        if value.find("}") != -1 and function_start != -1:
            function_end = num
            function_start_end.append((function_start, function_end))
    return function_start_end


def get_function_scope(__function_scope, line):
    """
    Retrun (function_start_line, function_end_line) of function according to line

    :param __function_scope: generated in get_function_line
    :param line: current line
    :return: (function_start_line, function_end_line)
    """
    for i in __function_scope:
        if max(i) > line and min(i) < line:
            return i


def get_args():
    """
    Parse argument

    :return:
    """
    parser = argparse.ArgumentParser()
    run_parser = parser.add_argument_group("parse debug info")
    run_parser.add_argument("--e", type=str, help="expected result file")
    run_parser.add_argument("--a", type=str, help="actual result file")
    args = parser.parse_args()
    return args


if __name__ == '__main__':
    args = get_args()
    function_scope = get_function_line(args.a)
    fail = 0
    for line_e in open(args.e).readlines():
        print("== start test: " + line_e.replace("\n", ""))
        jump_line = line_e.split(",")[0]
        jump_instr = line_e.split(",")[1]
        jump_to = line_e.split(",")[2].replace("\n", "")
        dest = set()
        for (num, value) in enumerate(open(args.a, "r")):
            if value.find(" " + jump_line + ": " + jump_instr) != -1:
                func_scope = get_function_scope(function_scope, num)
                last_line = value
                label_no = value.split(" label")[1].replace(".", "").replace(":", "").replace("\n", "").strip()
                # check for valid pattern, 6 jump to 9
                # 6: jmp label.3
                # 6: label.3
                # 6: lda v7
                # 9: mov.64 v7, v6
                for (num_inner, value_inner) in enumerate(open(args.a, "r")):
                    if num_inner <= num:
                        continue
                    elif value_inner.split(": ")[0].strip() == str(jump_line):
                        continue
                    else:
                        dest.add(value_inner.split(": ")[0].strip())
                        break
                # check for valid pattern, 6 jump to 6
                # 6: jmp label.5
                # 6: label.5
                for (num_inner, value_inner) in enumerate(open(args.a, "r")):
                    if value_inner.find(": label." + label_no + ":") != -1:
                        if min(func_scope) < num_inner < max(func_scope):
                            dest.add(value_inner.split(": ")[0].strip())
        print(dest)
        if jump_to in dest:
            print("Pass")
        else:
            print("Debug Info Not Correct For :" + line_e)
            fail = fail + 1
    if fail != 0:
        sys.exit(1)
    else:
        sys.exit(0)
