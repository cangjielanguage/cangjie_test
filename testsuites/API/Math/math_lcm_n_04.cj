// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
//lcm（）函数针对UInt的测试
//lcm存在返回值大于返回值类型的范围
func main() {
   //重载func lcm(x: UInt8, y: UInt8)：UInt8
   CaseRunner<UInt8>().runCases(
      [
             //0和任何数的最小公倍数都是0
             (lcm(UInt8(0),UInt8(5)),UInt8(0))
      ],
    description: "test case 1" /**用例描述**/
   )
   CaseRunner<UInt16>().runCases(
      [
            //0和任何数的最小公倍数都是0
             (lcm(UInt16(0),UInt16(256)),UInt16(0))
      ],
    description: "test case 2" /**用例描述**/
   )
   CaseRunner<UInt32>().runCases(
      [
             //0和任何数的最小公倍数都是0
             (lcm(UInt32(0),UInt32(512)),UInt32(0))
      ],
    description: "test case 3" /**用例描述**/
   )
   CaseRunner<UInt64>().runCases(
      [
             //0和任何数的最小公倍数都是0
             (lcm(UInt64(0),UInt64(1024000000)),UInt64(0))
      ],
    description: "test case 4" /**用例描述**/
   )
   return 0
}