// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan IndexOutOfBoundsException1
// ASSERT: scan IndexOutOfBoundsException2
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="a6U8Sd8f7M9sd4j5Uu"
   var regex1=Regex(regexString)
   try{
      var region1=Matcher(regex1,matchString).setRegion(matchString.size()-1,matchString.size()+1).region()
   }catch(e:IndexOutOfBoundsException){
      print("IndexOutOfBoundsException1\n")
   }
   try{
      var region1=Matcher(regex1,matchString).setRegion(matchString.size()-1,matchString.size()+2).region()
   }catch(e:IndexOutOfBoundsException){
      print("IndexOutOfBoundsException2\n")
   }
   print("success\n")
   return 0
}