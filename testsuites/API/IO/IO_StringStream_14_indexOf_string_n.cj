// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<Int64>().runCases(
        [
            (foo(StringStream("0123456789").indexOf("89")),8),
            (foo(StringStream("012345678901234567890123456789").indexOf("56789")),5),
            (foo(StringStream("012345678901234567890123456789").indexOf("a56789")),-1),
            (foo(StringStream("012345678901234567890123456789").indexOf("")),0),
            (foo(StringStream("").indexOf("")),0),
            (foo(StringStream("123456你好吗aB你好").indexOf("你好")),6),
            (foo(StringStream("123456你好吗\naB\naB").indexOf("\naB")),9)
        ],
        description: "indexOf的入参测试"
    )
    return 0
}