// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
    var regexString="[0-9][a-z]"
    var matchString="a6Ud879sd4j5Uu"
    var replaceString="ddd"
    var limit1=1
    var limit2=2
    var matchresult1="a6Ud87dddd4j5Uu"
    var matchresult2="adddd87dddd4j5Uu"
    var regex1=Regex(regexString)
    var regex2=Regex(regexString,2)
    var matchDatalist1=Matcher(regex1,matchString).replaceAll(replaceString,limit1)
    var matchDatalist2=Matcher(regex2,matchString).replaceAll(replaceString,limit2)
    var matchDatalist3=regex1.matcher(matchString).replaceAll(replaceString,limit1)
    var matchDatalist4=regex2.matcher(matchString).replaceAll(replaceString,limit2)

   if(matchDatalist1!=matchresult1||matchDatalist2!=matchresult2||matchDatalist3!=matchresult1||matchDatalist4!=matchresult2)
   {
       print("${matchDatalist1}+${matchDatalist2}+${matchDatalist3}+${matchDatalist4}\n")
       return 1
   }
   print("success\n")
   return 0
}