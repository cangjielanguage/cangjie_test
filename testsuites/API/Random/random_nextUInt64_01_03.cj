// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import util.*
func main()
{
   var count:UInt64=0 //记录结果正确次数
   var n:UInt64=200  //定义循环次数
   var r=Random()
   var m1=r.nextUInt64(-1) // EXPECTED: regex error.*?the number '-1' exceeds the value range of type 'UInt64'
   var m1=r.nextUInt64(18446744073709551616) // EXPECTED: regex error.*?the number '18446744073709551616' exceeds the value range of type 'UInt64'
    print("success\n")
   return 0
}