// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试sinh(x:Float16)：Float16
//函数功能：sinh函数
//测试入参x是NaN
func main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            isInf(sinh(inf16)),
            isInf(sinh(-inf16)),
            isInf(sinh(inf32)),
            isInf(sinh(-inf32)),
            isInf(sinh(inf64)),
            isInf(sinh(-inf64))
        ],
      description: "test case 01"
    )
  return 0
}
