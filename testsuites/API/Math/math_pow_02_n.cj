// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
//测试func pow(base: Float32, exponent: Float32) : Float32
//入参正常：x
func main() {
   CaseRunner<Float32>().runCases(
      [
        //x是负值时，y只能取整数，x是正数，无所谓
        //x是正数
        //x是正小数，y取正小数
        (pow(Float32(2.2),Float32(2.2)), Float32(5.666695), Float32(0.001)),
        //x是正小数，y取正整数
        (pow(Float32(2.2),Float32(2)), Float32(4.84), Float32(0.001)),
        //x是正小数，y取负小数
        (pow(Float32(2.2),Float32(-2.2)), Float32(0.176470), Float32(0.001)),
        //x是正小数，y取负整数
        (pow(Float32(2.2),Float32(-2)), Float32(0.206611), Float32(0.001)),
        //x是正整数，y取正小数
        (pow(Float32(2),Float32(2.2)), Float32(4.594793), Float32(0.001)),
        //x是正整数，y取正整数
        (pow(Float32(2),Float32(2)), Float32(4), Float32(0.001)),
        //x是正整数，y取负小数
        (pow(Float32(2),Float32(-2.2)), Float32(0.217637), Float32(0.001)),
        //x是正整数，y取负整数
        (pow(Float32(2),Float32(-2)), Float32(0.25), Float32(0.001)),

        //x是负数
        //x是负小数，y取正小数,异常，y取小数无法确定符号
        //(pow(Float32(-2.2),Float32(2.2), Float32(5.666695), Float32(0.001))
        //x是负小数，y取正整数
        (pow(Float32(-2.2),Float32(2)), Float32(4.84), Float32(0.001)),
        //x是负小数，y取负小数,异常，y取小数无法确定符号
        //(pow(Float32(-2.2),Float32(-2.2), Float32(0.176470), Float32(0.001))
        //x是负小数，y取负整数
        (pow(Float32(-2.2),Float32(-2)), Float32(0.206611), Float32(0.001)),
        //x是负整数，y取正小数，异常，y取小数无法确定符号
        //(pow(Float32(-2),Float32(2.2), Float32(4.594793), Float32(0.001))
        //x是负整数，y取正整数
        (pow(Float32(-2),Float32(2)), Float32(4), Float32(0.001)),
        //x是负整数，y取负小数，y取小数无法确定符号
        // (pow(Float32(-2),Float32(-2.2), Float32(0.217637), Float32(0.001))
        //x是负整数，y取负整数
        (pow(Float32(-2),Float32(-2)), Float32(0.25), Float32(0.001)),

        //x是特殊值：-0
        (pow(Float32(-0),Float32(2)), Float32(0), Float32(0.001)),
        //x是特殊值：0
        (pow(Float32(0),Float32(2)), Float32(0), Float32(0.001))
     ],
    description: "test case 1" /**用例描述**/
    )
    CaseRunner<Bool>().runCasesTrue(
      [
         //x是特殊值：返回inf，结果为true
         isInf(pow(Float32(0),Float32(-2))),
         isInf(pow(Float32(-0),Float32(-2)))
      ],
     description: "test case 2" /**用例描述**/
    )

  return 0
}