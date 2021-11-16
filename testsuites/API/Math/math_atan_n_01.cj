// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试入参x范围是（-∞，+∞）
func main() {
  CaseRunner<Float16>().runCases(
    [
        (atan(Float16(-1)), Float16(-0.785156),Float16(0.0001)),//x为负数
        (atan(Float16(1)), Float16(0.785156),Float16(0.0001)),  //x为正数
        (atan(Float16(inf16)), Float16(1.5707),Float16(0.0001)),  //x为inf
        (atan(Float16(-inf16)), Float16(-1.5707),Float16(0.0001))//x为-inf
    ],
    description: "atan()入参是Float16,且在定义域范围内，返回正常值"
  )
  CaseRunner<Float32>().runCases(
    [
        (atan(Float32(-1)), Float32(-0.785398),Float32(0.0001)),//x为负数
        (atan(Float32(1)), Float32(0.785398),Float32(0.0001)), //x为正数
        (atan(Float32(inf32)), Float32(1.5707),Float32(0.0001)),  //x为inf
        (atan(Float32(-inf32)), Float32(-1.5707),Float32(0.0001))//x为-inf       
    ],
    description: "atan()入参是Float32,且在定义域范围内，返回正常值"
  )
  CaseRunner<Float64>().runCases(
    [
        (atan(Float64(-1)), Float64(-0.785398),Float64(0.0001)),//x为负数
        (atan(Float64(1)), Float64(0.785398),Float64(0.0001)),//x为正数
        (atan(Float64(inf64)), Float64(1.5707),Float64(0.0001)),  //x为inf
        (atan(Float64(-inf64)), Float64(-1.5707),Float64(0.0001))//x为-inf       
    ],
    description: "atan()入参是Float64,且在定义域范围内，返回正常值"
  )
  CaseRunner<Bool>().runCasesTrue(
      [
         isNaN(atan(nan16)),
         isNaN(atan(-nan16)),
         isNaN(atan(nan32)),
         isNaN(atan(-nan32)),
         isNaN(atan(nan64)),
         isNaN(atan(-nan64))
      ],
    description: "atan()入参是nan,返回nan"
  )

  return 0
}