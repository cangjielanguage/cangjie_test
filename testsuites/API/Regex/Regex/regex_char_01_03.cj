// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan NoneValueException3
// ASSERT: scan success

from std import regex.*
func main()
{
   // \f
   var result1=Regex("\f").matcher("\f").find().getOrThrow().matchStr()
   try{
       var result3=Regex("\f").matcher("\\f").find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("NoneValueException3\n")
   }
   var result4=Regex("\f").matcher("43asd\fdsf").find().getOrThrow().matchStr()

   if(result1!="\f"||result4!="\f")
   {
       print("Part1+${result1}+${result4}\n")
       return 1
   }

   print("success\n")
   return 0
}