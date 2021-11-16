// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试cosh(x:Float16)：Float16
//函数功能：cosh函数
//测试入参x是NaN
func main() {
  CaseRunner<Bool>().runCasesTrue(
      [
             //x为Float16:NaN，返回Float16:NaN
            isNaN(cosh(nan16)),
            isNaN(cosh(nan32)),
            isNaN(cosh(nan64))
      ],
    description: "test case 1"
  )
  return 0
}