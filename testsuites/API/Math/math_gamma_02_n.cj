// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试gamma(x:Float16)：Float16
//函数功能：求x的伽马值
//测试入参x范围是（-∞，+∞）
func main() {
   //重载gamma(x:Float16)：Float16
  CaseRunner<Float16>().runCases(
      [
             //x为负数
            (gamma(Float16(-10.25)), Float16(-0.000001),Float16(0.0001)),
             //x为正数
            (gamma(Float16(10.25)), Float16(639232.598780),Float16(0.0001))
      ],
    description: "test case 1" /**用例描述**/
  )
  //重载gamma(x:Float32)：Float32
  CaseRunner<Float32>().runCases(
      [
             //x为负数
             //报错
            (gamma(Float32(-10.25)),Float32(-0.000001),Float32(0.0001)),
             //x为正数
            (gamma(Float32(10.25)),Float32(639232.5625000),Float32(0.0001))

      ],
    description: "test case 2" /**用例描述**/
  )
  //重载gamma(x:Float64)：Float64
  var x64:Float64=639232.598780
  CaseRunner<Float64>().runCases(
      [
             //x为负数
            (gamma(Float64(-10.25)), Float64(-0.000001),Float64(0.0001)),
            //x为正数
            (gamma(Float64(10.25)),x64,Float64(0.0001))
      ],
    description: "test case 3" /**用例描述**/
  )
  return 0
}