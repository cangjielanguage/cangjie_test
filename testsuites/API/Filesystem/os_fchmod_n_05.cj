// DEPENDENCE: caserunner.cj test_fj_0.txt
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_arg | compare %f
// ASSERT: scan-not AssertionError


from std import os.*
from ffi import c.*
func main() : Int64{
    //绝对路径没法公有化，每个人的框架放置位置不一致，没法移植
    var op0=`open`(CString("$CANGJIE_HOME/../source/testcases/HLT/test_fj_0.txt"), O_RDONLY)
    CaseRunner<Int32>().runCases(
        [
            (fchmod(op0,S_IRUSR),Int32(-1)),
            (fchmod(op0,S_IWUSR),Int32(-1)),
            (fchmod(op0,S_IXUSR),Int32(-1)),
            (fchmod(op0,S_IRWXU),Int32(-1)),
            (fchmod(op0,S_IRGRP),Int32(-1)),
            (fchmod(op0,S_IWGRP),Int32(-1)),
            (fchmod(op0,S_IXGRP),Int32(-1)),
            (fchmod(op0,S_IRWXG),Int32(-1)),
            (fchmod(op0,S_IROTH),Int32(-1)),
            (fchmod(op0,S_IWOTH),Int32(-1)),
            (fchmod(op0,S_IXOTH),Int32(-1)),
            (fchmod(op0,S_IRWXO),Int32(-1))
        ],
        description: "test case 4"
    )
    return 0
}
