// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan group=4
// ASSERT: scan group=9223372036854775807
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="((ab)+?)([0-9]{2})"
   var matchString="abab34"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   try{
        var groupresult1=regex1.matches(matchString).getOrThrow().matchPosition(4)
   }catch(e:IndexOutOfBoundsException){
        print("group=4\n")
   }
   try{
        var groupresult2=regex2.matches(matchString).getOrThrow().matchPosition(9223372036854775807)
   }catch(e:IndexOutOfBoundsException){
        print("group=9223372036854775807\n")
   }
   print("success\n")
   return 0
}