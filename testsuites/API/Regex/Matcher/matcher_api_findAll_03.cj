// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan None1
// ASSERT: scan None2
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="fdsfdfgd"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var matcher1=Matcher(regex1,matchString)
   var matcher2=Matcher(regex2,matchString)
   try{
      var result1=matcher1.findAll().getOrThrow()
   }catch(e:NoneValueException){
      print("None1\n")
   }
   try{
      var result3=matcher2.findAll().getOrThrow()
   }catch(e:NoneValueException){
      print("None2\n")
   }
   print("success\n")
   return 0
}