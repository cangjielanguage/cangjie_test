// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="((ab)+?)([0-9]{2})"
   var matchString="abab34"

   var regex1=Regex(regexString)
   var groupresult1=regex1.matches(matchString).getOrThrow().matchPosition(1)
   var groupresult3=regex1.matcher(matchString).fullMatch().getOrThrow().matchPosition(2)
   var groupresult5=Matcher(regex1,matchString).fullMatch().getOrThrow().matchPosition(3)
   var groupresult7=regex1.matches(matchString).getOrThrow().matchPosition(0)

   var regex2=Regex(regexString,2)
   var groupresult2=regex2.matches(matchString).getOrThrow().matchPosition(1)
   var groupresult4=regex2.matcher(matchString).fullMatch().getOrThrow().matchPosition(2)
   var groupresult6=Matcher(regex2,matchString).fullMatch().getOrThrow().matchPosition(3)
   var groupresult8=regex2.matches(matchString).getOrThrow().matchPosition(0)

   if(groupresult1.start!=0||groupresult2.end!=4||groupresult2.start!=0||groupresult2.end!=4)
   {
       print("part1\n")
       print("${groupresult1.start}+${groupresult1.end}+${groupresult2.start}+${groupresult2.end}\n")
       return 1
   }
   else if(groupresult3.start!=2||groupresult3.end!=4||groupresult4.start!=2||groupresult4.end!=4)
   {
       print("part2\n")
       print("${groupresult3.start}+${groupresult3.end}+${groupresult4.start}+${groupresult4.end}\n")
       return 1
   }
   else if(groupresult5.start!=4||groupresult5.end!=6||groupresult6.start!=4||groupresult6.end!=6)
   {
       print("part3\n")
       print("${groupresult5.start}+${groupresult6.end}+${groupresult6.start}+${groupresult6.end}\n")
       return 1
   }
   else if(groupresult7.start!=0||groupresult7.end!=6||groupresult8.start!=0||groupresult8.end!=6)
   {
       print("part3\n")
       print("${groupresult7.start}+${groupresult7.end}+${groupresult8.start}+${groupresult8.end}\n")
       return 1
   }
   print("success\n")
   return 0
}