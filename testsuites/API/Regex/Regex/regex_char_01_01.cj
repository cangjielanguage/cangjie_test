// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan NoneValueException3
// ASSERT: scan success

from std import regex.*
func main()
{
   // \r
   var result1=Regex("\r").matcher("\r").find().getOrThrow().matchStr()
   try{
       var result3=Regex("\r").matcher("\\r").find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("NoneValueException3\n")
   }
   var result4=Regex("\r").matcher("43asd\rdsf").find().getOrThrow().matchStr()


   if(result1!="\r"||result4!="\r")
   {
       print("Part1+${result1}+${result4}\n")
       return 1
   }

   print("success\n")
   return 0
}