// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
// ASSERT: scan-not IllegalArgumentException
from std import math.*
//测试入参x范围是（-1，1）
func main() {
/**  CaseRunner<Float16>().runCases(
    [
        (atanh(Float16(-0.5)), Float16(-0.549316),Float16(0.0001)),//x为负数
        (atanh(Float16(0.5)), Float16(0.549316),Float16(0.0001))//x为正数
    ],
    description: "atanh()入参是Float16,且在定义域范围内，返回正常值"
  )
  CaseRunner<Float32>().runCases(
    [
        (atanh(Float32(-0.5)), Float32(-0.549306),Float32(0.0001)), //x是负数
        (atanh(Float32(0.5)), Float32(0.549306),Float32(0.0001))//x为正数
    ],
    description: "atanh()入参是Float32,且在定义域范围内，返回正常值"
  )
  CaseRunner<Float64>().runCases(
    [
        (atanh(Float64(-0.5)), Float64(-0.549306),Float64(0.0001)),//x为负数
        (atanh(Float64(0.5)), Float64(0.549306),Float64(0.0001))//x为正数
    ],
    description: "atanh()入参是Float64,且在定义域范围内，返回正常值"
  )
  CaseRunner<Bool>().runCasesTrue(
      [
         isNaN(atanh(nan16)),
         isNaN(atanh(-nan16)),
         isNaN(atanh(nan32)),
         isNaN(atanh(-nan32)),
         isNaN(atanh(nan64)),
         isNaN(atanh(-nan64))
      ],
    description: "atanh()入参是nan，返回nan"
  )*/
  print("${atanh(Float16(-0.5))}\n")
  return 0
}
