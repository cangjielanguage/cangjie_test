// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
//测试func log（x: float16): float16
//函数功能：求自然底数e的对数
//x的取值为（0，+∞）
//e约等于2.7182818284
//入参正常：x
func main() {
   CaseRunner<Float16>().runCases(
      [
        //x是正小数
        (log(Float16(2.7182818284)), Float16(1), Float16(0.001)),
        //x是正整数
        (log(Float16(1)), Float16(0), Float16(0.001))
     ],
     description: "test case 1" /**用例描述**/
    )
   CaseRunner<Float32>().runCases(
      [
        //x是正小数
        (log(Float32(2.7182818284)), Float32(1), Float32(0.001)),
        //x是正整数
        (log(Float32(1)), Float32(0), Float32(0.001))
     ],
     description: "test case 2" /**用例描述**/
    )
   CaseRunner<Float64>().runCases(
      [
        //x是正小数
        //x是正整数
        (log(Float64(1)), Float64(0), Float64(0.001))
     ],
     description: "test case 1" /**用例描述**/
    )

  return 0
}