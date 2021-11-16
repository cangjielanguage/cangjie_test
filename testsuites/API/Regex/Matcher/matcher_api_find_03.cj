// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan None1
// ASSERT: scan None2
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
   try{
      var result21=matcher1.find().getOrThrow().matchStr()
   }catch(e:NoneValueException){
      print("None1\n")
   }
   var regex2=Regex(regexString,2)
   var matcher2=Matcher(regex2,matchString)
   var result3=matcher2.find().getOrThrow().matchStr()
   var result4=matcher2.find().getOrThrow().matchStr()
   var result5=matcher2.find().getOrThrow().matchStr()
   var result6=matcher2.find().getOrThrow().matchStr()
   try{
      var result61=matcher2.find().getOrThrow().matchStr()
   }catch(e:NoneValueException){
      print("None2\n")
   }
   print("success\n")
   return 0
}