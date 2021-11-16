// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import util.*
func main()
{
   var count:UInt64=0 //记录结果正确次数
   var n:UInt64=200  //定义循环次数
   var r=Random()
   var m1=r.nextInt8(128)      // EXPECTED: regex error.*?the number '128' exceeds the value range of type 'Int8'
   var m2=r.nextInt8(-129)     // EXPECTED: regex error.*?the number '-129' exceeds the value range of type 'Int8'
   print("success\n")
    return 0
}