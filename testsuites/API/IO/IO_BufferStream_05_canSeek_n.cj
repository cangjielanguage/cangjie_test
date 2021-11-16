// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            BufferStream(FileStream("BS_buzunzai",AccessMode.WriteOnly,OpenMode.Append)).canSeek()
        ],
        description: "BufferStream不能Seek",
        checktype: "AssertFalse"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            BufferStream(StringStream("buzunzai")).canSeek(),
            BufferStream(FileStream("./BS_123")).canSeek()
        ],
        description: "BufferStream能Seek"
    )

return 0
}