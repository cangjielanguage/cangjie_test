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
   var matchresult1=Matcher(regex1,matchString).replace("10m",11)
   var matchresult2=Matcher(regex2,matchString).replace("11m",13)
   var matchresult3=regex1.matcher(matchString).replace("12m",11)
   var matchresult4=regex2.matcher(matchString).replace("13m",13)
   if(matchresult1!="a6Ud8f7M9sd10m5Uu"||matchresult2!="a6Ud8f7M9sd4j11mu"||matchresult3!="a6Ud8f7M9sd12m5Uu"||matchresult4!="a6Ud8f7M9sd4j13mu")
   {
       print("${matchresult1}+${matchresult2}+${matchresult3}+${matchresult4}\n")
       return 1
   }
   print("success\n")
   return 0
}