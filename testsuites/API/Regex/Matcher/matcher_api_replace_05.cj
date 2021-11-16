// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="fffff"
   var regex1=Regex(regexString)
   var matcher1=Matcher(regex1,matchString)
   var matcher2=regex1.matcher(matchString)
   var result1=matcher1.replace("9s")
   if(result1!=matchString)
   {
       print("${result1}\n")
       return 1
   }
   print("success\n")
   return 0
}