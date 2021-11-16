// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC: pwd
// EXEC: ls -l

from std import os.*
from ffi import c.*
func main() : Int64{
    CaseRunner<Int32>().runCases(
        [
            //文件不存在
            (chmod(CString(""),S_IRUSR),Int32(-1)),
            (chmod(CString(""),S_IWUSR),Int32(-1)),
            (chmod(CString(""),S_IXUSR),Int32(-1)),
            (chmod(CString(""),S_IRWXU),Int32(-1)),
            (chmod(CString(""),S_IRGRP),Int32(-1)),
            (chmod(CString(""),S_IWGRP),Int32(-1)),
            (chmod(CString(""),S_IXGRP),Int32(-1)),
            (chmod(CString(""),S_IRWXG),Int32(-1)),
            (chmod(CString(""),S_IROTH),Int32(-1)),
            (chmod(CString(""),S_IWOTH),Int32(-1)),
            (chmod(CString(""),S_IXOTH),Int32(-1)),
            (chmod(CString(""),S_IRWXO),Int32(-1))
        ],
        description: "chmod()函数，入参是文件不存在"
    )
    return 0
}
