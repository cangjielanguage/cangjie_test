// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan NoneValueException3
// ASSERT: scan success

from std import regex.*
func main()
{
   // \t
   var result1=Regex("\t").matcher("\t").find().getOrThrow().matchStr()

   try{
       var result2=Regex("\t").matcher("\\t").find().getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("NoneValueException3\n")
   }
   var result4=Regex("\t").matcher("43asd\tdsf").find().getOrThrow().matchStr()

   if(result1!="\t"||result4!="\t")
   {
       return 1
   }
   print("success\n")
   return 0
}