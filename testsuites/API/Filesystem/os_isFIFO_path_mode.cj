// DEPENDENCE: caserunner.cj a
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: mkfifo test_fifo
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// EXEC: %ls -l
// ASSERT: scan-not AssertionError
from std import os.*
from ffi import c.*
//func isFIFO(path: CString, mode: Int32): Bool
func main() {

    CaseRunner<Bool>().runCasesTrue(
        [
            isFIFO(CString("./test_fifo"))
        ],
        description: "isFIFO入参测试"
    )


    CaseRunner<Bool>().runCasesTrue(
        [
            isFIFO(CString("./a"))
        ],
        description: "isFIFO入参测试",
        checktype: "AssertFalse"
    )
    return 0
}
