// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            StringStream("123\n").canWrite(),
            StringStream("123你好Ab").canWrite(),
            StringStream("123").canWrite()
        ],
        description: "StringStream调用canWrite测试"
    )
    return 0
}