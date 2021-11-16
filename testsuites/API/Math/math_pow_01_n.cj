// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
//测试func pow(base: Float16, exponent: Float16) : Float16
//入参正常：x
func main() {
   CaseRunner<Float16>().runCases(
      [
        //x是负值时，y只能取整数，x是正数，无所谓
        //x是正数
        //x是正小数，y取正小数
        (pow(Float16(2.2),Float16(2.2)), Float16(5.666695), Float16(0.01))
     ],
    description: "test case 1" /**用例描述**/
    )
   CaseRunner<Float16>().runCases(
      [
        //x是负值时，y只能取整数，x是正数，无所谓
        //x是正数
        //x是正小数，y取正整数
        (pow(Float16(2.2),Float16(2)), Float16(4.84), Float16(0.01))
     ],
    description: "test case 2" /**用例描述**/
    )
   CaseRunner<Float16>().runCases(
      [
        //x是负值时，y只能取整数，x是正数，无所谓
        //x是正数
        //x是正小数，y取负小数
        (pow(Float16(2.2),Float16(-2.2)), Float16(0.176470), Float16(0.001))
     ],
    description: "test case 3" /**用例描述**/
    )
   CaseRunner<Float16>().runCases(
      [
        //x是负值时，y只能取整数，x是正数，无所谓
        //x是正数
        //x是正小数，y取负整数
        (pow(Float16(2.2),Float16(-2)), Float16(0.206611), Float16(0.001))
     ],
    description: "test case 4" /**用例描述**/
    )
   CaseRunner<Float16>().runCases(
      [
        //x是负值时，y只能取整数，x是正数，无所谓
        //x是正数
        //x是正整数，y取正小数
        (pow(Float16(2),Float16(2.2)), Float16(4.594793), Float16(0.001))
     ],
    description: "test case 5" /**用例描述**/
    )
   CaseRunner<Float16>().runCases(
      [
        //x是负值时，y只能取整数，x是正数，无所谓
        //x是正数
        //x是正整数，y取正整数
        (pow(Float16(2),Float16(2)), Float16(4), Float16(0.001))
     ],
    description: "test case 6" /**用例描述**/
    )
   CaseRunner<Float16>().runCases(
      [
        //x是负值时，y只能取整数，x是正数，无所谓
        //x是正数
        //x是正整数，y取负小数
        (pow(Float16(2),Float16(-2.2)), Float16(0.217637), Float16(0.001))
     ],
    description: "test case 7" /**用例描述**/
    )
   CaseRunner<Float16>().runCases(
      [
        //x是负值时，y只能取整数，x是正数，无所谓
        //x是正数
        //x是正整数，y取负整数
        (pow(Float16(2),Float16(-2)), Float16(0.25), Float16(0.001))
     ],
    description: "test case 8" /**用例描述**/
    )
   CaseRunner<Float16>().runCases(
      [
        //x是负数
        //x是负小数，y取正小数,异常，y取小数无法确定符号
        //(pow(Float16(-2.2),Float16(2.2), Float16(5.666695), Float16(0.001))
        //x是负小数，y取正整数
        (pow(Float16(-2.2),Float16(2)), Float16(4.84), Float16(0.01))
     ],
    description: "test case 9" /**用例描述**/
    )
   CaseRunner<Float16>().runCases(
      [
         //x是负小数，y取负整数
        (pow(Float16(-2.2),Float16(-2)), Float16(0.206611), Float16(0.01))
     ],
    description: "test case 10" /**用例描述**/
    )
   CaseRunner<Float16>().runCases(
      [
        //x是负整数，y取正整数
        (pow(Float16(-2),Float16(2)), Float16(4), Float16(0.001))
     ],
    description: "test case 11" /**用例描述**/
    )
   CaseRunner<Float16>().runCases(
      [
        //x是负整数，y取负整数
        (pow(Float16(-2),Float16(-2)), Float16(0.25), Float16(0.001))
     ],
    description: "test case 12" /**用例描述**/
    )
    CaseRunner<Bool>().runCasesTrue(
      [
         //x是特殊值：返回inf，结果为true
         isInf(pow(Float16(-0),Float16(-2)))
      ],
     description: "test case 13" /**用例描述**/
     )
    CaseRunner<Float16>().runCases(
       [
         //x是特殊值：-0
         (pow(Float16(-0),Float16(2)), Float16(0), Float16(0.01))
      ],
     description: "test case 14" /**用例描述**/
     )
   CaseRunner<Bool>().runCasesTrue(
      [

        //x是特殊值：返回inf，结果为true
         isInf(pow(Float16(0),Float16(-2)))
     ],
    description: "test case 15" /**用例描述**/
    )
   CaseRunner<Float16>().runCases(
      [

        //x是特殊值：0
        (pow(Float16(0),Float16(2)), Float16(0), Float16(0.001))
     ],
    description: "test case 16" /**用例描述**/
    )
  return 0
}