// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试tan(x:Float16)：Float16
//函数功能：tan函数
//测试入参x是NaN
func main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            isNaN(tan(inf16)),
            isNaN(tan(-inf16)),
            isNaN(tan(inf32)),
            isNaN(tan(-inf32)),
            isNaN(tan(inf64)),
            isNaN(tan(-inf64))
        ],
      description: "test case 01"
    )
  return 0
}

