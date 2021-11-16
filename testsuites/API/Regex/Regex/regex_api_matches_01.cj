// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString1="8s"
   var matchString2="9D"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var matchresult1=regex1.matches(matchString1).getOrThrow().matchStr()
   var matchresult2=regex2.matches(matchString2).getOrThrow().matchStr()
   var matchresult3=regex2.matches(matchString1).getOrThrow().matchStr()
   if(matchresult1!=matchString1||matchresult2!=matchString2||matchresult3!=matchString1)
   {
       print("${matchresult1}+${matchresult2}+${matchresult3}\n")
       return 1
   }
   print("success\n")
   return 0
}