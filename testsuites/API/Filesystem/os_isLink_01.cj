// DEPENDENCE: caserunner.cj test_fj.txt test_fj_notnull.txt
// EXEC-PIPE: mkdir -p a/b
// EXEC-PIPE: mkdir test_dir
// EXEC: ln -s test_fj.txt  testlink
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import os.*
from ffi import c.*

func main() {
    //文件，返回True
    CaseRunner<Bool>().runCasesTrue(
        [
            isLnk(CString("testlink"))
        ],
        description: "是Link"
    )
  
    CaseRunner<Bool>().runCasesTrue(
        [
            isLnk(CString("../test_dir")),
            isLnk(CString("test_fj.txt")),
            isLnk(CString("../test_notexists"))
        ],
        description: "非Link",
        checktype:"AssertFalse"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            isLnk(CString("a/b"))
        ],
        description: "非Link",
        checktype:"AssertFalse"
    )
    return 0
}
