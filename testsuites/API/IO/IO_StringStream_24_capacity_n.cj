// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<Int64>().runCases(
        [
            (StringStream("").capacity(), 16),
            (StringStream("1").capacity(), 17),
            (StringStream("1\nAb;你好").capacity(), 23)
        ],
        description: "capacity()调用测试"
    )
    return 0
}