// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
//入参是-Inf:Float64,抛异常
func main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            isInf(log(inf16)),
            isInf(log(inf32)),
            isInf(log(inf64))
        ],
      description: "test case 01"
    )
  return 0
}
