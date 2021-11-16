// DEPENDENCE: caserunner.cj test_fj.txt test_fj_notnull.txt test_fj_0.txt test_fj_notnull_0.txt
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
from std import os.*
from ffi import c.*
func main() : Int64{
    CaseRunner<Int32>().runCases(
        [
            (chown(CString(""),Int32(1007),Int32(113)),Int32(-1))//返回-1时存在入参失败，无法处理的情况
        ],
        description: "chown()入参"
    )
    return 0
}
