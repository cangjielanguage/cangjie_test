// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            BufferStream(FileStream("BS_buzunzai",AccessMode.ReadOnly)).canRead(),
            BufferStream(StringStream("buzunzai")).canRead(),
            BufferStream(FileStream("BS_buzunzai",AccessMode.ReadWrite)).canRead()
        ],
        description: "BufferStream可读"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            BufferStream(FileStream("BS_123",AccessMode.WriteOnly)).canRead()
        ],
        description: "BufferStream不可读",
        checktype: "AssertFalse"
    )
    return 0
}