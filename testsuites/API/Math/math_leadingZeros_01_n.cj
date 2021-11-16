// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试leadingZeros
//函数功能：x的高位算起，计算x的二进制表达中，有多少位连续为0
//测试入参x范围是（-1，1）
func main() {
  CaseRunner<Int8>().runCases(
    [
        //重载leadingZeros(x:UInt8)：Int8
        //不连续多个0
        (leadingZeros(UInt8(0b01010110)),Int8(1)),
        (leadingZeros(UInt8(86)),Int8(1)),
        //连续多个0
        (leadingZeros(UInt8(0b00011111)),Int8(3)),
        (leadingZeros(UInt8(31)),Int8(3)),
        //重载leadingZeros(x:UInt16)：Int8
        (leadingZeros(UInt16(0b0000000001010110)),Int8(9)),
        (leadingZeros(UInt16(86)),Int8(9)),
        (leadingZeros(UInt16(0b0000000000011111)),Int8(11)),
        (leadingZeros(UInt16(31)),Int8(11)),
        //重载leadingZeros(x:UInt32)：Int8
        (leadingZeros(UInt32(0b00000000000000000000000001010110)),Int8(25)),
        (leadingZeros(UInt32(86)),Int8(25)),
        (leadingZeros(UInt32(0b00000000000000000000000000011111)), Int8(27)),
        (leadingZeros(UInt32(31)),Int8(27)),
        //重载leadingZeros(x:UInt64)：Int8
        (leadingZeros(UInt64(0b0000000000000000000000000000000000000000000000000000000001010110)), Int8(57)),
        (leadingZeros(UInt64(86)), Int8(57)),
        (leadingZeros(UInt64(0b0000000000000000000000000000000000000000000000000000000000011111)), Int8(59)),
        (leadingZeros(UInt64(31)), Int8(59))
      ],
    description: "test case 1" /**用例描述**/
  )
  var m:UInt64=0b1111111111111111111111111111111111111111111111111111111111111011
  print("${leadingZeros(m)}\n")
  return 0
}
