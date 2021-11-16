// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            StringStream("123").canSeek(),
            StringStream("123年后Ab").canSeek(),
            StringStream("123\n").canSeek()
        ],
        description: "StringStream调用canSeek测试"
    )
    return 0
}