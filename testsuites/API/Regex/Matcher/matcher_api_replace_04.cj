// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="a6Ud879sd9s5Uu"
   var regex1=Regex(regexString)
   var matcher1=Matcher(regex1,matchString)
   var matcher2=regex1.matcher(matchString)
   var result1=matcher1.replace("9s")
   var result2=matcher1.replace("9s")
   var result3=matcher1.replace("13m")
   if(result1!="a6Ud879sd9s5Uu"||result2!="a6Ud879sd9s5Uu"||result3!="a6Ud879sd9s5Uu")
   {
       print("${result1}+${result2}+${result3}\n")
       return 1
   }
   print("success\n")
   return 0
}