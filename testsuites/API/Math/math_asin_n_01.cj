// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试入参x范围是[-1，+1]
func main() {
  CaseRunner<Float16>().runCases(
    [
        (asin(Float16(-1)), Float16(-1.570312),Float16(0.0001)),//x为负数
        (asin(Float16(1)), Float16(1.570312),Float16(0.0001))   //x为正数
    ],
    description: "asin()入参是Float16,且在定义域范围内，返回正常值"
  )
  CaseRunner<Float32>().runCases(
    [
        (asin(Float32(-1)), Float32(-1.570796),Float32(0.0001)),//x为负数
        (asin(Float32(1)), Float32(1.570796),Float32(0.0001))//x为正数
    ],
    description: "asin()入参是Float32,且在定义域范围内，返回正常值"
  )
  CaseRunner<Float64>().runCases(
    [
        (asin(Float64(-1)), Float64(-1.570796),Float64(0.0001)),//x为负数
        (asin(Float64(1)), Float64(1.570796),Float64(0.0001))//x为正数
    ],
    description: "asin()入参是Float64,且在定义域范围内，返回正常值"
  )
  CaseRunner<Bool>().runCasesTrue(
    [
        isNaN(asin(nan16)),
        isNaN(asin(-nan16)),
        isNaN(asin(nan32)),
        isNaN(asin(-nan32)),
        isNaN(asin(nan64)),
        isNaN(asin(-nan64))
    ],
    description: "asin()入参是nan,返回为nan"
  )
  return 0
}