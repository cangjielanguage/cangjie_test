// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
//测试func log（x: float16): float16
//函数功能：求自然底数e的对数
//x的取值为（0，+∞）
//e约等于2.7182818284
//入参异常：即x是负数和0
func main() {
    CaseRunner<Bool>().runCasesTrue(
       [
         //入参至少有一个是Float16:NaN
         isNaN(log(nan16)),
         //入参至少有一个是Float32:NaN
         isNaN(log(nan32)),
         //入参至少有一个是Float64:NaN
         isNaN(log(nan64))
       ],
     description: "test case 1" /**用例描述**/
     )
     return 0
}
