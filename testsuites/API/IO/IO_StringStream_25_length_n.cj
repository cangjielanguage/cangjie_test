// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<Int64>().runCases(
        [
            (StringStream("").length(), 0),
            (StringStream("1").length(), 1),
            (StringStream("1\nAb;你好").length(), 7)
        ],
        description: "length调用测试"
    )
    return 0
}