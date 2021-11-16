// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan IllegalArgumentException

from std import math.*

func main() {
    try{
        CaseRunner<Bool>().runCasesTrue(
            [
                isNaN(log2(Float16(-0.8)))
            ],
          description: "x是负数和0"
        )
    }catch(e:IllegalArgumentException)
    {
       print("IllegalArgumentException\n")
    }
  return 0
}