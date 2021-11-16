// EXEC-PIPE-1: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan NoneValueException1
// ASSERT: scan NoneValueException2
// ASSERT: scan NoneValueException3
// ASSERT: scan NoneValueException4
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="((ab)+?)([0-9]{2})"
   var matchString="dsdababABagfg34234565323"//can't match
   var regex1=Regex(regexString)
   try{
       var groupresult1=regex1.matches(matchString).getOrThrow().matchPosition()
   }catch(e:NoneValueException)
   {
       print("NoneValueException1\n")
   }
   try{
      var groupresult2=Matcher(regex1,matchString).find().getOrThrow().matchPosition()
   }catch(e:NoneValueException)
   {
       print("NoneValueException2\n")
   }

   var regex2=Regex(regexString,2)
   try{
       var groupresult3=regex2.matches(matchString).getOrThrow().matchPosition()
   }catch(e:NoneValueException)
   {
       print("NoneValueException3\n")
   }
   try{
      var groupresult4=Matcher(regex2,matchString).find().getOrThrow().matchPosition()
   }catch(e:NoneValueException)
   {
       print("NoneValueException4\n")
   }
   print("success\n")
   return 0
}