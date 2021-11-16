// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC: pwd
// EXEC: ls -l | compare %f
// ASSERT: scan-not test_fj1.txt

from std import os.*
from ffi import c.*
func main() : Int64{
var op1=`open`(CString("test_fj1.txt"), O_RDONLY)//不存在的文件
    CaseRunner<Int32>().runCases(
        [
            (fchmod(op1,S_IRUSR),Int32(-1)),
            (fchmod(op1,S_IWUSR),Int32(-1)),
            (fchmod(op1,S_IXUSR),Int32(-1)),
            (fchmod(op1,S_IRWXU),Int32(-1)),
            (fchmod(op1,S_IRGRP),Int32(-1)),
            (fchmod(op1,S_IWGRP),Int32(-1)),
            (fchmod(op1,S_IXGRP),Int32(-1)),
            (fchmod(op1,S_IRWXG),Int32(-1)),
            (fchmod(op1,S_IROTH),Int32(-1)),
            (fchmod(op1,S_IWOTH),Int32(-1)),
            (fchmod(op1,S_IXOTH),Int32(-1)),
            (fchmod(op1,S_IRWXO),Int32(-1))
        ],
        description: "fchmod()函数入参文件是不存在的文件"
    )
    return 0
}
