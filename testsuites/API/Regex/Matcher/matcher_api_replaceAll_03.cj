// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
    var regexString="[0-9][a-z]"
    var matchString="fdsfdfgd"
    var replaceString="ddd"
    var regex1=Regex(regexString)
    var regex2=Regex(regexString,2)
    var matchDatalist1=Matcher(regex1,matchString).replaceAll(replaceString)
    var matchDatalist2=Matcher(regex2,matchString).replaceAll(replaceString)
    var matchDatalist3=regex1.matcher(matchString).replaceAll(replaceString)
    var matchDatalist4=regex2.matcher(matchString).replaceAll(replaceString)

   if(matchDatalist1!="fdsfdfgd"||matchDatalist2!="fdsfdfgd"||matchDatalist3!="fdsfdfgd"||matchDatalist4!="fdsfdfgd")
   {                   
       print("${matchDatalist1}+${matchDatalist2}+${matchDatalist3}+${matchDatalist4}\n")
       return 1
   }
   print("success\n")
   return 0
}