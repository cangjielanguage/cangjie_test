// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
func main() {
  CaseRunner<Bool>().runCasesTrue(
      [
             //x为Float16:NaN，返回Float16:NaN
            isNaN(nan16),
            isNaN(nan32),
            isNaN(nan64)
      ],
    description: "test case 1"
  )
  CaseRunner<Bool>().runCasesTrue(
      [
             //x为Float16:NaN，返回Float16:NaN
            isNaN(Float16(0)),
            isNaN(Float32(0)),
            isNaN(Float64(0))
      ],
      description: "test case 1",
      checktype: "AssertFalse"
  )

  return 0
}
