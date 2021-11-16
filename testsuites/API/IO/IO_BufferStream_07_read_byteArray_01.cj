// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    var readnum1 = BufferStream(StringStream("0123456789")).read(Array<UInt8>(10, {i => 1}))
    var readnum2 = BufferStream(StringStream("012345678")).read(Array<UInt8>(10, {i => 1}))
    var readnum3 = BufferStream(StringStream("01234567890")).read(Array<UInt8>(10, {i => 1}))
    var readnum4 = BufferStream(StringStream("0")).read(Array<UInt8>(10, {i => 1}))
    var readnum5 = BufferStream(StringStream("")).read(Array<UInt8>(10, {i => 1}))
    CaseRunner<Int64>().runCases(
        [
            (readnum1, 10),
            (readnum2, 9),
            (readnum3, 10),
            (readnum4, 1),
            (readnum5, -1)
        ],
        description: "StringStream转换的BufferStream的read入参测试"
    )
    return 0
}