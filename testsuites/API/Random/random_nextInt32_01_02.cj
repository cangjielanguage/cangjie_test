// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args  2>&1 | compare %f
// ASSERT: scan success+IllegalArgumentException

from std import util.*
func main()
{
   var count:UInt64=0 //记录结果正确次数
   var n:UInt64=200  //定义循环次数
   var r=Random()
   var bound:Int32=-2147483648
   try{
      var m1=r.nextInt32(bound)
   }catch(e:IllegalArgumentException)
   {
      print("success+IllegalArgumentException\n")
   }
    return 0
}