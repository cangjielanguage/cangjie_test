// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="ad879sd4j5Uu"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var matchresult1=regex1.matcher(matchString).findAll()
   var matchresult2=regex2.matcher(matchString).findAll()
   var matchDatalist1=matchresult1.getOrThrow()
   var matchDatalist2=matchresult2.getOrThrow()
   if(matchDatalist1[0].matchStr()!="9s"||matchDatalist1[1].matchStr()!="4j"||matchDatalist1.size()!=2)
   {
       return 1
   }
   else if(matchDatalist2[0].matchStr()!="9s"||matchDatalist2[1].matchStr()!="4j"||matchDatalist2[2].matchStr()!="5U"||matchDatalist2.size()!=3)
   {
       return 2
   }
   print("success\n")
   return 0
}