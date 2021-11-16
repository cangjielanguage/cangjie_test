// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="a6Ud879sd4j5Uu"

   var regex1=Regex(regexString)
   var matchresult1=Matcher(regex1,matchString).find(1).getOrThrow().matchStr()
   var matchresult3=regex1.matcher(matchString).find(1).getOrThrow().matchStr()

   var regex2=Regex(regexString,2)
   var matchresult2=Matcher(regex2,matchString).find(1).getOrThrow().matchStr()
   var matchresult4=regex2.matcher(matchString).find(1).getOrThrow().matchStr()

   if(matchresult1!="9s"||matchresult2!="6U"||matchresult3!="9s"||matchresult4!="6U")
   {
       print("${matchresult1}+${matchresult2}+${matchresult3}+${matchresult4}\n")
       return 1
   }
   print("success\n")
   return 0
}