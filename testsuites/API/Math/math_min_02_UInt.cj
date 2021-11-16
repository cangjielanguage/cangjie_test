// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*

//min（）函数针对UInt的测试
func main() {
   //重载func min(a: UInt8, b: UInt8)：UInt8
   CaseRunner<UInt8>().runCases(
      [
             //正数和正数比较,与顺序无关
             (min(UInt8(5),UInt8(8)),UInt8(5)),
             //正数和正数比较
             (min(UInt8(8),UInt8(5)),UInt8(5)),
             //相等的两个数返回较小值
             (min(UInt8(8),UInt8(8)),UInt8(8)),
             //0和正数比较
             (min(UInt8(0),UInt8(8)),UInt8(0)),
             //0和正数比较
             (min(UInt8(15),UInt8(0)),UInt8(0))
      ],
    description: "test case 5" /**用例描述**/
    )

   //重载func min(a: UInt16, b: UInt16)：UInt16
   CaseRunner<UInt16>().runCases(
      [
             //正数和正数比较,与顺序无关
             (min(UInt16(5),UInt16(8)),UInt16(5)),
             //正数和正数比较
             (min(UInt16(8),UInt16(5)),UInt16(5)),
             //相等的两个数返回较小值
             (min(UInt16(8),UInt16(8)),UInt16(8)),
             //0和正数比较
             (min(UInt16(0),UInt16(8)),UInt16(0)),
             //0和正数比较
             (min(UInt16(15),UInt16(0)),UInt16(0))
      ],
    description: "test case 6" /**用例描述**/
    )
   //重载func min(a: UInt32, b: UInt32)：UInt32
   CaseRunner<UInt32>().runCases(
      [
             //正数和正数比较,与顺序无关
             (min(UInt32(5),UInt32(8)),UInt32(5)),
             //正数和正数比较
             (min(UInt32(8),UInt32(5)),UInt32(5)),
             //相等的两个数返回较小值
             (min(UInt32(8),UInt32(8)),UInt32(8)),
             //0和正数比较
             (min(UInt32(0),UInt32(8)),UInt32(0)),
             //0和正数比较
             (min(UInt32(15),UInt32(0)),UInt32(0))
      ],
    description: "test case 7" /**用例描述**/
    )
   //重载func min(a: UInt64, b: UInt64)：UInt64
   CaseRunner<UInt64>().runCases(
      [
             //正数和正数比较,与顺序无关
             (min(UInt64(5),UInt64(8)),UInt64(5)),
             //正数和正数比较
             (min(UInt64(8),UInt64(5)),UInt64(5)),
             //相等的两个数返回较小值
             (min(UInt64(8),UInt64(8)),UInt64(8)),
             //0和正数比较
             (min(UInt64(0),UInt64(8)),UInt64(0)),
             //0和正数比较
             (min(UInt64(15),UInt64(0)),UInt64(0))
      ],
    description: "test case 8" /**用例描述**/
    )
  return 0
}