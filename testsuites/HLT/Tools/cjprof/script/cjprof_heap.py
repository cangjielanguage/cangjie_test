# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import os
import sys
import signal
import subprocess
import time
from subprocess import check_output

class heapTest() :
    """
    heapTest: father class of heapExportTest and heapAnalyzeTest
    How cjprof heap <option> work
    """
    def __init__(self):
        compile_result = sys.argv[1]
        run_env = sys.argv[2]
        self.p = self.run_CJ_case(compile_result, run_env)
        self.real_pid = self.find_CJ_pid(compile_result, run_env)

    def heap_running(self):
        """
        heap_running: start heap command and clean env
        """
        self.p_heap, compare_res = self.heap_command(self.heap_export_cmd)
        self.clean_env(self.p, self.p_heap)
        if compare_res == 2:
            sys.exit(2)
        elif compare_res == 1:
            sys.exit(1)

    def run_CJ_case(self, compile_result, run_env):
        """
        run_CJ_case: run the *.cj compile_result
        """
        print("\n -------- Run {} -------- \n".format(compile_result))
        if "cjnative" in run_env:
            p = subprocess.Popen("./{}".format(compile_result), executable=None,
                                                            shell=True,
                                                            preexec_fn=os.setsid,
                                                            close_fds=True
                                                            )
            time.sleep(0.5)
            return p
        else:
            p = subprocess.Popen("cj " + compile_result, executable=None,
                                                    shell=True,
                                                    preexec_fn=os.setsid,
                                                    close_fds=True
                                                    )
            time.sleep(0.5)
            return p

    def find_CJ_pid(self, inputfile, run_env):
        """
        find_CJ_pid: find pid correspond to *.cj
        """
        if "cjnative" in run_env:
            real_pid = subprocess.check_output(["pidof", inputfile]).split()[0].decode('utf-8')
            print("\n -------- cjprof heap {0} real_pid: {1} -------- \n".format(inputfile, real_pid))
            return real_pid
        else:
            real_pid = subprocess.check_output(["pidof", "cj"]).split()[0].decode('utf-8')
            print("\n -------- cjprof heap {0} real_pid: {1} -------- \n".format(inputfile, real_pid))
            return real_pid

    def heap_command(self, heap_export_cmd):
        """
        heap_command: start cjprof heap process
        """
        print("\n -------- cjprof heap {0} -------- \n".format(heap_export_cmd))
        # p_heap: start cjprof heap process
        p_heap = subprocess.Popen("cjprof heap {0}".format(heap_export_cmd), stdout=subprocess.PIPE,
                                                                            stderr=subprocess.STDOUT,
                                                                            preexec_fn=os.setsid,
                                                                            shell=True)

        # print cjprof output-result
        print("———————————————————————————————————————————————————————————————")
        print("Cjprof Output: \n")

        p_heap_stdouts = p_heap.stdout.readlines()
        for p_heap_stdout in p_heap_stdouts:
            print(p_heap_stdout.decode('utf-8').strip())

        print("———————————————————————————————————————————————————————————————")

        p_heap.communicate()
        # start compare the generated-heapdata and expected-heapdata
        compare_res = self.compare_heap_data(p_heap_stdouts)

        return p_heap, compare_res

    def clean_subprocess(self, p):
        """
        clean_subprocess: kill subprocess
        """
        try:
            os.killpg(p.pid, signal.SIGTERM)
        except ProcessLookupError:
            pass

    def clean_env(self, p, p_heap):
        # Check to kill subprocess
        self.clean_subprocess(p)
        self.clean_subprocess(p_heap)

    def compare_heap_data(self, p_heap_stdout):
        return 0

class heapExportTest(heapTest):
    """
    heapExportTest: extends to heapTest
    How cjprof heap export data based on sampling
    """
    def __init__(self):
        super().__init__()

class heapAnalyzeTest(heapTest):
    """
    heapAnalyzeTest: extends to heapTest
    How cjprof heap Analyze data based on export-data
    """
    def __init__(self):
        super().__init__()

    def run_CJ_case(self, compile_result, run_env):
        """
        run_CJ_case: no need on heapAnalyzeTest
        """
        print("\n -------- No need to run CJ case  -------- \n")
        p = subprocess.Popen("", executable=None, shell=True, preexec_fn=os.setsid)
        return p

    def find_CJ_pid(self, inputfile, run_env):
        """
        find_CJ_pid: no need on heapAnalyzeTest
        """
        print("\n -------- No need to find CJ pid  -------- \n")
        return 0
