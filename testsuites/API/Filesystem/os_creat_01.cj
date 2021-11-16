// DEPENDENCE: caserunner.cj test_fj.txt test_fj_notnull.txt
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import os.*
from ffi import c.*

func main() {
    var op1=creat(CString("test_fj.txt"), O_RDONLY)
    var op2=creat(CString("test_fj.txt"), O_RDWR)
    var op3=creat(CString("test_fj.txt"), O_WRONLY)
    var op4=creat(CString("test_fj.txt"), O_APPEND)
    var op5=creat(CString("test_fj.txt"), O_CLOEXEC)
    var op6=creat(CString("test_fj.txt"), O_CREAT)
    var op7=creat(CString("test_fj.txt"), O_DIRECTORY)
    var op8=creat(CString("test_fj.txt"), O_DSYNC)
    var op9=creat(CString("test_fj.txt"), O_EXCL)
    var op10=creat(CString("test_fj.txt"), O_NOCTTY)
    var op11=creat(CString("test_fj.txt"), O_NOFOLLOW)
    var op12=creat(CString("test_fj.txt"), O_NONBLOCK)
    var op13=creat(CString("test_fj.txt"), O_SYNC)
    var op14=creat(CString("test_fj.txt"), O_TRUNC)
    var op15=creat(CString("test_fj.txt"), O_RSYNC)
    CaseRunner<Bool>().runCasesTrue(
        [
            (op1 is Int32),
            (op2 is Int32),
            (op3 is Int32),
            (op4 is Int32),
            (op5 is Int32),
            (op6 is Int32),
            (op7 is Int32),
            (op8 is Int32),
            (op9 is Int32),
            (op10 is Int32),
            (op11 is Int32),
            (op12 is Int32),
            (op13 is Int32),
            (op14 is Int32),
            (op15 is Int32)
        ],
        description: "test case 1"
    )
    return 0
}
