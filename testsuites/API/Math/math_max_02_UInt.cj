// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*

//min（）函数针对UInt的测试
func main() {
   //重载func max(a: UInt8, b: UInt8)：UInt8
   CaseRunner<UInt8>().runCases(
      [
             //正数和正数比较,与顺序无关
             (max(UInt8(5),UInt8(8)),UInt8(8)),
             //正数和正数比较
             (max(UInt8(8),UInt8(5)),UInt8(8)),
             //相等的两个数返回较小值
             (max(UInt8(8),UInt8(8)),UInt8(8)),
             //0和正数比较
             (max(UInt8(0),UInt8(8)),UInt8(8)),
             //0和正数比较
             (max(UInt8(15),UInt8(0)),UInt8(15))
      ],
    description: "test case 1" /**用例描述**/
    )

   //重载func max(a: UInt16, b: UInt16)：UInt16
   CaseRunner<UInt16>().runCases(
      [
             //正数和正数比较,与顺序无关
             (max(UInt16(5),UInt16(8)),UInt16(8)),
             //正数和正数比较
             (max(UInt16(8),UInt16(5)),UInt16(8)),
             //相等的两个数返回较小值
             (max(UInt16(8),UInt16(8)),UInt16(8)),
             //0和正数比较
             (max(UInt16(0),UInt16(8)),UInt16(8)),
             //0和正数比较
             (max(UInt16(15),UInt16(0)),UInt16(15))
      ],
    description: "test case 2" /**用例描述**/
    )
   //重载func max(a: UInt32, b: UInt32)：UInt32
   CaseRunner<UInt32>().runCases(
      [
             //正数和正数比较,与顺序无关
             (max(UInt32(5),UInt32(8)),UInt32(8)),
             //正数和正数比较
             (max(UInt32(8),UInt32(5)),UInt32(8)),
             //相等的两个数返回较小值
             (max(UInt32(8),UInt32(8)),UInt32(8)),
             //0和正数比较
             (max(UInt32(0),UInt32(8)),UInt32(8)),
             //0和正数比较
             (max(UInt32(15),UInt32(0)),UInt32(15))
      ],
    description: "test case 3" /**用例描述**/
    )
   //重载func max(a: UInt64, b: UInt64)：UInt64
   CaseRunner<UInt64>().runCases(
      [
             //正数和正数比较,与顺序无关
             (max(UInt64(5),UInt64(8)),UInt64(8)),
             //正数和正数比较
             (max(UInt64(8),UInt64(5)),UInt64(8)),
             //相等的两个数返回较小值
             (max(UInt64(8),UInt64(8)),UInt64(8)),
             //0和正数比较
             (max(UInt64(0),UInt64(8)),UInt64(8)),
             //0和正数比较
             (max(UInt64(15),UInt64(0)),UInt64(15))
      ],
    description: "test case 4" /**用例描述**/
    )
  return 0
}