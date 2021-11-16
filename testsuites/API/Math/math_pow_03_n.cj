// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
//测试func pow(base: Float64, exponent: Float64) : Float64
//入参正常：x
func main() {
   CaseRunner<Float64>().runCases(
      [
        //x是负值时，y只能取整数，x是正数，无所谓
        //x是正数
        //x是正小数，y取正小数
        (pow(Float64(2.2),Float64(2.2)), Float64(5.666695), Float64(0.001)),
        //x是正小数，y取正整数
        (pow(Float64(2.2),Float64(2)), Float64(4.84), Float64(0.001)),
        //x是正小数，y取负小数
        (pow(Float64(2.2),Float64(-2.2)), Float64(0.176470), Float64(0.001)),
        //x是正小数，y取负整数
        (pow(Float64(2.2),Float64(-2)), Float64(0.206611), Float64(0.001)),
        //x是正整数，y取正小数
        (pow(Float64(2),Float64(2.2)), Float64(4.594793), Float64(0.001)),
        //x是正整数，y取正整数
        (pow(Float64(2),Float64(2)), Float64(4), Float64(0.001)),
        //x是正整数，y取负小数
        (pow(Float64(2),Float64(-2.2)), Float64(0.217637), Float64(0.001)),
        //x是正整数，y取负整数
        (pow(Float64(2),Float64(-2)), Float64(0.25), Float64(0.001)),

        //x是负数
        //x是负小数，y取正小数,异常，y取小数无法确定符号
        //(pow(Float64(-2.2),Float64(2.2), Float64(5.666695), Float64(0.001))
        //x是负小数，y取正整数
        (pow(Float64(-2.2),Float64(2)), Float64(4.84), Float64(0.001)),
        //x是负小数，y取负小数,异常，y取小数无法确定符号
        //(pow(Float64(-2.2),Float64(-2.2), Float64(0.176470), Float64(0.001))
        //x是负小数，y取负整数
        (pow(Float64(-2.2),Float64(-2)), Float64(0.206611), Float64(0.001)),
        //x是负整数，y取正小数，异常，y取小数无法确定符号
        //(pow(Float64(-2),Float64(2.2), Float64(4.594793), Float64(0.001))
        //x是负整数，y取正整数
        (pow(Float64(-2),Float64(2)), Float64(4), Float64(0.001)),
        //x是负整数，y取负小数，y取小数无法确定符号
        // (pow(Float64(-2),Float64(-2.2), Float64(0.217637), Float64(0.001))
        //x是负整数，y取负整数
        (pow(Float64(-2),Float64(-2)), Float64(0.25), Float64(0.001)),

        //x是特殊值：-0
        (pow(Float64(-0),Float64(2)), Float64(0), Float64(0.001)),
        //x是特殊值：0
        (pow(Float64(0),Float64(2)), Float64(0), Float64(0.001))
     ],
    description: "test case 1" /**用例描述**/
    )
  return 0
}
