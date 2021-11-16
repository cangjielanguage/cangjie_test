// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan IllegalArgumentException

from std import math.*

func main() {
    try{
        CaseRunner<Bool>().runCasesTrue(
          [
             isNaN(acosh(Float64(0.9)))
          ],
          description: "入参在acos（）入参是Float64，且定义域范围之外，抛出异常"
        )
    }catch(e:IllegalArgumentException)
    {
       print("IllegalArgumentException\n")
    }
  return 0
}