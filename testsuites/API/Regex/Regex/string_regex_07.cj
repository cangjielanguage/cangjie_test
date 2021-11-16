// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan init(regex: String) get IllegalArgumentException
// ASSERT: scan init(regex: String, flagType: Int64) get IllegalArgumentException
// ASSERT: scan success

//	DTS2021090820628
from std import regex.*
func main()
{
   var str="?" // init(regex: String)
   try{
      var regex1=Regex(str)
   }catch(e:RuntimeException)
   {
      print("init(regex: String) get IllegalArgumentException\n")
   }
   try{
         var regex2=Regex(str,0)//init(regex: String, flagType: Int64)
   }catch(e:RuntimeException)
   {
      print("init(regex: String, flagType: Int64) get IllegalArgumentException\n")
   }
   print("success\n")
   return 0
}