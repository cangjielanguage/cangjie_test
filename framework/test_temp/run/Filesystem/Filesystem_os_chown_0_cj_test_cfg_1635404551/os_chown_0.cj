// DEPENDENCE: caserunner.cj test_fj.txt test_fj_notnull.txt test_fj_0.txt test_fj_notnull_0.txt
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC: pwd
// EXEC: ls -l test_fj.txt| compare %f
// ASSERT: scan  fj docker
// ASSERT: scan  test_fj.txt
// ASSERT: regex-auto -rw-rw-r--
from os import os.*
from ffi import c.*
func main() : Int64{
    CaseRunner<Int32>().runCases(
        [
            (chown(CString("test_fj.txt"),Int32(1013),Int32(113)),Int32(0))//返回值是0代表处理成功
        ],
        description: "chown()入参"
    )
    return 0
}
