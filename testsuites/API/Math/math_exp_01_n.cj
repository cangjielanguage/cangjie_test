// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试入参是正数，负数和0
//函数功能，自然底数e的x次幂
func main() {
//重载exp(Float16)：Float16
  CaseRunner<Float16>().runCases(
      [
             //x=0:特殊值
            (exp(Float16(0.0)), Float16(1),Float16(0.0001)),
             //x=-0：特殊值
            (exp(Float16(-0.0)), Float16(1),Float16(0.0001)),
             //x=1：正值；常量访问方式有可能有问题
            (exp(Float16(1)), E16,Float16(0.0001)),
            //x=-1:负值
            (exp(Float16(-1)),Float16(0.367879),Float16(0.0001))
      ],
    description: "test case 1" /**用例描述**/
  )
//重载exp(Float32)：Float32
  CaseRunner<Float32>().runCases(
      [
            //x=0:特殊值
             (exp(Float32(0)), Float32(1),Float32(0.0001)),
            //x=-0：特殊值
            (exp(Float32(-0)), Float32(1),Float32(0.0001)),
            //x=1：正值；常量访问方式有可能有问题
            (exp(Float32(1)), E32,Float32(0.0001)),
            //x=-1:负值
            (exp(Float32(-1)),Float32(0.367879),Float32(0.0001))
      ],
    description: "test case 2" /**用例描述**/
  )
//重载exp(Float64)：Float64
  CaseRunner<Float64>().runCases(
      [
            //x=0:特殊值
             (exp(Float64(0)), Float64(1),Float64(0.0001)),
            //x=-0：特殊值
            (exp(Float64(-0)), Float64(1),Float64(0.0001)),
            //x=1：正值；常量访问方式有可能有问题
            (exp(Float64(1)), E64,Float64(0.0001)),
            //x=-1:负值
            (exp(Float64(-1)), Float64(0.367879),Float64(0.0001))
      ],
    description: "test case 3" /**用例描述**/
  )
  return 0
}