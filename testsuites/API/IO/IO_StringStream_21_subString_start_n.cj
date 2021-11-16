// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<String>().runCases(
        [
            (StringStream("0123456789").subString(0),"0123456789"),
            (StringStream("0123456789").subString(4),"456789"),
            (StringStream("0123456789").subString(9),"9"),
            (StringStream("0123456789").subString(10),"")
        ],
        description: "subString_start入参测试"
    )
    return 0
}