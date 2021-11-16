// DEPENDENCE: caserunner.cj test_fj.txt test_fj_notnull.txt
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan-not AssertionError
from std import os.*
from ffi import c.*

func main() : Int64{
    CaseRunner<Int32>().runCases(
        [
            (access(CString("test_fj.txt"),Int32(4)),Int32(0)),
            (access(CString("test_fj.txt"),Int32(2)),Int32(0)),
            (access(CString("test_fj.txt"),Int32(1)),Int32(-1)),
            (access(CString("test_fj.txt"),Int32(0)),Int32(0))
        ],
        description: "access()函数入参是已存在，但内容为空的文件"
    )
    CaseRunner<Int32>().runCases(
        [
            (access(CString("test_fj1.txt"),Int32(4)),Int32(-1)),
            (access(CString("test_fj1.txt"),Int32(2)),Int32(-1)),
            (access(CString("test_fj1.txt"),Int32(1)),Int32(-1)),
            (access(CString("test_fj1.txt"),Int32(0)),Int32(-1))
        ],
         description: "access()函数入参是不存在的文件"
     )
    CaseRunner<Int32>().runCases(
        [
            (access(CString(""),Int32(4)),Int32(-1)),
            (access(CString(""),Int32(2)),Int32(-1)),
            (access(CString(""),Int32(1)),Int32(-1)),
            (access(CString(""),Int32(0)),Int32(-1))
        ],
        description: "access()函数入参文件是空路径"
    )
    CaseRunner<Int32>().runCases(
        [
            (access(CString("test_fj_notnull1.txt"),Int32(4)),Int32(-1)),
            (access(CString("test_fj_notnull1.txt"),Int32(2)),Int32(-1)),
            (access(CString("test_fj_notnull1.txt"),Int32(1)),Int32(-1)),
            (access(CString("test_fj_notnull1.txt"),Int32(0)),Int32(-1))
        ],
        description: "access()函数入参是存在的文件，且文件内容不为空"
    )
    return 0
}
