// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="a6Ud879sd4j5Uu"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var matcher1=regex1.matcher(matchString)
   var matcher2=regex2.matcher(matchString)
   var result1=matcher1.find(1).getOrThrow().matchStr()
   var result2=matcher1.find(1).getOrThrow().matchStr()
   if(result1!="9s"||result2!="9s")
   {
       print("Part1+${result1}+${result2}\n")
       return 1
   }
   var result3=matcher2.find(1).getOrThrow().matchStr()
   var result4=matcher2.find(1).getOrThrow().matchStr()
   var result5=matcher2.find(1).getOrThrow().matchStr()
   var result6=matcher2.find(1).getOrThrow().matchStr()
   if(result3!="6U"||result4!="6U"||result5!="6U"||result6!="6U" )
   {
       print("Part2+${result3}+${result4}+${result5}+${result6}\n")
   }
   print("success\n")
   return 0
}