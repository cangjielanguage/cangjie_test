// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="a6Ud879sd4j5Uu"
   var regex1=Regex(regexString)
   var matcher1=Matcher(regex1,matchString)
   var matcher2=regex1.matcher(matchString)
   var result1=matcher1.replace("12m")
   var result2=matcher1.replace("12m")
   var result3=matcher2.replace("12m")
   var result4=matcher2.replace("12m")
   if(result1!="a6Ud8712md4j5Uu"||result2!="a6Ud8712md12m5Uu"||result3!="a6Ud8712md4j5Uu"||result4!="a6Ud8712md12m5Uu")
   {
       print("${result1}+${result2}+${result3}+${result4}\n")
       return 1
   }
   print("success\n")
   return 0
}