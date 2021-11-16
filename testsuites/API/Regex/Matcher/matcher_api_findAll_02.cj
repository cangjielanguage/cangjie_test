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

    var matchDatalist1=Matcher(regex1,matchString).findAll().getOrThrow()
    var matchDatalist2=Matcher(regex2,matchString).findAll().getOrThrow()

    var matcher1=regex1.matcher(matchString)
    var find1=matcher1.find()
    var matchDatalist3=matcher1.findAll().getOrThrow()

    var matcher2=regex2.matcher(matchString)
    var find2=matcher2.find()
    var matchDatalist4=matcher2.findAll().getOrThrow()

    if(matchDatalist1[0].matchStr()!="9s"||matchDatalist1[1].matchStr()!="4j"||matchDatalist1.size()!=2)
   {
       print("${matchDatalist1[0].matchStr()}+${matchDatalist1[1].matchStr()}+${matchDatalist1.size()}\n")
       return 1
   }
   else if(matchDatalist2[0].matchStr()!="6U"||matchDatalist2[1].matchStr()!="9s"||matchDatalist2[2].matchStr()!="4j"||matchDatalist2[3].matchStr()!="5U"||matchDatalist2.size()!=4)
   {
        print("${matchDatalist2[0].matchStr()}+${matchDatalist2[1].matchStr()}+${matchDatalist2[2].matchStr()}+${matchDatalist2[3].matchStr()}+${matchDatalist2.size()}\n")
       return 2
   }
   else if(matchDatalist3[0].matchStr()!="9s"||matchDatalist3[1].matchStr()!="4j"||matchDatalist3.size()!=2)
   {
       print("${matchDatalist3[0].matchStr()}+${matchDatalist3[1].matchStr()}+${matchDatalist3.size()}\n")
       return 3
   }
   else if(matchDatalist4[0].matchStr()!="6U"||matchDatalist4[1].matchStr()!="9s"||matchDatalist4[2].matchStr()!="4j"||matchDatalist4[3].matchStr()!="5U"||matchDatalist4.size()!=4)
   {
        print("${matchDatalist4[0].matchStr()}+${matchDatalist4[1].matchStr()}+${matchDatalist4[2].matchStr()}+${matchDatalist4[3].matchStr()}+${matchDatalist4.size()}\n")
       return 4
   }
   print("success\n")
   return 0
}