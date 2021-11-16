// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
//测试func log2(x: Float16) : Float16
//入参是NaN,只针对float类型
func main() {

    CaseRunner<Bool>().runCasesTrue(
       [
         //入参至少有一个是Float16:NaN
         isNaN(log2(nan16)),
         //入参至少有一个是Float32:NaN
         isNaN(log2(nan32)),
         //入参至少有一个是Float64:NaN
         isNaN(log2(nan64))
       ],
     description: "test case 1" /**用例描述**/
     )
   return 0
}
