// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
    var regexString="[0-9][a-z]"
    var matchString="9sd"

    var regex1=Regex(regexString)
    var matchDatalist1=Matcher(regex1,matchString).findAll().getOrThrow()
    var matchDatalist3=regex1.matcher(matchString).findAll().getOrThrow()

    var regex2=Regex(regexString,2)
    var matchDatalist2=Matcher(regex2,matchString).findAll().getOrThrow()
    var matchDatalist4=regex2.matcher(matchString).findAll().getOrThrow()

    if(matchDatalist1[0].matchStr()!="9s"||matchDatalist1.size()!=1)
   {
       print("${matchDatalist1[0].matchStr()}+${matchDatalist1.size()}\n")
       return 1
   }
   else if(matchDatalist2[0].matchStr()!="9s"||matchDatalist2.size()!=1)
   {
        print("${matchDatalist2[0].matchStr()}+${matchDatalist2.size()}\n")
       return 2
   }
   else if(matchDatalist3[0].matchStr()!="9s"||matchDatalist3.size()!=1)
   {
       print("${matchDatalist3[0].matchStr()}+${matchDatalist3.size()}\n")
       return 3
   }
   else if(matchDatalist4[0].matchStr()!="9s"||matchDatalist4.size()!=1)
   {
        print("${matchDatalist4[0].matchStr()}+${matchDatalist4.size()}\n")
       return 4
   }
   print("success\n")
   return 0
}