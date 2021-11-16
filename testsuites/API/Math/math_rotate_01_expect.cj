// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//函数：func rotate(num: UInt8, d: Int8):UInt8
//函数功能：先判断d是不是一个正数，如果d是一个正数，功能就是把num的二进制表达式左移d位。如果d是一个负数，功能就是把num的二进制表达式右移d位。
//测试入参x范围是（-1，1）
func main() {
  //func rotate(num: UInt8, d: Int8):UInt8
  CaseRunner<UInt8>().runCases(
      [
        //边界值
        //负数右移，正数左移
        (rotate(UInt8(1),Int8(-1)),UInt8(128)),
        (rotate(UInt8(0b00000001),Int8(-1)),UInt8(128)),
        (rotate(UInt8(8),Int8(-1)),UInt8(4)),
        (rotate(UInt8(0b00001000),Int8(-1)),UInt8(4)),
        (rotate(UInt8(2),Int8(1)),UInt8(4)),
        (rotate(UInt8(0b00000010),Int8(1)),UInt8(4)),
        (rotate(UInt8(128),Int8(1)),UInt8(1)),
        (rotate(UInt8(0b10000000),Int8(1)),UInt8(1)),
        //特殊值
        //针对于UInt8，num=0,左移右移都是0
        (rotate(UInt8(0),Int8(-1)),UInt8(0)),
        (rotate(UInt8(0b00000000),Int8(-1)),UInt8(0)),
        (rotate(UInt8(0),Int8(1)),UInt8(0)),
        (rotate(UInt8(0b00000000),Int8(1)),UInt8(0)),

        //特殊场景，
        //移动位数超过当前数字位数，循环移动
        (rotate(UInt8(128),Int8(-9)),UInt8(64)),
        (rotate(UInt8(0b10000000),Int8(-9)),UInt8(64)),
        (rotate(UInt8(128),Int8(9)),UInt8(1)),
        (rotate(UInt8(0b10000000),Int8(9)),UInt8(1))
      ],
    description: "test case 1"
  )
   //func rotate(num: UInt16, d: Int16):UInt16
  CaseRunner<UInt16>().runCases(
      [
        //边界值
        //负数右移，正数左移
        (rotate(UInt16(1),Int8(-1)),UInt16(32768)),
        (rotate(UInt16(0b0000000000000001),Int8(-1)),UInt16(32768)),
        (rotate(UInt16(8),Int8(-1)),UInt16(4)),
        (rotate(UInt16(0b0000000000001000),Int8(-1)),UInt16(4)),
        (rotate(UInt16(2),Int8(1)),UInt16(4)),
        (rotate(UInt16(0b0000000000000010),Int8(1)),UInt16(4)),
        (rotate(UInt16(32768),Int8(1)),UInt16(1)),
        (rotate(UInt16(0b1000000000000000),Int8(1)),UInt16(1)),
        //特殊值
        //针对于UInt16，num=0,左移右移都是0
        (rotate(UInt16(0),Int8(-1)),UInt16(0)),
        (rotate(UInt16(0b0000000000000000),Int8(-1)),UInt16(0)),
        (rotate(UInt16(0),Int8(1)),UInt16(0)),
        (rotate(UInt16(0b0000000000000000),Int8(1)),UInt16(0)),

        //特殊场景，
        //移动位数超过当前数字位数，循环移动,即d=17等价于d=1,d=-17等价于-1
        (rotate(UInt16(32768),Int8(-17)),UInt16(16384)),
        (rotate(UInt16(0b1000000000000000),Int8(-17)),UInt16(16384)),
        (rotate(UInt16(32768),Int8(17)),UInt16(1)),
        (rotate(UInt16(0b1000000000000000),Int8(17)),UInt16(1))
      ],
    description: "test case 2"
  )
 CaseRunner<UInt32>().runCases(
      [
        //边界值
        //负数右移，正数左移
        (rotate(UInt32(1),Int8(-1)),UInt32(2147483648)),
        (rotate(UInt32(0b00000000000000000000000000000001),Int8(-1)),UInt32(2147483648)),
        (rotate(UInt32(8),Int8(-1)),UInt32(4)),
        (rotate(UInt32(0b00000000000000000000000000001000),Int8(-1)),UInt32(4)),
        (rotate(UInt32(2),Int8(1)),UInt32(4)),
        (rotate(UInt32(0b00000000000000000000000000000010),Int8(1)),UInt32(4)),
        (rotate(UInt32(2147483648),Int8(1)),UInt32(1)),
        (rotate(UInt32(0b10000000000000000000000000000000),Int8(1)),UInt32(1)),
        //特殊值
        //针对于UInt32，num=0,左移右移都是0
        (rotate(UInt32(0),Int8(-1)),UInt32(0)),
        (rotate(UInt32(0b00000000000000000000000000000000),Int8(-1)),UInt32(0)),
        (rotate(UInt32(0),Int8(1)),UInt32(0)),
        (rotate(UInt32(0b00000000000000000000000000000000),Int8(1)),UInt32(0)),

        //特殊场景，
        //移动位数超过当前数字位数，循环移动,即d=33等价于d=1,d=-33等价于Int8(-1)
        (rotate(UInt32(2147483648),Int8(-33)),UInt32(1073741824)),
        (rotate(UInt32(0b10000000000000000000000000000000),Int8(-33)),UInt32(1073741824)),
        (rotate(UInt32(2147483648),Int8(33)),UInt32(1)),
        (rotate(UInt32(0b10000000000000000000000000000000),Int8(33)),UInt32(1))
      ],
    description: "test case 3"
  )
  //func rotate(num: UInt64, d: Int64):UInt64
  var a1:UInt64=9223372036854775808
  var a2:UInt64=0b1000000000000000000000000000000000000000000000000000000000000000
  CaseRunner<UInt64>().runCases(
      [
        //边界值
        //负数右移，正数左移
        (rotate(UInt64(1),Int8(-1)),a1),
        (rotate(UInt64(0b0000000000000000000000000000000000000000000000000000000000000001),Int8(-1)),a1),
        (rotate(UInt64(8),Int8(-1)),UInt64(4)),
        (rotate(UInt64(0b0000000000000000000000000000000000000000000000000000000000001000),Int8(-1)),UInt64(4)),
        (rotate(UInt64(2),Int8(1)),UInt64(4)),
        (rotate(UInt64(0b0000000000000000000000000000000000000000000000000000000000000010),Int8(1)),UInt64(4)),
        (rotate(a1,Int8(1)),UInt64(1)),
        (rotate(a2,Int8(1)),UInt64(1)),
        //特殊值
        //针对于UInt64，num=0,左移右移都是0
        (rotate(UInt64(0),Int8(-1)),UInt64(0)),
        (rotate(UInt64(0b0000000000000000000000000000000000000000000000000000000000000000),Int8(-1)),UInt64(0)),
        (rotate(UInt64(0),Int8(1)),UInt64(0)),
        (rotate(UInt64(0b0000000000000000000000000000000000000000000000000000000000000000),Int8(1)),UInt64(0)),

        //特殊场景，
        //移动位数超过当前数字位数，循环移动,即d=65等价于d=1,d=-65等价于-1
        (rotate(a1,Int8(-65)),UInt64(4611686018427387904)),
        (rotate(a2,Int8(-65)),UInt64(4611686018427387904)),
        (rotate(a1,Int8(65)),UInt64(1)),
        (rotate(a2,Int8(65)),UInt64(1))
      ],
    description: "test case 4"
  )
 return 0
}
