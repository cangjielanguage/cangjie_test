// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<Int64>().runCases(
        [
            (foo(StringStream("0123456789").lastIndexOf("89")),8),
            (foo(StringStream("012345678901234567890123456789").lastIndexOf("56789")),25),
            (foo(StringStream("012345678901234567890123456789").lastIndexOf("a56789")),-1),
            (foo(StringStream("012345678901234567890123456789").lastIndexOf("")),29),
            (foo(StringStream("").lastIndexOf("")),0),
            (foo(StringStream("123456你好吗aB你好").lastIndexOf("你好")),11),
            (foo(StringStream("123456你好吗\naB\naB").lastIndexOf("\naB")),12)
        ],
        description: "lastIndexOf的入参测试"
    )
    return 0
}