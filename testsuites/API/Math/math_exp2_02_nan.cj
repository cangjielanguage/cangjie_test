// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试入参是NaN
//函数功能，自然底数e的x次幂
func main() {
  CaseRunner<Bool>().runCasesTrue(
      [
             //x为Float16:NaN，返回Float16:NaN
            isNaN(exp2(nan16)),
            isNaN(exp2(nan32)),
            isNaN(exp2(nan64))
      ],
    description: "test case 1"
  )
  return 0
}