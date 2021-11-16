// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试countOne
//函数功能：求x的二进制表达式有多少个1
//测试入参x入参是Int
func main() {

   CaseRunner<Int8>().runCases(
      [
            //重载countOne(x:Int8)：Int8
            //不连续多个1
            (countOne(Int8(0b11111011)),Int8(3)),
            (countOne(Int8(-5)),Int8(3)),
            //连续多个1
            (countOne(Int8(0b00011111)),Int8(5)),
            (countOne(Int8(31)),Int8(5)),
            //重载countOne(x:Int16)：Int8
            (countOne(Int16(0b1111111111111011)),Int8(3)),
            (countOne(Int16(-5)),Int8(3)),
            (countOne(Int16(0b0000000000011111)),Int8(5)),
            (countOne(Int16(31)),Int8(5)),
            //重载countOne(x:Int32)：Int8
            (countOne(Int32(0b11111111111111111111111111111011)),Int8(3)),
            (countOne(Int32(-5)),Int8(3)),
            (countOne(Int32(0b00000000000000000000000000011111)),Int8(5)),
            (countOne(Int32(31)),Int8(5)),
            //重载countOne(x:Int64)：Int8
            (countOne(Int64(0b1111111111111111111111111111111111111111111111111111111111111011)),Int8(3)),
            (countOne(Int64(-5)),Int8(3)),
            (countOne(Int64(0b00000000000000000000000000000000000000000000000000011111)),Int8(5)),
            (countOne(Int64(31)),Int8(5))
      ],
   description: "countOne()入参是Int8，Int16,Int32,Int64"
  )
  print("${countOne(Int64(0b1111111111111111111111111111111111111111111111111111111111111011))}\n")
  print("${countOne(Int8(0b11111011))}\n")

  return 0
}
