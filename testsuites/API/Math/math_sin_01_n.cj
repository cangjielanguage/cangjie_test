// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试sin(x:Float16)：Float16
//函数功能：求x的sin
//测试入参x范围是（-∞，+∞）
func main() {
   //重载sin(x:Float16)：Float16
  CaseRunner<Float16>().runCases(
      [
             //x为负数
            (sin(Float16(-1.57)), Float16(-1),Float16(0.001)),
             //x为正数
            (sin(Float16(1.57)), Float16(1),Float16(0.001))
      ],
    description: "test case 1" /**用例描述**/
  )
  //重载sin(x:Float32)：Float32
  CaseRunner<Float32>().runCases(
      [
             //x为负数
            (sin(Float32(-1.57)), Float32(-1),Float32(0.001)),
             //x为正数
            (sin(Float32(1.57)), Float32(1),Float32(0.001))

      ],
    description: "test case 2" /**用例描述**/
  )
  //重载sin(x:Float64)：Float64
  CaseRunner<Float64>().runCases(
      [
             //x为负数
            (sin(Float64(-1.57)), Float64(-1),Float64(0.001)),
             //x为正数
            (sin(Float64(1.57)), Float64(1),Float64(0.001))
      ],
    description: "test case 3" /**用例描述**/
  )
  return 0
}