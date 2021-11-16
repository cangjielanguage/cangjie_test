// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="a6Ud879sd4j5Uu"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var matchresult1=Matcher(regex1,matchString).replace("10m")
   var matchresult2=Matcher(regex2,matchString).replace("11m")
   var matchresult3=regex1.matcher(matchString).replace("12m")
   var matchresult4=regex2.matcher(matchString).replace("13m")
   if(matchresult1!="a6Ud8710md4j5Uu"||matchresult2!="a11md879sd4j5Uu"||matchresult3!="a6Ud8712md4j5Uu"||matchresult4!="a13md879sd4j5Uu")
   {
       print("${matchresult1}+${matchresult2}+${matchresult3}+${matchresult4}\n")
       return 1
   }
   print("success\n")
   return 0
}