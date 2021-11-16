// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            BufferStream(FileStream("BS_buzunzai")).canTimeout(),
            BufferStream(StringStream("buzunzai")).canTimeout()
        ],
        description: "BufferStream不可超时",
        checktype: "AssertFalse"
    )
    return 0
}