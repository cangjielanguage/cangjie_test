// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan NoneValueException1
// ASSERT: scan NoneValueException2
// ASSERT: scan NoneValueException3
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="5Uu"
   var matchString1="5U"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   try{
       var matchresult1=regex1.matches(matchString).getOrThrow()
   }catch(e:NoneValueException)
   {
       print("NoneValueException1\n")
   }
   try{
       var matchresult2=regex1.matches(matchString1).getOrThrow()
   }catch(e:NoneValueException)
   {
       print("NoneValueException2\n")
   }
   try{
       var matchresult2=regex2.matches(matchString).getOrThrow()
   }catch(e:NoneValueException)
   {
       print("NoneValueException3\n")
   }
   print("success\n")
   return 0
}