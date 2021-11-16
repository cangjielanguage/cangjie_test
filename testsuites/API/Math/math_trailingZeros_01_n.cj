// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试trailingZeros
//函数功能：x的低位算起，计算x的二进制表达中，有多少位连续为0
//测试入参x范围是（-1，1）
func main() {
    CaseRunner<Int8>().runCases(
	[
            //重载trailingZeros(x:UInt18)：Int8
            //不连续多个0
           (trailingZeros(UInt8(0b01010110)),Int8(1)),
           (trailingZeros(UInt8(86)),Int8(1)),
           (trailingZeros(UInt8(0b01010000)),Int8(4)),
           (trailingZeros(UInt8(80)),Int8(4)),


            //重载trailingZeros(x:UInt16)：Int8
            (trailingZeros(UInt16(0b0000000001010110)), Int8(1)),
            (trailingZeros(UInt16(86)), Int8(1)),
            (trailingZeros(UInt16(0b0000000001010000)), Int8(4)),
            (trailingZeros(UInt16(80)), Int8(4)),

             //重载trailingZeros(x:UInt32)：Int8
            (trailingZeros(UInt32(0b00000000000000000000000001010110)), Int8(1)),
            (trailingZeros(UInt32(86)), Int8(1)),
            (trailingZeros(UInt32(0b00000000000000000000000001010000)), Int8(4)),
            (trailingZeros(UInt32(80)), Int8(4)),

            //重载trailingZeros(x:UInt64)：Int8
            (trailingZeros(UInt64(0b0000000000000000000000000000000000000000000000000000000001010110)), Int8(1)),
            (trailingZeros(UInt64(86)), Int8(1)),
            (trailingZeros(UInt64(0b0000000000000000000000000000000000000000000000000000000001010000)), Int8(4)),
            (trailingZeros(UInt64(80)), Int8(4))
      ],
    description: "trailingZeros入参是UInt，结果正确"
  )
  return 0
}
