// DEPENDENCE: caserunner.cj test_fj.txt test_fj_notnull.txt
// EXEC-PIPE: mkdir -p a/b
// EXEC-PIPE: mkdir test_dir
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import os.*
from ffi import c.*

func main() {
    //文件，返回True
    CaseRunner<Bool>().runCasesTrue(
        [
            isReg(CString("test_fj.txt"))
        ],
        description: "常规文件"
    )
    //目录，返回false
    CaseRunner<Bool>().runCasesTrue(
        [
            isReg(CString("./test_dir")),
            isReg(CString("./test_notexists"))
        ],
        description: "非常规文件",
        checktype:"AssertFalse"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            isReg(CString("a/b"))
        ],
        description: "非常规文件2",
        checktype:"AssertFalse"
    )
    return 0
}
