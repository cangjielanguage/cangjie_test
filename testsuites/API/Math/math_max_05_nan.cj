// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*

func main() {
      CaseRunner<Bool>().runCasesTrue(
         [
           //入参至少有一个是Float16:NaN
           isNaN(max(Float16(5),nan16)),
           isNaN(max(nan16,nan16)),
           //入参至少有一个是Float32:NaN
           isNaN(max(Float32(5),nan32)),
           isNaN(max(nan32,nan32)),
           //入参至少有一个是Float64:NaN
           isNaN(max(Float64(5),nan64)),
           isNaN(max(nan64,nan64)),
           isNaN(max(nan16,Float16(5))),
           isNaN(max(nan32,Float32(5))),
           isNaN(max(nan64,Float64(5)))
         ],
       description: "入参至少存在一个nan"
       )
    return 0
}
