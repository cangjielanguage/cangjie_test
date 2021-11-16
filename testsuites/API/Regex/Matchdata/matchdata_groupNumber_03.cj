// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
    var regexString="(((((a))))b+?)([0-9]{2})"
    var matchString="abb34"

    var regex1=Regex(regexString)
    var groupresult1=regex1.matches(matchString).getOrThrow().groupNumber()
    var groupresult2=regex1.matcher(matchString).find().getOrThrow().groupNumber()

    var regex2=Regex(regexString,2)
    var groupresult3=regex2.matches(matchString).getOrThrow().groupNumber()
    var groupresult4=regex2.matcher(matchString).find().getOrThrow().groupNumber()
   if(groupresult1!=6||groupresult2!=6)
   {
       print("step1+${groupresult1}+${groupresult2}\n")
       return 1
   }
   else if(groupresult3!=6||groupresult4!=6)
   {
       print("step2+${groupresult3}+${groupresult4}\n")
       return 1
   }
   print("success\n")
   return 0
}