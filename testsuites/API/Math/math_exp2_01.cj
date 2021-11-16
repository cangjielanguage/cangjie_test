// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试入参是正数，负数和0
//函数功能，自然底数2的x次幂
func main() {
//重载exp2(Float16)：Float16
  CaseRunner<Float16>().runCases(
      [
             //x=0:特殊值
            (exp2(Float16(0.0)),Float16(1),Float16(0.0001)),
             //x=-0：特殊值
            (exp2(Float16(-0.0)),Float16(1),Float16(0.0001)),
             //x=1：正值
            (exp2(Float16(4.0)),Float16(16),Float16(0.0001)),
            //x=-1:赋值
            (exp2(Float16(-1.0)),Float16(0.5),Float16(0.0001))
      ],
    description: "test case 1" /**用例描述**/
  )
//重载exp2(Float32)：Float32
  CaseRunner<Float32>().runCases(
      [
            //x=0:特殊值
             (exp2(Float32(0)), Float32(1), Float32(0.0001)),
            //x=-0：特殊值
            (exp2(Float32(-0)), Float32(1), Float32(0.0001)),
            //x=1：正值；常量访问方式有可能有问题
            (exp2(Float32(4.0)), Float32(16), Float32(0.0001)),
            //x=-1:负值
            (exp2(Float32(-1)),Float32(0.5), Float32(0.0001))
      ],
    description: "test case 2" /**用例描述**/
  )
//重载exp2(Float64)：Float64
  CaseRunner<Float64>().runCases(
      [
            //x=0:特殊值
             (exp2(Float64(0)), Float64(1), Float64(0.0001)),
            //x=-0：特殊值
            (exp2(Float64(-0)), Float64(1), Float64(0.0001)),
            //x=1：正值；常量访问方式有可能有问题
            (exp2(Float64(4.0)), Float64(16), Float64(0.0001)),
            //x=-1:负值
            (exp2(Float64(-1)),Float64(0.5), Float64(0.0001))
      ],
    description: "test case 3" /**用例描述**/
  )
  return 0
}