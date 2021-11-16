// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan IndexOutOfBoundsException1
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="a6U8Sd8f7M9sd4j5Uu"
   var regex1=Regex(regexString)
   try{
      var region1=Matcher(regex1,matchString).setRegion(-1,0).region()
   }catch(e:IndexOutOfBoundsException){
      print("IndexOutOfBoundsException1\n")
   }
   try{
      var region1=Matcher(regex1,matchString).setRegion(-9223372036854775808,0).region()
   }catch(e:IndexOutOfBoundsException){
      print("IndexOutOfBoundsException2\n")
   }
   print("success\n")
   return 0
}