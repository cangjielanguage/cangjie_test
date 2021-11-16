// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan IllegalArgumentException
from std import math.*

func main() {
    try{
      CaseRunner<Bool>().runCasesTrue(
        [
             isNaN(clamp(Float64(-5.83),Float64(-3.98),Float64(-9.45)))
        ],
          description: "Float64:min>max无效区间，且min>v>max,运行抛异常"
      )
    }catch(e:IllegalArgumentException)
    {
       print("IllegalArgumentException\n")
    }
  return 0
}