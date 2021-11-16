// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试leadingZeros
//函数功能：x的高位算起，计算x的二进制表达中，有多少位连续为0
//测试入参x是Int
func main() {
  CaseRunner<Int8>().runCases(
    [
        //重载leadingZeros(x:Int8)：Int8
        //不连续多个0
        (leadingZeros(Int8(0b11111011)),Int8(0)),
        (leadingZeros(Int8(-5)),Int8(0)),
        //连续多个0
        (leadingZeros(Int8(0b00011111)),Int8(3)),
        (leadingZeros(Int8(31)),Int8(3)),
        //重载leadingZeros(x:Int16)：Int8
        (leadingZeros(Int16(0b1111111111111011)),Int8(0)),
        (leadingZeros(Int16(-5)),Int8(0)),
        (leadingZeros(Int16(0b0000000000011111)),Int8(11)),
        (leadingZeros(Int16(31)),Int8(11)),
        //重载leadingZeros(x:Int32)：Int8
        (leadingZeros(Int32(0b11111111111111111111111111111011)),Int8(0)),
        (leadingZeros(Int32(-5)),Int8(0)),
        (leadingZeros(Int32(0b00000000000000000000000000011111)), Int8(27)),
        (leadingZeros(Int32(31)),Int8(27)),
        //重载leadingZeros(x:Int64)：Int8
        (leadingZeros(Int64(0b1111111111111111111111111111111111111111111111111111111111111011)), Int8(0)),
        (leadingZeros(Int64(-5)), Int8(0)),
        (leadingZeros(Int64(0b0000000000000000000000000000000000000000000000000000000000011111)), Int8(59)),
        (leadingZeros(Int64(31)), Int8(59))
      ],
    description: "test case 1" /**用例描述**/
  )
  print("${leadingZeros(Int64(0b1111111111111111111111111111111111111111111111111111111111111011))}\n")
  return 0
}
