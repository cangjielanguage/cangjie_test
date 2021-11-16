// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试erf(x:Float16)：Float16
//函数功能：误差函数
//测试入参x是nan
func main() {
  CaseRunner<Bool>().runCasesTrue(
      [
             //x为Float16:NaN，返回Float16:NaN
            isNaN(erf(nan16)),
            isNaN(erf(nan32)),
            isNaN(erf(nan64))
      ],
    description: "test case 1"
  )
  return 0
}
