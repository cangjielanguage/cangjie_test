// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString1="5u"
   var matchString2="5U"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var matchresult1=Matcher(regex1,matchString1).fullMatch().getOrThrow().matchStr()
   var matchresult2=Matcher(regex2,matchString2).fullMatch().getOrThrow().matchStr()
   var matchresult3=regex1.matcher(matchString1).fullMatch().getOrThrow().matchStr()
   var matchresult4=regex2.matcher(matchString2).fullMatch().getOrThrow().matchStr()

   if(matchresult1!="5u"||matchresult2!="5U"||matchresult3!="5u"||matchresult4!="5U")
   {
       print("${matchresult1}+${matchresult2}+${matchresult3}+${matchresult4}\n")
       return 1
   }
   print("success\n")
   return 0
}