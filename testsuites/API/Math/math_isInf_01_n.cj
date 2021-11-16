// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
func main() {
  CaseRunner<Bool>().runCasesTrue(
      [
          isInf(inf16),
          isInf(-inf16),
          isInf(inf32),
          isInf(-inf32),
          isInf(inf64),
          isInf(-inf64)
      ],
    description: "test case 1"
  )
  return 0
}
