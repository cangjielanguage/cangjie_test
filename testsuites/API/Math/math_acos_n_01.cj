// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试acos(x:Float16)：Float16
//函数功能：求x的反余弦值
//测试入参x范围是【-1，+1】
func main() {
  CaseRunner<Float16>().runCases(
    [
        (acos(Float16(-1)), Float16(3.140625),Float16(0.0001)),  //x为负数
        (acos(Float16(1)), Float16(0.000000),Float16(0.0001))    //x为正数
    ],
    description: "acos()入参是Float16,且在定义域范围内，返回正常值"
  )
  CaseRunner<Float32>().runCases(
    [
        (acos(Float32(-1)), Float32(3.141593),Float32(0.0001)),//x为负数
        (acos(Float32(1)), Float32(0.000000),Float32(0.0001)) //x为正数
    ],
    description: "acos()入参是Float32,且在定义域范围内，返回正常值"
  )
  CaseRunner<Float64>().runCases(
    [
        (acos(Float64(-1)), Float64(3.141593),Float64(0.0001)), //x为负数
        (acos(Float64(1)), Float64(0.000000),Float64(0.0001))   //x为正数
    ],
    description: "acos()入参是Float64,且在定义域范围内，返回正常值"
  )
  CaseRunner<Bool>().runCasesTrue(
    [
        isNaN(acos(nan16)),
        isNaN(acos(-nan16)),
        isNaN(acos(nan32)),
        isNaN(acos(-nan32)),
        isNaN(acos(nan64)),
        isNaN(acos(-nan64))
    ],
    description: "acos()入参是nan,返回为nan"
  )
  return 0
}