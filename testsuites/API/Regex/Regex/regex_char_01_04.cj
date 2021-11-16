// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan NoneValueException3
// ASSERT: scan success

from std import regex.*
func main()
{
   // \n
   var result1=Regex("\n").matcher("\n").find().getOrThrow().matchStr()
   try{
       var result3=Regex("\n").matcher("\\n").find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("NoneValueException3\n")
   }
   var result4=Regex("\n").matcher("43asd\ndsf").find().getOrThrow().matchStr()

   if(result1!="\n"||result4!="\n")
   {
       print("Part1+${result1}+${result4}\n")
       return 1
   }

   print("success\n")
   return 0
}