// DEPENDENCE: caserunner.cj test_fj_notnull_0.txt test_fj_notnull_1.txt test_fj_notnull_2.txt test_fj_notnull_3.txt test_fj_notnull_4.txt test_fj_notnull_5.txt test_fj_notnull_6.txt test_fj_notnull_7.txt test_fj_notnull_8.txt test_fj_notnull_9.txt test_fj_notnull_10.txt test_fj_notnull_11.txt
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC-PIPE: %ls -l| grep '\-r\-\-\-\-\-\-\-\-'| grep 'test_fj_notnull_0.txt'
// EXEC-PIPE: %ls -l| grep '\-\-w\-\-\-\-\-\-\-'| grep 'test_fj_notnull_1.txt'
// EXEC-PIPE: %ls -l| grep '\-\-\-x\-\-\-\-\-\-'| grep 'test_fj_notnull_2.txt'
// EXEC-PIPE: %ls -l| grep '\-rwx\-\-\-\-\-\-'| grep 'test_fj_notnull_3.txt'
// EXEC-PIPE: %ls -l| grep '\-\-\-\-r\-\-\-\-\-'| grep 'test_fj_notnull_4.txt'
// EXEC-PIPE: %ls -l| grep '\-\-\-\-\-w\-\-\-\-'| grep 'test_fj_notnull_5.txt'
// EXEC-PIPE: %ls -l| grep '\-\-\-\-\-\-x\-\-\-'| grep 'test_fj_notnull_6.txt'
// EXEC-PIPE: %ls -l| grep '\-\-\-\-rwx\-\-\-' | grep 'test_fj_notnull_7.txt'
// EXEC-PIPE: %ls -l| grep '\-\-\-\-\-\-\-r\-\-'| grep 'test_fj_notnull_8.txt'
// EXEC-PIPE: %ls -l| grep '\-\-\-\-\-\-\-\-w\-'| grep 'test_fj_notnull_9.txt'
// EXEC-PIPE: %ls -l| grep '\-\-\-\-\-\-\-\-\-x'| grep 'test_fj_notnull_10.txt'
// EXEC-PIPE: %ls -l| grep '\-\-\-\-\-\-\-rwx'|grep 'test_fj_notnull_11.txt'

from std import os.*
from ffi import c.*
func main() : Int64{
    CaseRunner<Int32>().runCases(
        [
            (chmod(CString("test_fj_notnull_0.txt"),S_IRUSR),Int32(0)),
            (chmod(CString("test_fj_notnull_1.txt"),S_IWUSR),Int32(0)),
            (chmod(CString("test_fj_notnull_2.txt"),S_IXUSR),Int32(0)),
            (chmod(CString("test_fj_notnull_3.txt"),S_IRWXU),Int32(0)),
            (chmod(CString("test_fj_notnull_4.txt"),S_IRGRP),Int32(0)),
            (chmod(CString("test_fj_notnull_5.txt"),S_IWGRP),Int32(0)),
            (chmod(CString("test_fj_notnull_6.txt"),S_IXGRP),Int32(0)),
            (chmod(CString("test_fj_notnull_7.txt"),S_IRWXG),Int32(0)),
            (chmod(CString("test_fj_notnull_8.txt"),S_IROTH),Int32(0)),
            (chmod(CString("test_fj_notnull_9.txt"),S_IWOTH),Int32(0)),
            (chmod(CString("test_fj_notnull_10.txt"),S_IXOTH),Int32(0)),
            (chmod(CString("test_fj_notnull_11.txt"),S_IRWXO),Int32(0))
        ],
        description: "chmod()函数，入参是文件存在但内容不为空"
    )
    return 0
}
