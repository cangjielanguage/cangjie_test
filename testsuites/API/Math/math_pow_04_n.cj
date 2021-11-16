// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
//测试func pow(base: Float64, exponent: Float64) : Float64
//入参正常：x
func main() {
    CaseRunner<Bool>().runCasesTrue(
      [
         //x是特殊值：返回inf，结果为true
         isInf(pow(Float64(-0),Float64(-2))),
         isInf(pow(Float64(0),Float64(-2)))
      ],
     description: "test case 2" /**用例描述**/
    )

  return 0
}
