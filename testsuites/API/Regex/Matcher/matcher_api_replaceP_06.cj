// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="a6Ud879sd4j56u"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var result1=Matcher(regex1,matchString).replace("10m",0)
   var result2=Matcher(regex2,matchString).replace("10m",1)
   var result3=regex1.matcher(matchString).replace("10m",13)
   var result4=regex2.matcher(matchString).replace("10m",12)

   if(result1!="a6Ud8710md4j56u"||result2!="a10md879sd4j56u"||result3!="a6Ud879sd4j56u"||result4!="a6Ud879sd4j510m")
   {
       print("${result1}+${result2}+${result3}+${result4}\n")
       return 1
   }
   print("success\n")
   return 0
}