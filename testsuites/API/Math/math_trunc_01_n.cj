// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试trunc(x:Float16)：Float16
//函数功能：给x做截断
//测试入参x范围是（-∞，+∞）
func main() {
   //重载trunc(x:Float16)：Float16
  CaseRunner<Float16>().runCases(
      [
             //x为负数，靠近下整
            (trunc(Float16(-4.9665)), Float16(-4),Float16(0.000)),
             //x为负数，靠近上整
            (trunc(Float16(-10.25)), Float16(-10),Float16(0.000)),
            //x为正数，靠近上整
            (trunc(Float16(10.25)), Float16(10),Float16(0.000)),
            //x为正数，靠近下整
            (trunc(Float16(4.9665)), Float16(4),Float16(0.000)),
            //特殊值0，预期结果正确
            (trunc(Float16(-0)), Float16(0),Float16(0.000)),
            (trunc(Float16(0)), Float16(0),Float16(0.000))
      ],
    description: "test case 1"
  )
  //重载trunc(x:Float32)：Float32
 CaseRunner<Float32>().runCases(
      [
             //x为负数，靠近下整
            (trunc(Float32(-4.9665)),Float32(-4),Float32(0.000)),
             //x为负数，靠近上整
            (trunc(Float32(-10.25)), Float32(-10),Float32(0.000)),
            //x为正数，靠近上整
            (trunc(Float32(10.25)), Float32(10),Float32(0.000)),
            //x为正数，靠近下整
            (trunc(Float32(4.9665)), Float32(4),Float32(0.000)),
            //特殊值0，预期结果正确
            (trunc(Float32(-0)), Float32(0),Float32(0.000)),
            (trunc(Float32(0)), Float32(0),Float32(0.000))
      ],
    description: "test case 2"
  )
  //重载trunc(x:Float64)：Float64
   CaseRunner<Float64>().runCases(
      [
             //x为负数，靠近下整
            (trunc(Float64(-4.9665)), Float64(-4),Float64(0.000)),
             //x为负数，靠近上整
            (trunc(Float64(-10.25)), Float64(-10),Float64(0.000)),
            //x为正数，靠近上整
            (trunc(Float64(10.25)), Float64(10),Float64(0.000)),
            //x为正数，靠近下整
            (trunc(Float64(4.9665)), Float64(4),Float64(0.000)),
            //x为正整数
            (trunc(Float64(5)), Float64(5),Float64(0.000)),
            //x为负整数
            (trunc(Float64(-5)), Float64(-5),Float64(0.000)),
            //特殊值0，预期结果正确
            (trunc(Float64(-0)), Float64(0),Float64(0.000)),
            (trunc(Float64(0)), Float64(0),Float64(0.000))
      ],
    description: "test case 3"
  )
  return 0
}
