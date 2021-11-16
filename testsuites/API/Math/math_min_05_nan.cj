// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*

func main() {
      CaseRunner<Bool>().runCasesTrue(
         [
           //入参至少有一个是Float16:NaN
           isNaN(min(nan16,Float16(5))),
           isNaN(min(nan16,nan16)),
           //入参至少有一个是Float32:NaN
           isNaN(min(nan32,Float32(5))),
           isNaN(min(nan32,nan32)),
           //入参至少有一个是Float64:NaN
           isNaN(min(nan64,Float64(5))),
           isNaN(min(nan64,nan64)),
           isNaN(min(Float16(5),nan16)),
           isNaN(min(Float32(5),nan32)),
           isNaN(min(Float64(5),nan64))
         ],
       description: "入参至少存在一个nan"
       )
    return 0
}
