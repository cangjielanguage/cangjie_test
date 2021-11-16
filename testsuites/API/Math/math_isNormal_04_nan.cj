// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//函数：isNormal (x)
//函数功能：判断x是否正常（既不是零，无穷也不是NAN）。如果数字正常，则此函数返回1，否则返回零。
//输入0，无穷大，Nan返回flase
func main() {
  //isNormal (x:Float16)
  CaseRunner<Bool>().runCasesTrue(
      [
             //x为Float16:NaN，返回Float16:NaN
            isNormal(nan16),
            isNormal(nan32),
            isNormal(nan64)
      ],
    description: "test case 1",
    checktype  : "AssertFalse"
  )
  return 0
}
