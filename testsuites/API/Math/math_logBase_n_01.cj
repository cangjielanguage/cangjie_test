// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
//测试func logBase(x: Float16, base: Float16) : Float16
//函数功能logBase(x,base)=log(x)/log(base)
//x>0且base>0,且base！=1即，log（base）！=0
//e约等于2.7182818284
//入参正常：x
func main() {
   CaseRunner<Float16>().runCases(
      [
        //x>0且base>0,且base！=1即，log（base）！=0
        //x是正数
        //x是正小数，y取正小数
        (logBase(Float16(2.718281),Float16(7.389056)), Float16(0.5), Float16(0.15)),
        //x是正小数，y取正整数
        (logBase(Float16(2.718281),Float16(4)), Float16(0.721348), Float16(0.15)),
        //x是正整数，y取正小数
        (logBase(Float16(4),Float16(2.718281)), Float16(1.386294), Float16(0.15)),
        //x是正整数，y取正整数
        (logBase(Float16(2),Float16(2)), Float16(1), Float16(0.001))
     ],
    description: "test case 1" /**用例描述**/
    )
  return 0
}