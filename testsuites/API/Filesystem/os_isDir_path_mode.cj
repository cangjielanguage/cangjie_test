// DEPENDENCE: caserunner.cj a
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import os.*
from ffi import c.*

func main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            isDir(CString("./a"))
        ],
        description: "isDir入参测试"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            isDir(CString("./a/213456.txt"))
        ],
        description: "isDir入参测试",
        checktype: "AssertFalse"
    )
    return 0
}