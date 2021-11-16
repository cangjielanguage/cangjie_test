// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试入参x范围是（-∞，+∞）
func main() {
  CaseRunner<Float16>().runCases(
    [
        (asinh(Float16(-1)), Float16(-0.881348),Float16(0.0001)),//x为负数
        (asinh(Float16(1)), Float16(0.881348),Float16(0.0001))//x为正数
    ],
    description: "asinh()入参是Float16,且在定义域范围内，返回正常值"
  )
  CaseRunner<Float32>().runCases(
    [
        (asinh(Float32(-1)), Float32(-0.881374),Float32(0.0001)),//x为负数
        (asinh(Float32(1)), Float32(0.881374),Float32(0.0001))//x为正数
    ],
    description: "asinh()入参是Float32,且在定义域范围内，返回正常值"
  )
  CaseRunner<Float64>().runCases(
    [
        (asinh(Float64(-1)), Float64(-0.881374),Float64(0.0001)),//x为负数
        (asinh(Float64(1)), Float64(0.881374),Float64(0.0001))   //x为正数
    ],
    description: "asinh()入参是Float64,且在定义域范围内，返回正常值"
  )
  CaseRunner<Bool>().runCasesTrue(
    [
        isNaN(asinh(-nan16)),
        isNaN(asinh(nan16)),
        isNaN(asinh(-nan32)),
        isNaN(asinh(nan32)),
        isNaN(asinh(-nan64)),
        isNaN(asinh(nan64))
    ],
    description: "asinh()入参是nan,返回为nan"
  )
  CaseRunner<Bool>().runCasesTrue(
    [
        isInf(asinh(-inf16)),
        isInf(asinh(inf16)),
        isInf(asinh(-inf32)),
        isInf(asinh(inf32)),
        isInf(asinh(-inf64)),
        isInf(asinh(inf64))
    ],
    description: "asinh()入参是inf,返回为inf"
  )
  return 0
}