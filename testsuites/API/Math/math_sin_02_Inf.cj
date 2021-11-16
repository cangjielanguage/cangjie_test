// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试sin(x:Float16)：Float16
//函数功能：sin函数
//测试入参x是NaN
func main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            isNaN(sin(inf16)),
            isNaN(sin(-inf16)),
            isNaN(sin(inf32)),
            isNaN(sin(-inf32)),
            isNaN(sin(inf64)),
            isNaN(sin(-inf64))
        ],
      description: "test case 01"
    )
  return 0
}
