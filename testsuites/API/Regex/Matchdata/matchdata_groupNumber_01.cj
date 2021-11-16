// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
    var regexString="(ab+?)([0-9]{2})"
    var matchString="abb34"
    var matchString1="dsabb43fdabb56abb78"

    var regex1=Regex(regexString)
    var groupresult1=regex1.matches(matchString).getOrThrow().groupNumber()
    var groupresult3=regex1.matcher(matchString1).find().getOrThrow().groupNumber()
    var groupresult4=regex1.matcher(matchString1).find().getOrThrow().groupNumber()

    var regex2=Regex(regexString,2)
    var groupresult2=regex2.matches(matchString).getOrThrow().groupNumber()
    var groupresult5=regex2.matcher(matchString1).find().getOrThrow().groupNumber()
    var groupresult6=regex2.matcher(matchString1).find().getOrThrow().groupNumber()
   if(groupresult1!=2||groupresult2!=2)
   {
       print("step1+${groupresult1}+${groupresult2}\n")
       return 1
   }
   else if(groupresult3!=2||groupresult4!=2)
   {
       print("step2+${groupresult3}+${groupresult4}\n")
       return 1
   }
   else if(groupresult5!=2||groupresult6!=2)
   {
       print("step3+${groupresult5}+${groupresult6}\n")
       return 1
   }
   print("success\n")
   return 0
}