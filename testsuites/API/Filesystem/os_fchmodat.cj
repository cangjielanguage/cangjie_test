// DEPENDENCE: caserunner.cj test_fj.txt test_fj_notnull.txt
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import os.*
from ffi import c.*
func main() : Int64{
    var op=`open`(CString("test_fj.txt"), O_RDONLY)
    CaseRunner<Int32>().runCases(
        [
            (fchmodat(op,CString("test_fj.txt"),S_IRUSR,S_IRUSR),Int32(-1)),
            (fchmodat(op,CString("test_fj.txt"),S_IWUSR,S_IWUSR),Int32(-1)),
            (fchmodat(op,CString("test_fj.txt"),S_IXUSR,S_IXUSR),Int32(-1)),
            (fchmodat(op,CString("test_fj.txt"),S_IRWXU,S_IRWXU),Int32(-1)),
            (fchmodat(op,CString("test_fj.txt"),S_IRGRP,S_IRGRP),Int32(-1)),
            (fchmodat(op,CString("test_fj.txt"),S_IWGRP,S_IWGRP),Int32(-1)),
            (fchmodat(op,CString("test_fj.txt"),S_IXGRP,S_IXGRP),Int32(-1)),
            (fchmodat(op,CString("test_fj.txt"),S_IRWXG,S_IRWXG),Int32(-1)),
            (fchmodat(op,CString("test_fj.txt"),S_IROTH,S_IROTH),Int32(-1)),
            (fchmodat(op,CString("test_fj.txt"),S_IWOTH,S_IWOTH),Int32(-1)),
            (fchmodat(op,CString("test_fj.txt"),S_IXOTH,S_IXOTH),Int32(-1)),
            (fchmodat(op,CString("test_fj.txt"),S_IRWXO,S_IRWXO),Int32(-1))
        ],
        description: "test case 1"
    )
    var op1=`open`(CString(""), O_RDONLY)
    CaseRunner<Int32>().runCases(
        [
            (fchmodat(op1,CString("test_fj.txt"),S_IRUSR,S_IRUSR),Int32(-1)),
            (fchmodat(op1,CString("test_fj.txt"),S_IWUSR,S_IWUSR),Int32(-1)),
            (fchmodat(op1,CString("test_fj.txt"),S_IXUSR,S_IXUSR),Int32(-1)),
            (fchmodat(op1,CString("test_fj.txt"),S_IRWXU,S_IRWXU),Int32(-1)),
            (fchmodat(op1,CString("test_fj.txt"),S_IRGRP,S_IRGRP),Int32(-1)),
            (fchmodat(op1,CString("test_fj.txt"),S_IWGRP,S_IWGRP),Int32(-1)),
            (fchmodat(op1,CString("test_fj.txt"),S_IXGRP,S_IXGRP),Int32(-1)),
            (fchmodat(op1,CString("test_fj.txt"),S_IRWXG,S_IRWXG),Int32(-1)),
            (fchmodat(op1,CString("test_fj.txt"),S_IROTH,S_IROTH),Int32(-1)),
            (fchmodat(op1,CString("test_fj.txt"),S_IWOTH,S_IWOTH),Int32(-1)),
            (fchmodat(op1,CString("test_fj.txt"),S_IXOTH,S_IXOTH),Int32(-1)),
            (fchmodat(op1,CString("test_fj.txt"),S_IRWXO,S_IRWXO),Int32(-1))
        ],
        description: "test case 2"
    )
    var op2=`open`(CString(""), O_RDONLY)
    CaseRunner<Int32>().runCases(
        [
            (fchmodat(op2,CString(""),S_IRUSR,S_IRUSR),Int32(-1)),
            (fchmodat(op2,CString(""),S_IWUSR,S_IWUSR),Int32(-1)),
            (fchmodat(op2,CString(""),S_IXUSR,S_IXUSR),Int32(-1)),
            (fchmodat(op2,CString(""),S_IRWXU,S_IRWXU),Int32(-1)),
            (fchmodat(op2,CString(""),S_IRGRP,S_IRGRP),Int32(-1)),
            (fchmodat(op2,CString(""),S_IWGRP,S_IWGRP),Int32(-1)),
            (fchmodat(op2,CString(""),S_IXGRP,S_IXGRP),Int32(-1)),
            (fchmodat(op2,CString(""),S_IRWXG,S_IRWXG),Int32(-1)),
            (fchmodat(op2,CString(""),S_IROTH,S_IROTH),Int32(-1)),
            (fchmodat(op2,CString(""),S_IWOTH,S_IWOTH),Int32(-1)),
            (fchmodat(op2,CString(""),S_IXOTH,S_IXOTH),Int32(-1)),
            (fchmodat(op2,CString(""),S_IRWXO,S_IRWXO),Int32(-1))
        ],
        description: "test case 3"
    )
    var op3=`open`(CString("test_fj_notnull.txt"), O_RDONLY)
    CaseRunner<Int32>().runCases(
        [
            (fchmodat(op3,CString(""),S_IRUSR,S_IRUSR),Int32(-1)),
            (fchmodat(op3,CString(""),S_IWUSR,S_IWUSR),Int32(-1)),
            (fchmodat(op3,CString(""),S_IXUSR,S_IXUSR),Int32(-1)),
            (fchmodat(op3,CString(""),S_IRWXU,S_IRWXU),Int32(-1)),
            (fchmodat(op3,CString(""),S_IRGRP,S_IRGRP),Int32(-1)),
            (fchmodat(op3,CString(""),S_IWGRP,S_IWGRP),Int32(-1)),
            (fchmodat(op3,CString(""),S_IXGRP,S_IXGRP),Int32(-1)),
            (fchmodat(op3,CString(""),S_IRWXG,S_IRWXG),Int32(-1)),
            (fchmodat(op3,CString(""),S_IROTH,S_IROTH),Int32(-1)),
            (fchmodat(op3,CString(""),S_IWOTH,S_IWOTH),Int32(-1)),
            (fchmodat(op3,CString(""),S_IXOTH,S_IXOTH),Int32(-1)),
            (fchmodat(op3,CString(""),S_IRWXO,S_IRWXO),Int32(-1))
        ],
        description: "test case 4"
    )
    var op4=`open`(CString(""), O_RDONLY)
    CaseRunner<Int32>().runCases(
        [
            (fchmodat(op4,CString("test_fj_notnull.txt"),S_IRUSR,S_IRUSR),Int32(-1)),
            (fchmodat(op4,CString("test_fj_notnull.txt"),S_IWUSR,S_IWUSR),Int32(-1)),
            (fchmodat(op4,CString("test_fj_notnull.txt"),S_IXUSR,S_IXUSR),Int32(-1)),
            (fchmodat(op4,CString("test_fj_notnull.txt"),S_IRWXU,S_IRWXU),Int32(-1)),
            (fchmodat(op4,CString("test_fj_notnull.txt"),S_IRGRP,S_IRGRP),Int32(-1)),
            (fchmodat(op4,CString("test_fj_notnull.txt"),S_IWGRP,S_IWGRP),Int32(-1)),
            (fchmodat(op4,CString("test_fj_notnull.txt"),S_IXGRP,S_IXGRP),Int32(-1)),
            (fchmodat(op4,CString("test_fj_notnull.txt"),S_IRWXG,S_IRWXG),Int32(-1)),
            (fchmodat(op4,CString("test_fj_notnull.txt"),S_IROTH,S_IROTH),Int32(-1)),
            (fchmodat(op4,CString("test_fj_notnull.txt"),S_IWOTH,S_IWOTH),Int32(-1)),
            (fchmodat(op4,CString("test_fj_notnull.txt"),S_IXOTH,S_IXOTH),Int32(-1)),
            (fchmodat(op4,CString("test_fj_notnull.txt"),S_IRWXO,S_IRWXO),Int32(-1))
        ],
        description: "test case 5"
    )
    return 0
}