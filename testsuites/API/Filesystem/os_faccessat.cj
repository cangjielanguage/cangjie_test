// DEPENDENCE: caserunner.cj test_fj.txt test_fj_notnull.txt
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import os.*
from ffi import c.*
//mode:R_OK（4） |W_OK（2）|X_OK（1）|F_OK(0)
//flag:AT_SYMLINK_NOFOLLOW|AT_EACCESS
func main() : Int64{
    var op=`open`(CString("test_fj.txt"),O_NOCTTY)
    CaseRunner<Int32>().runCases(
        [
            (faccessat(op,CString("test_fj.txt"),S_IRUSR,S_IRUSR),Int32(-1)),
            (faccessat(op,CString("test_fj.txt"),S_IWUSR,S_IWUSR),Int32(-1)),
            (faccessat(op,CString("test_fj.txt"),S_IXUSR,S_IXUSR),Int32(-1)),
            (faccessat(op,CString("test_fj.txt"),S_IRWXU,S_IRWXU),Int32(-1)),
            (faccessat(op,CString("test_fj.txt"),S_IRGRP,S_IRGRP),Int32(-1)),
            (faccessat(op,CString("test_fj.txt"),S_IWGRP,S_IWGRP),Int32(-1)),
            (faccessat(op,CString("test_fj.txt"),S_IXGRP,S_IXGRP),Int32(-1)),
            (faccessat(op,CString("test_fj.txt"),S_IWUSR,S_IWUSR),Int32(-1)),
            (faccessat(op,CString("test_fj.txt"),S_IRWXG,S_IRWXG),Int32(-1)),
            (faccessat(op,CString("test_fj.txt"),S_IWOTH,S_IWOTH),Int32(-1)),
            (faccessat(op,CString("test_fj.txt"),S_IXOTH,S_IXOTH),Int32(-1)),
            (faccessat(op,CString("test_fj.txt"),S_IRWXO,S_IRWXO),Int32(-1)),
            (faccessat(op,CString("test_fj.txt"),S_IXOTH,S_IRWXO),Int32(-1)),
            (faccessat(op,CString("test_fj.txt"),S_IXOTH,S_IRWXO),Int32(-1)),
            (faccessat(op,CString(""),S_IXOTH,S_IRWXO),Int32(-1))
        ],
        description: "test case 1"
    )
    var op1=`open`(CString(""), O_RDONLY)
    CaseRunner<Int32>().runCases(
        [
            (faccessat(op1,CString("test_fj.txt"),S_IRUSR,S_IRUSR),Int32(-1)),
            (faccessat(op1,CString("test_fj.txt"),S_IWUSR,S_IWUSR),Int32(-1)),
            (faccessat(op1,CString("test_fj.txt"),S_IXUSR,S_IXUSR),Int32(-1)),
            (faccessat(op1,CString("test_fj.txt"),S_IRWXU,S_IRWXU),Int32(-1)),
            (faccessat(op1,CString("test_fj.txt"),S_IRGRP,S_IRGRP),Int32(-1)),
            (faccessat(op1,CString("test_fj.txt"),S_IWGRP,S_IWGRP),Int32(-1)),
            (faccessat(op1,CString("test_fj.txt"),S_IXGRP,S_IXGRP),Int32(-1)),
            (faccessat(op1,CString("test_fj.txt"),S_IWUSR,S_IWUSR),Int32(-1)),
            (faccessat(op1,CString("test_fj.txt"),S_IRWXG,S_IRWXG),Int32(-1)),
            (faccessat(op1,CString("test_fj.txt"),S_IWOTH,S_IWOTH),Int32(-1)),
            (faccessat(op1,CString("test_fj.txt"),S_IXOTH,S_IXOTH),Int32(-1)),
            (faccessat(op1,CString("test_fj.txt"),S_IRWXO,S_IRWXO),Int32(-1)),
            (faccessat(op1,CString("test_fj.txt"),S_IXOTH,S_IRWXO),Int32(-1)),
            (faccessat(op1,CString("test_fj.txt"),S_IXOTH,S_IRWXO),Int32(-1)),
            (faccessat(op1,CString(""),S_IXOTH,S_IRWXO),Int32(-1))
        ],
        description: "test case 2"
    )
    var op2=`open`(CString("test_fj_notnull.txt"), O_TRUNC)
    CaseRunner<Int32>().runCases(
        [
            (faccessat(op2,CString("test_fj_notnull.txt"),S_IRUSR,S_IRUSR),Int32(-1)),
            (faccessat(op2,CString("test_fj_notnull.txt"),S_IWUSR,S_IWUSR),Int32(-1)),
            (faccessat(op2,CString("test_fj_notnull.txt"),S_IXUSR,S_IXUSR),Int32(-1)),
            (faccessat(op2,CString("test_fj_notnull.txt"),S_IRWXU,S_IRWXU),Int32(-1)),
            (faccessat(op2,CString("test_fj_notnull.txt"),S_IRGRP,S_IRGRP),Int32(-1)),
            (faccessat(op2,CString("test_fj_notnull.txt"),S_IWGRP,S_IWGRP),Int32(-1)),
            (faccessat(op2,CString("test_fj_notnull.txt"),S_IXGRP,S_IXGRP),Int32(-1)),
            (faccessat(op2,CString("test_fj_notnull.txt"),S_IWUSR,S_IWUSR),Int32(-1)),
            (faccessat(op2,CString("test_fj_notnull.txt"),S_IRWXG,S_IRWXG),Int32(-1)),
            (faccessat(op2,CString("test_fj_notnull.txt"),S_IWOTH,S_IWOTH),Int32(-1)),
            (faccessat(op2,CString("test_fj_notnull.txt"),S_IXOTH,S_IXOTH),Int32(-1)),
            (faccessat(op2,CString("test_fj_notnull.txt"),S_IRWXO,S_IRWXO),Int32(-1)),
            (faccessat(op2,CString("test_fj_notnull.txt"),S_IXOTH,S_IRWXO),Int32(-1)),
            (faccessat(op2,CString("test_fj_notnull.txt"),S_IXOTH,S_IRWXO),Int32(-1)),
            (faccessat(op2,CString(""),S_IXOTH,S_IRWXO),Int32(-1))
        ],
        description: "test case 3"
    )
    var op3=`open`(CString("test_fj1.txt"), O_TRUNC)
    CaseRunner<Int32>().runCases(
        [
            (faccessat(op3,CString("test_fj_notnull.txt"),S_IRUSR,S_IRUSR),Int32(-1)),
            (faccessat(op3,CString("test_fj_notnull.txt"),S_IWUSR,S_IWUSR),Int32(-1)),
            (faccessat(op3,CString("test_fj_notnull.txt"),S_IXUSR,S_IXUSR),Int32(-1)),
            (faccessat(op3,CString("test_fj_notnull.txt"),S_IRWXU,S_IRWXU),Int32(-1)),
            (faccessat(op3,CString("test_fj_notnull.txt"),S_IRGRP,S_IRGRP),Int32(-1)),
            (faccessat(op3,CString("test_fj_notnull.txt"),S_IWGRP,S_IWGRP),Int32(-1)),
            (faccessat(op3,CString("test_fj_notnull.txt"),S_IXGRP,S_IXGRP),Int32(-1)),
            (faccessat(op3,CString("test_fj_notnull.txt"),S_IWUSR,S_IWUSR),Int32(-1)),
            (faccessat(op3,CString("test_fj_notnull.txt"),S_IRWXG,S_IRWXG),Int32(-1)),
            (faccessat(op3,CString("test_fj_notnull.txt"),S_IWOTH,S_IWOTH),Int32(-1)),
            (faccessat(op3,CString("test_fj_notnull.txt"),S_IXOTH,S_IXOTH),Int32(-1)),
            (faccessat(op3,CString("test_fj_notnull.txt"),S_IRWXO,S_IRWXO),Int32(-1)),
            (faccessat(op3,CString("test_fj_notnull.txt"),S_IXOTH,S_IRWXO),Int32(-1)),
            (faccessat(op3,CString("test_fj_notnull.txt"),S_IXOTH,S_IRWXO),Int32(-1)),
            (faccessat(op3,CString(""),S_IXOTH,S_IRWXO),Int32(-1))
        ],
        description: "test case 4"
    )
    var op4=`open`(CString("test_fj_notnull.txt"), O_TRUNC)
    CaseRunner<Int32>().runCases(
        [
            (faccessat(op4,CString("test_fj1.txt"),S_IRUSR,S_IRUSR),Int32(-1)),
            (faccessat(op4,CString("test_fj1.txt"),S_IWUSR,S_IWUSR),Int32(-1)),
            (faccessat(op4,CString("test_fj1.txt"),S_IXUSR,S_IXUSR),Int32(-1)),
            (faccessat(op4,CString("test_fj1.txt"),S_IRWXU,S_IRWXU),Int32(-1)),
            (faccessat(op4,CString("test_fj1.txt"),S_IRGRP,S_IRGRP),Int32(-1)),
            (faccessat(op4,CString("test_fj1.txt"),S_IWGRP,S_IWGRP),Int32(-1)),
            (faccessat(op4,CString("test_fj1.txt"),S_IXGRP,S_IXGRP),Int32(-1)),
            (faccessat(op4,CString("test_fj1.txt"),S_IWUSR,S_IWUSR),Int32(-1)),
            (faccessat(op4,CString("test_fj1.txt"),S_IRWXG,S_IRWXG),Int32(-1)),
            (faccessat(op4,CString("test_fj1.txt"),S_IWOTH,S_IWOTH),Int32(-1)),
            (faccessat(op4,CString("test_fj1.txt"),S_IXOTH,S_IXOTH),Int32(-1)),
            (faccessat(op4,CString("test_fj1.txt"),S_IRWXO,S_IRWXO),Int32(-1)),
            (faccessat(op4,CString("test_fj1.txt"),S_IXOTH,S_IRWXO),Int32(-1)),
            (faccessat(op4,CString("test_fj1.txt"),S_IXOTH,S_IRWXO),Int32(-1)),
            (faccessat(op4,CString(""),S_IXOTH,S_IRWXO),Int32(-1))
        ],
        description: "test case 5"
    )
    return 0
}
