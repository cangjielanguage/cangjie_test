// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="((ab)+?)([0-9]){2}"
   var matchString3="ababab23"
   var regex1=Regex(regexString)
   try{
        var groupresult1=regex1.matcher(matchString3).fullMatch().getOrThrow().matchStr(-1)
   }catch(e:IndexOutOfBoundsException)
   {
       print("IndexOutOfBoundsException1\n")
   }
   print("success\n")
   return 0
}