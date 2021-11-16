// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="a6Ud8f7M9sd4j5Uu"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var matcher1=Matcher(regex1,matchString)
   var matcher2=Matcher(regex2,matchString)
   var result1=matcher1.replace("10m",8)
   var result2=matcher1.replace("10m",8)
   var result3=matcher2.replace("12m",8)
   var result4=matcher2.replace("12m",8)
   var result5=matcher2.replace("12m",8)
   if(result1!="a6Ud8f7M10md4j5Uu"||result2!="a6Ud8f7M10md4j5Uu"||result3!="a6Ud8f7M12md4j5Uu"||result4!="a6Ud8f7M12md4j5Uu"||result5!="a6Ud8f7M12md4j5Uu")
   {
       print("${result1}+${result2}+${result3}+${result4}+${result5}\n")
       return 1
   }
   print("success\n")
   return 0
}