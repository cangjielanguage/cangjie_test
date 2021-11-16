// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="((ab)+?)([0-9]){2}"
   var matchString3="ababab23"
   var matchString4="abABab23"

   var regex1=Regex(regexString)
   var groupresult1=regex1.matcher(matchString3).fullMatch().getOrThrow().matchStr(0)

   var regex2=Regex(regexString,2)
   var groupresult2=regex2.matcher(matchString4).fullMatch().getOrThrow().matchStr(0)
   if(groupresult1!=matchString3||groupresult2!=matchString4)
   {
       print("part1\n")
       print("${groupresult1}+${groupresult2}\n")
       return 1
   }
   print("success\n")
   return 0
}