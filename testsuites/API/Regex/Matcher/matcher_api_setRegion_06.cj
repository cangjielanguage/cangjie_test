// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan IndexOutOfBoundsException1
// ASSERT: scan IndexOutOfBoundsException2
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="dadsadada"
   var regex1=Regex(regexString)
   try{
      var region1=Matcher(regex1,matchString).setRegion(0,9223372036854775807).region()
   }catch(e:IndexOutOfBoundsException){
      print("IndexOutOfBoundsException1\n")
   }
   try{
      var region1=Matcher(regex1,matchString).setRegion(9223372036854775807,9223372036854775807).region()
   }catch(e:IndexOutOfBoundsException){
      print("IndexOutOfBoundsException2\n")
   }
   print("success\n")
   return 0
}