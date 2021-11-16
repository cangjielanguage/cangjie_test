// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    var writenum1 = BufferStream(StringStream("0123456789")).write(Array<UInt8>(10, {i => 1}))
    var writenum2 = BufferStream(StringStream("")).write(Array<UInt8>(10, {i => 1}))
    CaseRunner<Int64>().runCases(
        [
            (writenum1, 10),
            (writenum2, 10)
        ],
        description: "StringStream转换的BufferStream的write入参测试"
    )
    return 0
    }