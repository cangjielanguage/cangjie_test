// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<Int64>().runCases(
        [
            (StringStream("11").write(Array<UInt8>(10, {i => 1}),0,1),1),
            (StringStream("44").write(Array<UInt8>(10, {i => 1}),9,1),1),
            (StringStream("B").write(Array<UInt8>(10, {i => 1}),0,10),10),
            (StringStream("1").write(Array<UInt8>(10, {i => 1}),1,5),5),
            (StringStream("a").write(Array<UInt8>(),0,0),0),
            (StringStream("你").write(Array<UInt8>(10, {i => 1}),1,-1),-1),
            (StringStream("\n").write(Array<UInt8>(10, {i => 1}),1,0),0),
            (StringStream("1212").write(Array<UInt8>(10, {i => 1}),-1,2),-1),
            (StringStream("456").write(Array<UInt8>(10, {i => 1}),10,0),0)
        ],
        description: "write_byteArray_offset_length入参测试"
    )
    return 0
}
