// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试floor(x:Float16)：Float16
//函数功能：x取下整，即不大于x的第一个整数
//测试入参x范围是（-∞，+∞）
func main() {
   //重载floor(x:Float16)：Float16
  CaseRunner<Float16>().runCases(
      [
             //x为负数，靠近下整
            (floor(Float16(-4.9665)), Float16(-5),Float16(0.0001)),
             //x为负数，靠近上整
            (floor(Float16(-10.25)), Float16(-11),Float16(0.0001)),
            //x为正数，靠近上整
            (floor(Float16(10.25)), Float16(10),Float16(0.0001)),
            //x为正数，靠近下整
            (floor(Float16(4.9665)), Float16(4),Float16(0.0001)),
            //x为正整数
            (floor(Float16(5)), Float16(5),Float16(0.0001)),
            //x为负整数
            (floor(Float16(-5)), Float16(-5),Float16(0.0001)),
            //特殊值0，预期结果正确
            (floor(Float16(-0)), Float16(0),Float16(0.0001)),
            (floor(Float16(0)), Float16(0),Float16(0.0001))
      ],
    description: "test case 1" /**用例描述**/
  )
  //重载floor(x:Float32)：Float32
  CaseRunner<Float32>().runCases(
      [
             //x为负数，靠近下整
            (floor(Float32(-4.9665)), Float32(-5),Float32(0.0001)),
             //x为负数，靠近上整
            (floor(Float32(-10.25)), Float32(-11),Float32(0.0001)),
            //x为正数，靠近上整
            (floor(Float32(10.25)), Float32(10),Float32(0.0001)),
            //x为正数，靠近下整
            (floor(Float32(4.9665)), Float32(4),Float32(0.0001)),
            //x为正整数
            (floor(Float32(5)), Float32(5),Float32(0.0001)),
            //x为负整数
            (floor(Float32(-5)), Float32(-5),Float32(0.0001)),
            //特殊值0，预期结果正确
            (floor(Float32(-0)), Float32(0),Float32(0.0001)),
            (floor(Float32(0)), Float32(0),Float32(0.0001))
      ],
    description: "test case 2" /**用例描述**/
  )
  //重载floor(x:Float64)：Float64
  CaseRunner<Float64>().runCases(
      [
             //x为负数，靠近下整
            (floor(Float64(-4.9665)), Float64(-5),Float64(0.0001)),
             //x为负数，靠近上整
            (floor(Float64(-10.25)), Float64(-11),Float64(0.0001)),
            //x为正数，靠近上整
            (floor(Float64(10.25)), Float64(10),Float64(0.0001)),
            //x为正数，靠近下整
            (floor(Float64(4.9665)), Float64(4),Float64(0.0001)),
            //x为正整数
            (floor(Float64(5)), Float64(5),Float64(0.0001)),
            //x为负整数
            (floor(Float64(-5)), Float64(-5),Float64(0.0001)),
            //特殊值0，预期结果正确
            (floor(Float64(-0)), Float64(0),Float64(0.0001)),
            (floor(Float64(0)), Float64(0),Float64(0.0001))
      ],
    description: "test case 3" /**用例描述**/
  )
  return 0
}