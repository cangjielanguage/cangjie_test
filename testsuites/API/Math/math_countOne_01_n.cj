// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试countOne
//函数功能：求x的二进制表达式有多少个1
//测试入参x范围是（-1，1）
func main() {

   CaseRunner<Int8>().runCases(
      [
            //重载countOne(x:UInt8)：Int8
            //不连续多个1
            (countOne(UInt8(0b01010110)),Int8(4)),
            (countOne(UInt8(86)),Int8(4)),
            //连续多个1
            (countOne(UInt8(0b00011111)),Int8(5)),
            (countOne(UInt8(31)),Int8(5)),
            //重载countOne(x:UInt16)：Int8
            (countOne(UInt16(0b0000000001010110)),Int8(4)),
            (countOne(UInt16(86)),Int8(4)),
            (countOne(UInt16(0b0000000000011111)),Int8(5)),
            (countOne(UInt16(31)),Int8(5)),
            //重载countOne(x:UInt32)：Int8
            (countOne(UInt32(0b00000000000000000000000001010110)),Int8(4)),
            (countOne(UInt32(86)),Int8(4)),
            (countOne(UInt32(0b00000000000000000000000000011111)),Int8(5)),
            (countOne(UInt32(31)),Int8(5)),
            //重载countOne(x:UInt64)：Int8
            (countOne(UInt64(0b00000000000000000000000000000000000000000000000001010110)),Int8(4)),
            (countOne(UInt64(86)),Int8(4)),
            (countOne(UInt64(0b00000000000000000000000000000000000000000000000000011111)),Int8(5)),
            (countOne(UInt64(31)),Int8(5))
      ],
   description: "test case 1"
  )
  return 0
}