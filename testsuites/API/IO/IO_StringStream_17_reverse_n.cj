// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<String>().runCases(
        [
            (StringStream("").reverse().subString(0),""),
            (StringStream("0").reverse().subString(0),"0"),
            (StringStream("0123456789").reverse().subString(0),"9876543210"),
            (StringStream("你好无聊6789").reverse().subString(0),"9876聊无好你"),
            (StringStream("你好\n无聊6789").reverse().subString(0),"9876聊无\n好你")
        ],
        description: "reverse入参测试"
    )
    return 0
}