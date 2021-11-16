// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试erf(x:Float16)：Float16
//函数功能：求x的伽马值
//测试入参x范围是（-∞，+∞）
func main() {
   //重载erf(x:Float16)：Float16
  CaseRunner<Float16>().runCases(
      [
             //x为负数
            (erf(Float16(-0.52452)), Float16(-0.541992),Float16(0.001)),
             //x为正数
            (erf(Float16(0.52452)), Float16(0.541992),Float16(0.001))
      ],
    description: "test case 1" /**用例描述**/
  )
  //重载erf(x:Float32)：Float32
  CaseRunner<Float32>().runCases(
      [
             //x为负数
            (erf(Float32(-0.52452)), Float32(-0.541781),Float32(0.0001)),
             //x为正数
            (erf(Float32(0.52452)), Float32(0.541781),Float32(0.0001))

      ],
    description: "test case 2" /**用例描述**/
  )
  //重载erf(x:Float64)：Float64
  CaseRunner<Float64>().runCases(
      [
             //x为负数
            (erf(Float64(-0.52452)), Float64(-0.541781),Float64(0.0001)),
             //x为正数
            (erf(Float64(0.52452)), Float64(0.541781),Float64(0.0001))
      ],
    description: "test case 3" /**用例描述**/
  )
  return 0
}