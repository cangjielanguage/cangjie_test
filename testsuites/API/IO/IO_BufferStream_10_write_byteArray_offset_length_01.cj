// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-io %link-format %link-log %link-collection %link-unicode"  %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    var writenum1 = BufferStream(StringStream("")).write(Array<UInt8>(10, {i => 1}),0,0)
    var writenum2 = BufferStream(StringStream("")).write(Array<UInt8>(10, {i => 1}),0,10)
    var writenum3 = BufferStream(StringStream("0123456789")).write(Array<UInt8>(10, {i => 1}),2,3)
    CaseRunner<Int64>().runCases(
        [
            (writenum1, 0),
            (writenum2, 10),
            (writenum3, 3)
        ],
        description: "StringStream转换的BufferStream的write入参测试"
    )
    return 0
}