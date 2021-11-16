// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="a6U8Sd8f7M9sd4j5Uu"
   var regex1=Regex(regexString)
   var matcher1=Matcher(regex1,matchString)  // 1. Initialization
   var str1=matcher1.resetString(matchString).getString()//2.reset String to same String
   var str2=matcher1.resetString("").getString()//2.reset String to empty String
   var str3=matcher1.resetString("asdasd").getString()//2.reset String to different String
    if(str1!=matchString||str2!=""||str3!="asdasd")
    {
        print("${str1}+${str2}+${str3}\n")
        return 1
    }
   print("success\n")
   return 0
}