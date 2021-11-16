// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试入参是非负数
func main() {
//重载sqrt(Float16)：Float16
  CaseRunner<Float16>().runCases(
      [
             //x为正整数，取得准确的立方根
            (sqrt(Float16(4.0)), Float16(2.0),Float16(0.0001)),
             //x为正小数，取得准确的立方根
            (sqrt(Float16(0.25)), Float16(0.5),Float16(0.0001)),
            //x=0:特殊值
            (sqrt(Float16(0)), Float16(0),Float16(0.0001)),
            //x=-0：特殊值
            (sqrt(Float16(-0)), Float16(0),Float16(0.0001))
      ],
    description: "test case 1" /**用例描述**/
  )
//重载sqrt(Float32)：Float32
  CaseRunner<Float32>().runCases(
      [
             //x为正整数，取得准确的立方根
            (sqrt(Float32(4.0)), Float32(2.0),Float32(0.0001)),
             //x为正小数，取得准确的立方根
            (sqrt(Float32(0.25)), Float32(0.5),Float32(0.0001)),
            //x=0:特殊值
             (sqrt(Float32(0)), Float32(0),Float32(0.0001)),
            //x=-0：特殊值
            (sqrt(Float32(-0)), Float32(0),Float32(0.0001))
      ],
    description: "test case 2" /**用例描述**/
  )
//重载sqrt(Float64)：Float64
  CaseRunner<Float64>().runCases(
      [
             //x为正整数，取得准确的立方根
            (sqrt(Float64(4.0)), Float64(2.0),Float64(0.0001)),
             //x为正小数，取得准确的立方根
            (sqrt(Float64(0.25)), Float64(0.5),Float64(0.0001)),
            //x=0:特殊值
             (sqrt(Float64(0)), Float64(0),Float64(0.0001)),
            //x=-0：特殊值
            (sqrt(Float64(-0)), Float64(0),Float64(0.0001))
      ],
    description: "test case 3" /**用例描述**/
  )
  return 0
}
