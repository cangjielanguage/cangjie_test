// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<Int64>().runCases(
        [
            (foo(StringStream("0123456789").lastIndexOf('9')),9),
            (foo(StringStream("0123456789").lastIndexOf('\0')),-1),
            (foo(StringStream("012345678901234567890123456789").lastIndexOf('0')),20),
            (foo(StringStream("").lastIndexOf('\0')),-1),
            (foo(StringStream("123456你好吗你").lastIndexOf('你')),9),
            (foo(StringStream("123456a你好吗aB").lastIndexOf('a')),10),
            (foo(StringStream("123456B你好吗aB").lastIndexOf('B')),11),
            (foo(StringStream("12345\n6你好吗a\nB").lastIndexOf('\n')),11)
        ],
        description: "deleteChaAt的入参测试"
    )
    return 0
}