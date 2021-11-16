// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
func main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            isInf(exp2(inf16)),
            isInf(exp2(inf32)),
            isInf(exp2(inf64))
        ],
      description: "test case 01"
    )
    CaseRunner<Float16>().runCases(
        [
            (exp2(-inf16),Float16(0),Float16(0.0001))
        ],
      description: "test case 02"
    )
     CaseRunner<Float32>().runCases(
         [
             (exp2(-inf32),Float32(0),Float32(0.0001))
         ],
       description: "test case 02"
     )
     CaseRunner<Float64>().runCases(
        [
             (exp2(-inf64),Float64(0),Float64(0.0001))
        ],
        description: "test case 02"
     )
  return 0
}