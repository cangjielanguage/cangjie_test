// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    var readnum1 = BufferStream(StringStream("0123456789")).read(Array<UInt8>(10, {i => 1}),0,0)
    var readnum2 = BufferStream(StringStream("0123456789")).read(Array<UInt8>(10, {i => 1}),0,10)
    var readnum3 = BufferStream(StringStream("0123456789")).read(Array<UInt8>(10, {i => 1}),2,3)
    var readnum4 = BufferStream(StringStream("0")).read(Array<UInt8>(10, {i => 1}),0,10)
    var readnum5 = BufferStream(StringStream("")).read(Array<UInt8>(10, {i => 1}),0,5)
    CaseRunner<Int64>().runCases(
        [
            (readnum1, 0),
            (readnum2, 10),
            (readnum3, 3),
            (readnum4, 1),
            (readnum5, -1)
        ],
        description: "StringStream转换的BufferStream的read入参测试"
    )
    return 0
}