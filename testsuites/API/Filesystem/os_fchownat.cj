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
            (fchownat(op,CString("test_fj.txt"),65,65,S_IRUSR),Int32(-1)),
            (fchownat(op,CString("test_fj.txt"),65,65,S_IWUSR),Int32(-1)),
            (fchownat(op,CString("test_fj.txt"),65,65,S_IXUSR),Int32(-1)),
            (fchownat(op,CString("test_fj.txt"),65,65,S_IRWXU),Int32(-1)),
            (fchownat(op,CString("test_fj.txt"),65,65,S_IRGRP),Int32(-1)),
            (fchownat(op,CString("test_fj.txt"),65,65,S_IWGRP),Int32(-1)),
            (fchownat(op,CString("test_fj.txt"),65,65,S_IXGRP),Int32(-1)),
            (fchownat(op,CString("test_fj.txt"),65,65,S_IRWXG),Int32(-1)),
            (fchownat(op,CString("test_fj.txt"),65,65,S_IROTH),Int32(-1)),
            (fchownat(op,CString("test_fj.txt"),65,65,S_IWOTH),Int32(-1)),
            (fchownat(op,CString("test_fj.txt"),65,65,S_IXOTH),Int32(-1)),
            (fchownat(op,CString("test_fj.txt"),65,65,S_IRWXO),Int32(-1))
        ],
        description: "test case 1"
    )
    var op1=`open`(CString("test_fj1.txt"), O_RDONLY)
    CaseRunner<Int32>().runCases(
        [
            (fchownat(op1,CString("test_fj.txt"),65,65,S_IRUSR),Int32(-1)),
            (fchownat(op1,CString("test_fj.txt"),65,65,S_IWUSR),Int32(-1)),
            (fchownat(op1,CString("test_fj.txt"),65,65,S_IXUSR),Int32(-1)),
            (fchownat(op1,CString("test_fj.txt"),65,65,S_IRWXU),Int32(-1)),
            (fchownat(op1,CString("test_fj.txt"),65,65,S_IRGRP),Int32(-1)),
            (fchownat(op1,CString("test_fj.txt"),65,65,S_IWGRP),Int32(-1)),
            (fchownat(op1,CString("test_fj.txt"),65,65,S_IXGRP),Int32(-1)),
            (fchownat(op1,CString("test_fj.txt"),65,65,S_IRWXG),Int32(-1)),
            (fchownat(op1,CString("test_fj.txt"),65,65,S_IROTH),Int32(-1)),
            (fchownat(op1,CString("test_fj.txt"),65,65,S_IWOTH),Int32(-1)),
            (fchownat(op1,CString("test_fj.txt"),65,65,S_IXOTH),Int32(-1)),
            (fchownat(op1,CString("test_fj.txt"),65,65,S_IRWXO),Int32(-1))
        ],
        description: "test case 2"
    )
    var op2=`open`(CString(""),O_RDONLY)
    CaseRunner<Int32>().runCases(
        [
            (fchownat(op2,CString("test_fj.txt"),65,65,S_IRUSR),Int32(-1)),
            (fchownat(op2,CString("test_fj.txt"),65,65,S_IWUSR),Int32(-1)),
            (fchownat(op2,CString("test_fj.txt"),65,65,S_IXUSR),Int32(-1)),
            (fchownat(op2,CString("test_fj.txt"),65,65,S_IRWXU),Int32(-1)),
            (fchownat(op2,CString("test_fj.txt"),65,65,S_IRGRP),Int32(-1)),
            (fchownat(op2,CString("test_fj.txt"),65,65,S_IWGRP),Int32(-1)),
            (fchownat(op2,CString("test_fj.txt"),65,65,S_IXGRP),Int32(-1)),
            (fchownat(op2,CString("test_fj.txt"),65,65,S_IRWXG),Int32(-1)),
            (fchownat(op2,CString("test_fj.txt"),65,65,S_IROTH),Int32(-1)),
            (fchownat(op2,CString("test_fj.txt"),65,65,S_IWOTH),Int32(-1)),
            (fchownat(op2,CString("test_fj.txt"),65,65,S_IXOTH),Int32(-1)),
            (fchownat(op2,CString("test_fj.txt"),65,65,S_IRWXO),Int32(-1))
        ],
        description: "test case 3"
    )

    var op3=`open`(CString("test_fj_notnull.txt"), O_RDONLY)
    CaseRunner<Int32>().runCases(
        [
            (fchownat(op3,CString("test_fj1.txt"),65,65,S_IRUSR),Int32(-1)),
            (fchownat(op3,CString("test_fj1.txt"),65,65,S_IWUSR),Int32(-1)),
            (fchownat(op3,CString("test_fj1.txt"),65,65,S_IXUSR),Int32(-1)),
            (fchownat(op3,CString("test_fj1.txt"),65,65,S_IRWXU),Int32(-1)),
            (fchownat(op3,CString("test_fj1.txt"),65,65,S_IRGRP),Int32(-1)),
            (fchownat(op3,CString("test_fj1.txt"),65,65,S_IWGRP),Int32(-1)),
            (fchownat(op3,CString("test_fj1.txt"),65,65,S_IXGRP),Int32(-1)),
            (fchownat(op3,CString("test_fj1.txt"),65,65,S_IRWXG),Int32(-1)),
            (fchownat(op3,CString("test_fj1.txt"),65,65,S_IROTH),Int32(-1)),
            (fchownat(op3,CString("test_fj1.txt"),65,65,S_IWOTH),Int32(-1)),
            (fchownat(op3,CString("test_fj1.txt"),65,65,S_IXOTH),Int32(-1)),
            (fchownat(op3,CString("test_fj1.txt"),65,65,S_IRWXO),Int32(-1))
        ],
        description: "test case 4"
    )
   return 0
}
