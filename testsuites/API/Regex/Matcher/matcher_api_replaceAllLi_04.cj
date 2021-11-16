// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
    var regexString="[0-9][a-z]"
    var matchString="dfsfhgfurtyr"
    var replaceString="ddd"
    var limit1=-1  //limit<0
    var limit2=5  //limit>0
    var limit3=-9223372036854775808  //limit为Int64最小值
    var limit4=9223372036854775807  //limit为Int64最大值
    var regex1=Regex(regexString)
    var regex2=Regex(regexString,2)
    var matchDatalist1=Matcher(regex1,matchString).replaceAll(replaceString,limit1)
    var matchDatalist2=Matcher(regex2,matchString).replaceAll(replaceString,limit1)
    var matchDatalist3=regex1.matcher(matchString).replaceAll(replaceString,limit1)
    var matchDatalist4=regex2.matcher(matchString).replaceAll(replaceString,limit1)

   if(matchDatalist1!=matchString||matchDatalist2!=matchString||matchDatalist3!=matchString||matchDatalist4!=matchString)
   {
       print("${matchDatalist1}+${matchDatalist2}+${matchDatalist3}+${matchDatalist4}\n")
       return 1
   }
    var matchDatalist5=Matcher(regex1,matchString).replaceAll(replaceString,limit2)
    var matchDatalist6=Matcher(regex2,matchString).replaceAll(replaceString,limit2)
    var matchDatalist7=regex1.matcher(matchString).replaceAll(replaceString,limit2)
    var matchDatalist8=regex2.matcher(matchString).replaceAll(replaceString,limit2)

   if(matchDatalist5!=matchString||matchDatalist6!=matchString||matchDatalist7!=matchString||matchDatalist8!=matchString)
   {
       print("${matchDatalist5}+${matchDatalist6}+${matchDatalist7}+${matchDatalist8}\n")
       return 2
   }
    var matchDatalist9=Matcher(regex1,matchString).replaceAll(replaceString,limit3)
    var matchDatalist10=Matcher(regex2,matchString).replaceAll(replaceString,limit3)
    var matchDatalist11=regex1.matcher(matchString).replaceAll(replaceString,limit3)
    var matchDatalist12=regex2.matcher(matchString).replaceAll(replaceString,limit3)

   if(matchDatalist9!=matchString||matchDatalist10!=matchString||matchDatalist11!=matchString||matchDatalist12!=matchString)
   {
       print("${matchDatalist9}+${matchDatalist10}+${matchDatalist11}+${matchDatalist12}\n")
       return 3
   }
    var matchDatalist13=Matcher(regex1,matchString).replaceAll(replaceString,limit4)
    var matchDatalist14=Matcher(regex2,matchString).replaceAll(replaceString,limit4)
    var matchDatalist15=regex1.matcher(matchString).replaceAll(replaceString,limit4)
    var matchDatalist16=regex2.matcher(matchString).replaceAll(replaceString,limit4)

   if(matchDatalist13!=matchString||matchDatalist14!=matchString||matchDatalist15!=matchString||matchDatalist16!=matchString)
   {
       print("${matchDatalist13}+${matchDatalist14}+${matchDatalist15}+${matchDatalist16}\n")
       return 4
   }
   print("success\n")
   return 0
}