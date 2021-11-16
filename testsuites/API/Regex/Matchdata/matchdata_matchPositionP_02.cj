// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="((ab)+?)([0-9]){2}"
   var matchString="abab34"

   var regex1=Regex(regexString)
   var groupresult3=regex1.matcher(matchString).fullMatch().getOrThrow().matchPosition(2)
   var groupresult5=Matcher(regex1,matchString).fullMatch().getOrThrow().matchPosition(3)

   var regex2=Regex(regexString,2)
   var groupresult4=regex2.matcher(matchString).fullMatch().getOrThrow().matchPosition(2)
   var groupresult6=Matcher(regex2,matchString).fullMatch().getOrThrow().matchPosition(3)
   //(ab)+?
   if(groupresult3.start!=2||groupresult3.end!=4||groupresult4.start!=2||groupresult4.end!=4)
   {
       print("part2\n")
       print("${groupresult3.start}+${groupresult3.end}+${groupresult4.start}+${groupresult4.end}\n")
       return 1
   }
   //([0-9]){2}
   else if(groupresult5.start!=5||groupresult5.end!=6||groupresult6.start!=5||groupresult6.end!=6)
   {
       print("part3\n")
       print("${groupresult5.start}+${groupresult6.end}+${groupresult6.start}+${groupresult6.end}\n")
       return 1
   }
   print("success\n")
   return 0
}