// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试sinh(x:Float16)：Float16
//函数功能：求x的双曲正弦
//测试入参x范围是（-∞，+∞）
func main() {
   //重载sinh(x:Float16)：Float16
  CaseRunner<Float16>().runCases(
      [
             //x为负数
            (sinh(Float16(-1)), Float16(-1.174805),Float16(0.0001)),
             //x为正数
            (sinh(Float16(1)), Float16(1.174805),Float16(0.0001))
      ],
    description: "test case 1" /**用例描述**/
  )
  //重载sinh(x:Float32)：Float32
  CaseRunner<Float32>().runCases(
      [
             //x为负数
            (sinh(Float32(-1)), Float32(-1.175201),Float32(0.0001)),
             //x为正数
            (sinh(Float32(1)), Float32(1.175201),Float32(0.0001))

      ],
    description: "test case 2" /**用例描述**/
  )
  //重载sinh(x:Float64)：Float64
  CaseRunner<Float64>().runCases(
      [
             //x为负数
            (sinh(Float64(-1)), Float64(-1.175201),Float64(0.0001)),
             //x为正数
            (sinh(Float64(1)), Float64(1.175201),Float64(0.0001))
      ],
    description: "test case 3" /**用例描述**/
  )
  return 0
}