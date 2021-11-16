// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试floor(x:Float16)：Float16
//函数功能：x取下整，即不大于x的第一个整数
//测试入参x范围是（-∞，+∞）
//入参x是-Inf
func main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            isInf(floor(inf16)),
            isInf(floor(-inf16)),
            isInf(floor(inf32)),
            isInf(floor(-inf32)),
            isInf(floor(inf64)),
            isInf(floor(-inf64))
        ],
      description: "test case 01"
    )
  return 0
}
