// DEPENDENCE: caserunner.cj test_fj.txt test_fj_notnull.txt
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import os.*
from ffi import c.*
//func openat64(fd: Int32, path: CString, oflag: Int32): Int32
//func isReg(path: CString, mode: Int32): Bool
//oflag:O_RDONLY=0|O_RDWR=2|O_WRONLY=1|O_APPEND=|O_CLOEXEC=|O_CREAT=|O_DIRECTORY=|O_DSYNC=
//oflag:|O_EXCL=|O_NOCTTY=|O_NOFOLLOW=|O_NONBLOCK=|O_SYNC=|O_TRUNC=|O_RSYNC
//flag/mode:S_IRUSR=256|S_IWUSR=128|S_IXUSR=64|S_IRWXU=448|S_IRGRP=32|S_IWGRP=16|S_IXGRP=8|S_IRWXG=56|S_IROTH=4|S_IWOTH=2|S_IXOTH=1|S_IRWXO=7
func main() {
    var op1=`open`(CString("test_fj_notnull.txt"), O_RDONLY)
    var opt1=openat64(op1,CString("test_fj.txt"),O_RSYNC)
    CaseRunner<Int32>().runCases(
        [
            (opt1,-1)
        ],
        description: "test case 1"
    )
    var op2=`open`(CString("test_fj_notnull.txt"), O_RDWR)
    var opt2=openat64(op2,CString("test_fj.txt"), O_TRUNC)
    CaseRunner<Int32>().runCases(
        [
            (opt2,-1)
        ],
        description: "test case 2"
    )
    var op3=`open`(CString("test_fj_notnull.txt"), O_WRONLY)
    var opt3=openat64(op3,CString("test_fj.txt"), O_SYNC)
    CaseRunner<Int32>().runCases(
        [
            (opt3,-1)
        ],
        description: "test case 3"
    )
    var op4=`open`(CString("test_fj_notnull.txt"), O_APPEND)
    var opt4=openat64(op4,CString("test_fj.txt"), O_NONBLOCK)
    CaseRunner<Int32>().runCases(
        [
            (opt4,-1)
        ],
        description: "test case 4"
    )
    var op5=`open`(CString("test_fj_notnull.txt"), O_CLOEXEC)
    var opt5=openat64(op5,CString("test_fj.txt"), O_NOFOLLOW)
    CaseRunner<Int32>().runCases(
        [
            (opt5,-1)
        ],
        description: "test case 5"
    )
    var op6=`open`(CString("test_fj_notnull.txt"), O_CREAT)
    var opt6=openat64(op6,CString("test_fj.txt"), O_NOCTTY)
    CaseRunner<Int32>().runCases(
        [
            (opt6,-1)
        ],
        description: "test case 6"
    )
    var op7=`open`(CString("test_fj_notnull.txt"), O_DIRECTORY)
    var opt7=openat64(op7,CString("test_fj.txt"), O_EXCL)
    CaseRunner<Int32>().runCases(
        [
            (opt7,-1)
        ],
        description: "test case 7"
    )

    var op8=`open`(CString("test_fj_notnull.txt"), O_DSYNC)
    var opt8=openat64(op8,CString("test_fj.txt"), O_DSYNC)
    CaseRunner<Int32>().runCases(
        [
            (opt8,-1)
        ],
        description: "test case 8"
    )

    var op9=`open`(CString("test_fj_notnull.txt"), O_EXCL)
    var opt9=openat64(op9,CString("test_fj.txt"), O_DIRECTORY)
    CaseRunner<Int32>().runCases(
        [
            (opt9,-1)
        ],
        description: "test case 9"
    )
    print("op9=${op9}\n")
    var op10=`open`(CString("test_fj_notnull.txt"), O_NOCTTY)
    var opt10=openat64(op10,CString("test_fj.txt"), O_CREAT)
    CaseRunner<Int32>().runCases(
        [
            (opt10,-1)
        ],
        description: "test case 10"
    )
    var op11=`open`(CString("test_fj_notnull.txt"), O_NOFOLLOW)
    var opt11=openat64(op11,CString("test_fj.txt"),O_CLOEXEC)
    CaseRunner<Int32>().runCases(
        [
            (opt11,-1)
        ],
        description: "test case 11"
    )
    var op12=`open`(CString("test_fj_notnull.txt"), O_NONBLOCK)
    var opt12=openat64(op12,CString("test_fj.txt"), O_APPEND)
    CaseRunner<Int32>().runCases(
        [
            (opt12,-1)
        ],
        description: "test case 12"
    )
    var op13=`open`(CString("test_fj_notnull.txt"), O_SYNC)
    var opt13=openat64(op13,CString("test_fj.txt"), O_WRONLY)
    CaseRunner<Int32>().runCases(
        [
            (opt13,-1)
        ],
        description: "test case 13"
    )
    var op14=`open`(CString("test_fj_notnull.txt"), O_TRUNC)
    var opt14=openat64(op14,CString("test_fj.txt"),O_RDWR)
    CaseRunner<Int32>().runCases(
        [
            (opt14,-1)
        ],
        description: "test case 14"
    )
    var op15=`open`(CString("test_fj_notnull.txt"), O_RSYNC)
    var opt15=openat64(op15,CString("test_fj.txt"), O_RDONLY)
    CaseRunner<Int32>().runCases(
        [
            (opt15,-1)
        ],
        description: "test case 15"
    )
    return 0
}
