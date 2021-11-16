// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<Int64>().runCases(
        [
            (StringStream("").read(Array<UInt8>(10, {i => 1}),0,0),0),
            (StringStream("12345").read(Array<UInt8>(10, {i => 1}),0,6), 5),
            (StringStream("0123456789").read(Array<UInt8>(10, {i => 1}),0,0), 0),
            (StringStream("0123456789").read(Array<UInt8>(10, {i => 1}),0,5), 5),
            (StringStream("01234567890").read(Array<UInt8>(10, {i => 1}),0,0), 0),
            (StringStream("0123456789").read(Array<UInt8>(10, {i => 1}),0,5), 5),
            (StringStream("0123456789").read(Array<UInt8>(),0,0), -1),
            (StringStream("01234567890").read(Array<UInt8>(10, {i => 1}),-1,5), -1),
            (StringStream("0123456789").read(Array<UInt8>(10, {i => 1}),1,-1), -1),
            (StringStream("0123456789").read(Array<UInt8>(10, {i => 1}),10,0), 0)
        ],
        description: "read_byteArray_offset_length入参测试"
    )
return 0
}