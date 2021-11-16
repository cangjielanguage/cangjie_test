// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
//测试func logBase(x: Float64, base: Float64) : Float64
//函数功能logBase(x,base)=log(x)/log(base)
//x>0且base>0,且base！=1即，log（base）！=0
//e约等于2.7182818284
//入参正常：x
func main() {
    CaseRunner<Bool>().runCasesTrue(
       [
         //入参至少有一个是Float16:NaN
         isNaN(logBase(nan16,Float16(5))),
         isNaN(logBase(Float16(5),nan16)),
         isNaN(logBase(nan16,nan16)),
         //入参至少有一个是Float32:NaN
         isNaN(logBase(nan32,Float32(5))),
         isNaN(logBase(Float32(5),nan32)),
         isNaN(logBase(nan32,nan32)),
         //入参至少有一个是Float64:NaN
         isNaN(logBase(nan64,Float64(5))),
         isNaN(logBase(Float64(5),nan64)),
         isNaN(logBase(nan64,nan64))
       ],
     description: "test case 1" /**用例描述**/
     )
  return 0
}
