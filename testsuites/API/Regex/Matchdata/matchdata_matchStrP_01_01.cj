// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="((ab)+?)([0-9]){2}"
   var matchString3="ababab23"
   var matchString4="ababAB23"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var groupresult11=regex1.matcher(matchString3).fullMatch().getOrThrow().matchStr(1)
   var groupresult12=regex1.matcher(matchString3).fullMatch().getOrThrow().matchStr(2)
   var groupresult13=regex1.matcher(matchString3).fullMatch().getOrThrow().matchStr(3)

   var groupresult21=regex2.matcher(matchString4).fullMatch().getOrThrow().matchStr(1)
   var groupresult22=regex2.matcher(matchString4).fullMatch().getOrThrow().matchStr(2)
   var groupresult23=regex2.matcher(matchString4).fullMatch().getOrThrow().matchStr(3)
    if(groupresult11!="ababab"||groupresult12!="ab"||groupresult13!="3")
    {
       print("part1\n")
       print("${groupresult11}+${groupresult12}+${groupresult13}\n")
       return 1
    }
    if(groupresult21!="ababAB"||groupresult22!="AB"||groupresult23!="3")
    {
       print("part2\n")
       print("${groupresult21}+${groupresult22}+${groupresult23}\n")
       return 1
    }

   print("success\n")
   return 0
}