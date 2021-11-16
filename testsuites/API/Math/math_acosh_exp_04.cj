// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan IllegalArgumentException

from std import math.*

func main() {
    try{
        CaseRunner<Bool>().runCasesTrue(
          [
             isInf(acosh(-inf16))
          ],
          description: "入参在acosh（）入参是-inf，且定义域范围之外，抛出异常"
        )
    }catch(e:IllegalArgumentException)
    {
       print("IllegalArgumentException\n")
    }
  return 0
}