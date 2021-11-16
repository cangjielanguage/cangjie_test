// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试reverse(x:UInt16)：UInt16
//函数功能：求x的反双曲正切
//测试入参x范围是（-1，1）
func main() {
   //重载reverse(x:UInt18)：UInt8
  CaseRunner<UInt8>().runCases(
      [
            (reverse(UInt8(80)), UInt8(10))
      ],
    description: "test case 1" /**用例描述**/
  )
   //重载reverse(x:UInt16)：UInt16
  CaseRunner<UInt16>().runCases(
      [
            (reverse(UInt16(80)), UInt16(2560))
      ],
    description: "test case 1" /**用例描述**/
  )
  //重载reverse(x:UInt32)：UInt32
  CaseRunner<UInt32>().runCases(
      [
            (reverse(UInt32(80)), UInt32(167772160))
      ],
    description: "test case 2" /**用例描述**/
  )
  //重载reverse(x:UInt64)：UInt64
  CaseRunner<UInt64>().runCases(
      [
            (reverse(UInt64(80)), UInt64(720575940379279360))
      ],
    description: "test case 3" /**用例描述**/
  )
  return 0
}