// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试floor(x)
//函数功能：x取下整，即不大于x的第一个整数
//测试入参x范围是（-∞，+∞）
//入参x是NaN
func main() {
  CaseRunner<Bool>().runCasesTrue(
      [
             //x为Float16:NaN，返回Float16:NaN
            isNaN(floor(nan16)),
            isNaN(floor(nan32)),
            isNaN(floor(nan64))
      ],
    description: "test case 1"
  )
  return 0
}
