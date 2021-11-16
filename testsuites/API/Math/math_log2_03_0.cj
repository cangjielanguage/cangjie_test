// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
//测试func log2（x: float32): float32
//函数功能：求以2为底x的对数
//x的取值为（0，+∞）
//入参异常：即x是负数和0
func main() {
  CaseRunner<Bool>().runCasesTrue(
      [
          isInf(log2(Float16(-0))),
          isInf(log2(Float32(-0))),
          isInf(log2(Float64(-0))),
          isInf(log2(Float16(0))),
          isInf(log2(Float32(0))),
          isInf(log2(Float64(0)))
      ],
    description: "test case 1"
  )
  return 0
}