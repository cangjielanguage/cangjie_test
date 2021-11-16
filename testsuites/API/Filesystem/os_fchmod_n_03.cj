// DEPENDENCE: caserunner.cj test_fj_notnull_0.txt test_fj_notnull_1.txt test_fj_notnull_2.txt test_fj_notnull_3.txt test_fj_notnull_4.txt test_fj_notnull_5.txt test_fj_notnull_6.txt test_fj_notnull_7.txt test_fj_notnull_8.txt test_fj_notnull_9.txt test_fj_notnull_10.txt test_fj_notnull_11.txt
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC: pwd
// EXEC-PIPE: %ls -l |grep '\-r\-\-\-\-\-\-\-\-'| grep 'test_fj_notnull_0.txt'
// EXEC-PIPE: %ls -l |grep '\-\-w\-\-\-\-\-\-\-'| grep 'test_fj_notnull_1.txt'
// EXEC-PIPE: %ls -l |grep '\-\-\-x\-\-\-\-\-\-'| grep 'test_fj_notnull_2.txt'
// EXEC-PIPE: %ls -l |grep '\-rwx\-\-\-\-\-\-'| grep 'test_fj_notnull_3.txt'
// EXEC-PIPE: %ls -l |grep '\-\-\-\-r\-\-\-\-\-'| grep 'test_fj_notnull_4.txt'
// EXEC-PIPE: %ls -l |grep '\-\-\-\-\-w\-\-\-\-'| grep 'test_fj_notnull_5.txt'
// EXEC-PIPE: %ls -l |grep '\-\-\-\-\-\-x\-\-\-'| grep 'test_fj_notnull_6.txt'
// EXEC-PIPE: %ls -l |grep '\-\-\-\-rwx\-\-\-'| grep 'test_fj_notnull_7.txt'
// EXEC-PIPE: %ls -l |grep '\-\-\-\-\-\-\-r\-\-'| grep 'test_fj_notnull_8.txt'
// EXEC-PIPE: %ls -l |grep '\-\-\-\-\-\-\-\-w\-'| grep 'test_fj_notnull_9.txt'
// EXEC-PIPE: %ls -l |grep '\-\-\-\-\-\-\-\-\-x'| grep 'test_fj_notnull_10.txt'
// EXEC-PIPE: %ls -l |grep '\-\-\-\-\-\-\-rwx'| grep 'test_fj_notnull_11.txt'

from std import os.*
from ffi import c.*
func main() : Int64{
    var op0=`open`(CString("test_fj_notnull_0.txt"), O_RDONLY)
    var op1=`open`(CString("test_fj_notnull_1.txt"), O_RDONLY)
    var op2=`open`(CString("test_fj_notnull_2.txt"), O_RDONLY)
    var op3=`open`(CString("test_fj_notnull_3.txt"), O_RDONLY)
    var op4=`open`(CString("test_fj_notnull_4.txt"), O_RDONLY)
    var op5=`open`(CString("test_fj_notnull_5.txt"), O_RDONLY)
    var op6=`open`(CString("test_fj_notnull_6.txt"), O_RDONLY)
    var op7=`open`(CString("test_fj_notnull_7.txt"), O_RDONLY)
    var op8=`open`(CString("test_fj_notnull_8.txt"), O_RDONLY)
    var op9=`open`(CString("test_fj_notnull_9.txt"), O_RDONLY)
    var op10=`open`(CString("test_fj_notnull_10.txt"), O_RDONLY)
    var op11=`open`(CString("test_fj_notnull_11.txt"), O_RDONLY)
    CaseRunner<Int32>().runCases(
        [
            (fchmod(op0,S_IRUSR),Int32(0)),
            (fchmod(op1,S_IWUSR),Int32(0)),
            (fchmod(op2,S_IXUSR),Int32(0)),
            (fchmod(op3,S_IRWXU),Int32(0)),
            (fchmod(op4,S_IRGRP),Int32(0)),
            (fchmod(op5,S_IWGRP),Int32(0)),
            (fchmod(op6,S_IXGRP),Int32(0)),
            (fchmod(op7,S_IRWXG),Int32(0)),
            (fchmod(op8,S_IROTH),Int32(0)),
            (fchmod(op9,S_IWOTH),Int32(0)),
            (fchmod(op10,S_IXOTH),Int32(0)),
            (fchmod(op11,S_IRWXO),Int32(0))
        ],
        description: "fchmod()函数入参文件存在且内容不为空"
    )
    return 0
}
