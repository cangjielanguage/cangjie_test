// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试入参x范围是[1，+∞）
func main() {
 CaseRunner<Float16>().runCases(
    [
        (acosh(Float16(1)),Float16(0.000000),Float16(0.001)),  //x为边界值
        (acosh(Float16(1.1)),Float16(0.443604),Float16(0.001)) //x为正数
    ],
    description: "acosh()函数入参是Float16,且在定义域范围之内，返回值是其函数值"
  )
 CaseRunner<Float32>().runCases(
    [
        (acosh(Float32(1)), Float32(0.000000),Float32(0.0001)),  //x为边界值
        (acosh(Float32(1.1)), Float32(0.443568),Float32(0.0001)) //x为正数
    ],
    description: "acosh()函数入参是Float32,且在定义域范围之内，返回值是其函数值" /**用例描述**/
  )
 CaseRunner<Float64>().runCases(
    [
        (acosh(Float64(1)), Float64(0.000000),Float64(0.0001)),//x为正数
        (acosh(Float64(1.1)), Float64(0.443568),Float64(0.0001))
    ],
    description: "acosh()函数入参是Float64,且在定义域范围之内，返回值是其函数值"
 )
 CaseRunner<Bool>().runCasesTrue(
    [
        isNaN(acosh(nan16)),
        isNaN(acosh(-nan16)),
        isNaN(acosh(nan32)),
        isNaN(acosh(-nan32)),
        isNaN(acosh(nan64)),
        isNaN(acosh(-nan64))
    ],
    description: "acosh()函数入参是nan,返回值是nan"
  )
 CaseRunner<Bool>().runCasesTrue(
    [
        isInf(acosh(inf16)),
        isInf(acosh(inf32)),
        isInf(acosh(inf64))
    ],
    description: "acosh()函数入参是inf,返回值是inf"
  )
  return 0
}