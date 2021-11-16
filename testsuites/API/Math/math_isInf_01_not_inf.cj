// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*

func main() {
  CaseRunner<Bool>().runCasesTrue(
      [
             isInf(Float16(0.0)),
             isInf(Float16(-0.0)),
             isInf(Float32(0.0)),
             isInf(Float32(-0.0)),
             isInf(Float64(0.0)),
             isInf(Float64(-0.0))
      ],
      description: "test case 1",
      checktype: "AssertFalse"
  )
  return 0
}