// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试tan(x:Float16)：Float16
//函数功能：求x的tan
//测试入参x范围是（-∞，+∞）
func main() {
   //重载tan(x:Float16)：Float16
 CaseRunner<Float16>().runCases(
      [
             //x为负数
            (tan(Float16(-1.57)),Float16(-2065.721449),Float16(0.001)),
             //x为正数
            (tan(Float16(1.57)),Float16(2065.721449),Float16(0.001))
      ],
    description: "test case 1"
  )
  //重载tan(x:Float32)：Float32
  CaseRunner<Float32>().runCases(
      [
             //x为负数
            (tan(Float32(-1.57)),Float32(-1255.848267),Float32(0.0001)),
             //x为正数
            (tan(Float32(1.57)),Float32(1255.848267),Float32(0.0001))

      ],
    description: "test case 2" /**用例描述**/
  )
  //重载tan(x:Float64)：Float64
  CaseRunner<Float64>().runCases(
      [
             //x为负数
            (tan(Float64(-1.57)),Float64(-1255.765592),Float64(0.0001)),
             //x为正数
            (tan(Float64(1.57)),Float64(1255.765592),Float64(0.0001))
      ],
    description: "test case 3" /**用例描述**/
  )
  return 0
}