// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<Int64>().runCases(
        [
            (StringStream("0123456789").read(Array<UInt8>(10, {i => 1})), 10),
            (StringStream("你好2345678").read(Array<UInt8>(10, {i => 1})), 9),
            (StringStream("\\\n234567890").read(Array<UInt8>(10, {i => 1})), 10),
            (StringStream("0").read(Array<UInt8>(10, {i => 1})), 1),
            (StringStream("0").read(Array<UInt8>()),0)
        ],
        description: "read入参测试"
    )
    return 0
}