// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*
func main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            StringStream("123你好").canRead(),
            StringStream("123").canRead(),
            StringStream("123\n").canRead()
        ],
        description: "StringStream调用canRead()测试"
    )
    return 0
}