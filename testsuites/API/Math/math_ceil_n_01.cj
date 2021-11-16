// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//函数功能：x取下整，即不小于x的第一个整数
//测试入参x范围是（-∞，+∞）
func main() {
  CaseRunner<Float16>().runCases(
    [
        (ceil(Float16(-4.9665)),Float16(-4),Float16(0.0001)),
        (ceil(Float16(-10.25)),Float16(-10),Float16(0.0001)),
        (ceil(Float16(10.25)),Float16(11),Float16(0.0001)),
        (ceil(Float16(4.9665)),Float16(5),Float16(0.0001)),
        (ceil(Float16(10)),Float16(10),Float16(0.0001)),
        (ceil(Float16(-5)),Float16(-5),Float16(0.0001)),
        (ceil(Float16(-0)), Float16(0),Float16(0.0001)),
        (ceil(Float16(0)), Float16(0),Float16(0.0001))
    ],
    description: "ceil()函数入参是Float16，返回值结果正确"
  )
  CaseRunner<Float32>().runCases(
    [
        (ceil(Float32(-4.9665)),Float32(-4),Float32(0.0001)),
        (ceil(Float32(-10.25)),Float32(-10),Float32(0.0001)),
        (ceil(Float32(10.25)),Float32(11),Float32(0.0001)),
        (ceil(Float32(4.9665)), Float32(5),Float32(0.0001)),
        (ceil(Float32(10)), Float32(10),Float32(0.0001)),
        (ceil(Float32(-5)), Float32(-5),Float32(0.0001)),
        (ceil(Float32(-0)), Float32(0),Float32(0.0001)),
        (ceil(Float32(0)), Float32(0),Float32(0.0001))
    ],
    description: "ceil()函数入参是Float32，返回值结果正确"
  )
  CaseRunner<Float64>().runCases(
    [
        (ceil(Float64(-4.9665)),Float64(-4),Float64(0.0001)),//x为负数，靠近下整
        (ceil(Float64(-10.25)),Float64(-10),Float64(0.0001)), //x为负数，靠近上整
        (ceil(Float64(10.25)),Float64(11),Float64(0.0001)),//x为正数，靠近上整
        (ceil(Float64(4.9665)),Float64(5),Float64(0.0001)),//x为正数，靠近下整
        (ceil(Float64(10)),Float64(10),Float64(0.0001)),//x为正整数
        (ceil(Float64(-5)),Float64(-5),Float64(0.0001)),//x为负整数
        (ceil(Float64(-0)),Float64(0),Float64(0.0001)), //特殊值0，预期结果正确
        (ceil(Float64(0)),Float64(0),Float64(0.0001))
    ],
    description: "ceil()函数入参是Float64，返回值结果正确"
  )
  CaseRunner<Bool>().runCasesTrue(
    [
        isNaN(ceil(Float16(nan16))),
        isNaN(ceil(Float16(-nan16))),
        isNaN(ceil(Float16(nan32))),
        isNaN(ceil(Float16(-nan32))),
        isNaN(ceil(Float32(nan64))),
        isNaN(ceil(Float64(-nan64)))
    ],
    description: "ceil()函数入参是nan,返回值是nan"
  )
  CaseRunner<Bool>().runCasesTrue(
    [
        isInf(ceil(inf16)),
        isInf(ceil(-inf16)),
        isInf(ceil(inf32)),
        isInf(ceil(-inf32)),
        isInf(ceil(inf64)),
        isInf(ceil(-inf64))
    ],
    description: "ceil()函数入参是inf,返回值是inf"
  )
  return 0
}