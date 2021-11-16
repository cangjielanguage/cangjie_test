// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="ad879sd4j5Uu"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var matchresult1=Matcher(regex1,matchString).findAll().getOrThrow()
   var matchresult2=Matcher(regex2,matchString).findAll().getOrThrow()
   if(matchresult1[0].matchStr()!="9s"||matchresult1[1].matchStr()!="4j"||matchresult1.size()!=2)
   {
       return 1
   }
   else if(matchresult2[0].matchStr()!="9s"||matchresult2[1].matchStr()!="4j"||matchresult2[2].matchStr()!="5U"||matchresult2.size()!=3)
   {
       return 2
   }
   print("success\n")
   return 0
}