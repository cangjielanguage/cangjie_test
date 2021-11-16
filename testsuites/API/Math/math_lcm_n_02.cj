// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
func main() {
   CaseRunner<Int8>().runCases(
      [
        (lcm(Int8(0),Int8(5)),Int8(0)),
        (lcm(Int8(0),Int8(-25)),Int8(0))
      ],
    description: "test case 1"
    )
   CaseRunner<Int16>().runCases(
      [
        (lcm(Int16(0),Int16(256)),Int16(0)),
        (lcm(Int16(0),Int16(-256)),Int16(0))
      ],
    description: "test case 2" /**用例描述**/
    )
   CaseRunner<Int32>().runCases(
      [
        (lcm(Int32(0),Int32(512)),Int32(0)),
        (lcm(Int32(0),Int32(-512)),Int32(0))
      ],
    description: "test case 3"
    )
   CaseRunner<Int64>().runCases(
      [
        (lcm(Int64(0),Int64(1024000000)),Int64(0)),
        (lcm(Int64(0),Int64(-1024000000)),Int64(0))
      ],
    description: "test case 4"
    )
   return 0
}