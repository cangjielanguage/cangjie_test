// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="a6Ud879sd4j56u"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var result1=Matcher(regex1,matchString).find(0).getOrThrow().matchStr()
   var result2=Matcher(regex2,matchString).find(1).getOrThrow().matchStr()
   var result3=regex2.matcher(matchString).find(12).getOrThrow().matchStr()

   if(result1!="9s"||result2!="6U"||result3!="6u")
   {
       print("${result1}+${result2}+${result3}+${result3}\n")
       return 1
   }
   try{
      var result4=regex1.matcher(matchString).find(13).getOrThrow().matchStr()
   }catch(e:NoneValueException){
      return 0
   }
   return 2
}