// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试trailingZeros
//函数功能：x的低位算起，计算x的二进制表达中，有多少位连续为0
//入参是Int
func main() {
  CaseRunner<Int8>().runCases(
      [
           //重载trailingZeros(x:Int16)：Int8
           (trailingZeros(Int8(0b01111011)),Int8(0)),//不连续多个0
           (trailingZeros(Int8(-5)),Int8(0)),
           (trailingZeros(Int8(0b01010000)),Int8(4)),//连续多个0
           (trailingZeros(Int8(80)),Int8(4)),

            //重载trailingZeros(x:Int16)：Int8
            (trailingZeros(Int16(0b0111111111111011)), Int8(0)),
            (trailingZeros(Int16(-5)), Int8(0)),
            (trailingZeros(Int16(0b0000000001010000)), Int8(4)),
            (trailingZeros(Int16(80)), Int8(4)),

             //重载trailingZeros(x:Int32)：Int8
            (trailingZeros(Int32(0b0111111111111111111111111111011)), Int8(0)),
            (trailingZeros(Int32(-5)), Int8(0)),
            (trailingZeros(Int32(0b00000000000000000000000001010000)), Int8(4)),
            (trailingZeros(Int32(80)), Int8(4)),

            //重载trailingZeros(x:Int64)：Int8
            (trailingZeros(Int64(0b0111111111111111111111111111111111111111111111111111111111111011)), Int8(0)),
            (trailingZeros(Int64(-5)), Int8(0)),
            (trailingZeros(Int64(0b0000000000000000000000000000000000000000000000000000000001010000)), Int8(4)),
            (trailingZeros(Int64(80)), Int8(4))
      ],
    description: "入参是Int,统计个数准确"
  )
  return 0
}
