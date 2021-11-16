// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
//lcm（）函数针对UInt的测试
//lcm存在返回值大于返回值类型的范围
func main() {
   //重载func lcm(x: UInt8, y: UInt8)：UInt8
   CaseRunner<UInt8>().runCases(
      [
             //x,y均为正数且互质,
             //(0 to 255)
             (lcm(UInt8(13),UInt8(19)),UInt8(247)),
             //顺序不影响最小公倍数求法
             (lcm(UInt8(19),UInt8(13)),UInt8(247)),
             //x,y均为正数且有公因数
             (lcm(UInt8(12),UInt8(16)),UInt8(48)),
             //顺序不影响最小公倍数求法
             (lcm(UInt8(16),UInt8(12)),UInt8(48)),
             //1和任何数的最小公倍数都是任何数
             (lcm(UInt8(32),UInt8(1)),UInt8(32))
      ],
    description: "test case 1" /**用例描述**/
   )
  //重载func lcm(x: UInt16, y: UInt16)：UInt16
   CaseRunner<UInt16>().runCases(
      [
             //x,y均为正数且互质
             //(0 to 65535)
             (lcm(UInt16(256),UInt16(143)),UInt16(36608)),
             //顺序不影响最小公倍数求法
             (lcm(UInt16(143),UInt16(256)),UInt16(36608)),
             //x,y均为正数且有公因数
             (lcm(UInt16(256),UInt16(128)),UInt16(256)),
             //顺序不影响最小公倍数求法
             (lcm(UInt16(256),UInt16(128)),UInt16(256)),
             //1和任何数的最小公倍数都是任何数
             (lcm(UInt16(256),UInt16(1)),UInt16(256))
      ],
   description: "test case 2" /**用例描述**/
  )
//重载func lcm(x: UInt32, y: UInt32)：UInt32
  CaseRunner<UInt32>().runCases(
      [
             //x,y均为正数且互质
             //(0 to 4294967295)
             (lcm(UInt32(19),UInt32(13)),UInt32(247)),
             //顺序不影响最小公倍数求法,
             (lcm(UInt32(13),UInt32(19)),UInt32(247)),
             //x,y均为正数且有公因数
             (lcm(UInt32(56),UInt32(2)),UInt32(56)),
             //顺序不影响最小公倍数求法
             (lcm(UInt32(2),UInt32(56)),UInt32(56)),

             //1和任何数的最小公倍数都是任何数
             (lcm(UInt32(512),UInt32(1)),UInt32(512))
      ],
  description: "test case 3" /**用例描述**/
  )
   //重载func lcm(x: UInt64, y: UInt64)：UInt64
   CaseRunner<UInt64>().runCases(
      [
             //x,y均为正数且互质
             //(0 to 18446744073709551615)
             (lcm(UInt64(29),UInt64(37)),UInt64(1073)),
             //顺序不影响最小公倍数求法
             (lcm(UInt64(37),UInt64(29)),UInt64(1073)),
             //x,y均为正数且有公因数
             (lcm(UInt64(1024),UInt64(1024000000)),UInt64(1024000000)),
             //顺序不影响最小公倍数求法
             (lcm(UInt64(1024),UInt64(1024000000)),UInt64(1024000000)),
             //1和任何数的最小公倍数都是任何数
             (lcm(UInt64(1024000000),UInt64(1)),UInt64(1024000000))
      ],
    description: "test case 4" /**用例描述**/
    )
   return 0
}