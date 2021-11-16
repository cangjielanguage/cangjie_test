// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    var s1 = StringStream("0123456789")
    s1.setCharAt(0, 'a')
    var s2 = StringStream("0123456789")
    s2.setCharAt(9, '\n')
    var s3 = StringStream("0123456789")
    s3.setCharAt(5, '你')
    CaseRunner<String>().runCases(
        [
            (s1.subString(0),"a123456789"),
            (s2.subString(0),"012345678\n"),
            (s3.subString(0),"01234你6789")
        ],
        description: "setCharAt入参测试"
    )
    return 0
}