// DEPENDENCE: caserunner.cj test_fj.txt test_fj_notnull.txt
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import os.*
from ffi import c.*
func main() : Int64{
    CaseRunner<Int32>().runCases(
        [
            (lchown(CString("test_fj.txt"),Int32(1013),Int32(113)),Int32(0)),
            (lchown(CString("test_fj_notnull.txt"),Int32(1013),Int32(113)),Int32(0)),
            (lchown(CString("test_fj1.txt"),1007,113),Int32(-1)),
            (lchown(CString(""),1007,113),Int32(-1))
        ],
        description: "test case 1"
    )
    return 0
}
