// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import util.*
func main()
{
   var count:UInt64=0 //记录结果正确次数
   var n:UInt64=200  //定义循环次数
   var r=Random()
   r.setSeed(UInt64(9))
   for (i in 0..n)
   {
      var m1=r.nextFloat32()
      if( m1 is Float32)
      {
          if(m1>=0.0 && m1<=1.0)
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