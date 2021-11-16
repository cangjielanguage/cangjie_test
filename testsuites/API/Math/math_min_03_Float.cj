// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*

//min（）函数针对Float的测试
func main() {
   //重载func min(a: Float16, b: Float16)：Float16
   CaseRunner<Float16>().runCases(
      [
             //正数和正数比较,与顺序无关
             (min(Float16(5.698754),Float16(8.198754)),Float16(5.698754)),
             //正数和正数比较
             (min(Float16(8.198754),Float16(5.698754)),Float16(5.698754)),
             //相等的两个数返回较小值
             (min(Float16(8.198754),Float16(8.198754)),Float16(8.198754)),
             //0和正数比较
             (min(Float16(0),Float16(8.198754)),Float16(0)),
             //0和正数比较
             (min(Float16(15),Float16(0)),Float16(0))
      ],
    description: "test case 6" /**用例描述**/
    )
   //重载func min(a: Float32, b: Float32)：Float32
   CaseRunner<Float32>().runCases(
      [
             //正数和正数比较,与顺序无关
             (min(Float32(5.698754),Float32(8.198754)),Float32(5.698754)),
             //正数和正数比较
             (min(Float32(8.198754),Float32(5.698754)),Float32(5.698754)),
             //相等的两个数返回较小值
             (min(Float32(8.198754),Float32(8.198754)),Float32(8.198754)),
             //0和正数比较
             (min(Float32(0),Float32(8.198754)),Float32(0)),
             //0和正数比较
             (min(Float32(15),Float32(0)),Float32(0))
      ],
    description: "test case 7" /**用例描述**/
    )
   //重载func min(a: Float64, b: Float64)：Float64
   CaseRunner<Float64>().runCases(
      [
             //正数和正数比较,与顺序无关
             (min(Float64(5.698754),Float64(8.198754)),Float64(5.698754)),
             //正数和正数比较
             (min(Float64(8.198754),Float64(5.698754)),Float64(5.698754)),
             //相等的两个数返回较小值
             (min(Float64(8.198754),Float64(8.198754)),Float64(8.198754)),
             //0和正数比较
             (min(Float64(0),Float64(8.198754)),Float64(0)),
             //0和正数比较
             (min(Float64(15),Float64(0)),Float64(0))
      ],
    description: "test case 8" /**用例描述**/
    )
  return 0
}