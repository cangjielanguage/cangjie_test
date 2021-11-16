// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import util.*
func main()
{
   var count:UInt64=0 //记录结果正确次数
   var n:UInt64=200  //定义循环次数
   var r=Random()
   var m1=r.nextInt32(2147483648)      // EXPECTED: regex error.*?the number '2147483648' exceeds the value range of type 'Int32'
   var m2=r.nextInt32(-2147483649)     // EXPECTED: regex error.*?the number '-2147483649' exceeds the value range of type 'Int32'
   print("success\n")
    return 0
}