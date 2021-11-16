// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试trunc(x:Float16)：Float16
//函数功能：给x做截断
//测试入参x是Inf
func main() {
  CaseRunner<Bool>().runCasesTrue(
      [
             //x为Float16:NaN，返回Float16:NaN
            isNaN(gamma(nan16)),
            isNaN(gamma(nan32)),
            isNaN(gamma(nan64))
      ],
    description: "test case 1"
  )
  return 0
}