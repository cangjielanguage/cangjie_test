// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import util.*
func main()
{
   var count:UInt64=0 //记录结果正确次数
   var n:UInt64=200  //定义循环次数
   var r=Random()
   var bound:UInt32=4294967295
   for (i in 0..n)
   {
      var m1=r.nextUInt32(bound)
      if(m1 is UInt32)
      {
          if(0<=m1 && m1<=bound)
          {
             count+=1
          }
      }
   }
   if(count!=n)
   {
        return 1
   }
   print("success\n")
   return 0
}