// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="gg6sgggg"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var matchresult1=Matcher(regex1,matchString).replace("10m",4)
   var matchresult2=Matcher(regex2,matchString).replace("11m",4)
   var matchresult3=regex1.matcher(matchString).replace("12m",4)
   var matchresult4=regex2.matcher(matchString).replace("13m",4)
   if(matchresult1!=matchString||matchresult2!=matchString||matchresult3!=matchString||matchresult4!=matchString)
   {
       print("${matchresult1}+${matchresult2}+${matchresult3}+${matchresult4}\n")
       return 1
   }
   print("success\n")
   return 0
}