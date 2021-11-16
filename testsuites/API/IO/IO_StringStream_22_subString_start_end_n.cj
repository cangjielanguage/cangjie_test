// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<String>().runCases(
        [
            (StringStream("0123456789").subString(0,0),""),
            (StringStream("012345678B").subString(9,10),"B"),
            (StringStream("01234567a9").subString(0,10),"01234567a9"),
            (StringStream("0123\n\\6789").subString(4,8),"\n\\67"),
            (StringStream("01\n\\456789").subString(10,12),""),
            (StringStream("").subString(0,0),""),
            (StringStream("0123456789你好").subString(7,20),"789你好")
        ],
        description: "subString_start_end入参测试"
    )
    return 0
}