// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
//测试func logBase(x: Float32, base: Float32) : Float32
//函数功能logBase(x,base)=log(x)/log(base)
//x>0且base>0,且base！=1即，log（base）！=0
//e约等于2.7182818284
//入参正常：x
func main() {
   CaseRunner<Float32>().runCases(
      [
        //x>0且base>0,且base！=1即，log（base）！=0
        //x是正数
        //x是正小数，y取正小数
        (logBase(Float32(2.718281),Float32(7.389056)), Float32(0.5), Float32(0.001)),
        //x是正小数，y取正整数
        (logBase(Float32(2.718281),Float32(4)), Float32(0.721348), Float32(0.001)),
        //x是正整数，y取正小数,
        (logBase(Float32(4),Float32(2.718281)), Float32(1.386294), Float32(0.001)),
        //x是正整数，y取正整数
        (logBase(Float32(2),Float32(2)), Float32(1), Float32(0.001))
     ],
    description: "test case 1" /**用例描述**/
    )
  return 0
}