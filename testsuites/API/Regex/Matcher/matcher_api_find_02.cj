// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="a6Ud879sd4j5Uu"

   var regex1=Regex(regexString)
   var matcher1=Matcher(regex1,matchString)
   var result1=matcher1.find().getOrThrow().matchStr()
   var result2=matcher1.find().getOrThrow().matchStr()

   var regex2=Regex(regexString,2)
   var matcher2=Matcher(regex2,matchString)
   var result3=matcher2.find().getOrThrow().matchStr()
   var result4=matcher2.find().getOrThrow().matchStr()
   var result5=matcher2.find().getOrThrow().matchStr()
   var result6=matcher2.find().getOrThrow().matchStr()
   if(result1!="9s"||result2!="4j"||result3!="6U"||result4!="9s"||result5!="4j"||result6!="5U")
   {
       print("${result1}+${result2}+${result3}+${result4}+${result5}+${result6}\n")
       return 1
   }
   print("success\n")
   return 0
}