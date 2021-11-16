// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="((ab)+?)([0-9]{2})"

   var matchString3="abab34"//regex1，regex2 can match
   var matchString1="dsdabab34234565323"//regex1，regex2  can match

   var regex1=Regex(regexString)
   var groupresult1=regex1.matches(matchString3).getOrThrow().matchPosition()
   var groupresult3=Matcher(regex1,matchString1).find().getOrThrow().matchPosition()
   var groupresult5=regex1.matcher(matchString1).find().getOrThrow().matchPosition()

   var regex2=Regex(regexString,2)
   var matchString2="dsdababAB34234565323"//regex2 only can match
   var groupresult2=regex2.matches(matchString3).getOrThrow().matchPosition()
   var groupresult4=Matcher(regex2,matchString2).find().getOrThrow().matchPosition()
   var groupresult6=regex2.matcher(matchString2).find().getOrThrow().matchPosition()

   if(groupresult1.start!=0||groupresult2.start!=0||groupresult3.start!=3||groupresult4.start!=3||groupresult5.start!=3||groupresult6.start!=3)
   {
       print("${groupresult1.start}+${groupresult2.start}+${groupresult3.start}+${groupresult4.start}+${groupresult5.start}+${groupresult6.start}\n")
       return 1
   }
   else if(groupresult1.end!=6||groupresult2.end!=6||groupresult3.end!=9||groupresult4.end!=11||groupresult5.end!=9||groupresult6.end!=11)
   {
       print("${groupresult1.end}+${groupresult2.end}+${groupresult3.end}+${groupresult4.end}+${groupresult5.end}+${groupresult6.end}\n")
       return 1
   }
   print("success\n")
   return 0
}