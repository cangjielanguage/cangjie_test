// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan None1
// ASSERT: scan None2
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="gg6sgggg"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   try{
      var matchresult1=Matcher(regex1,matchString).replace("10m",-1)
   }catch(e:IndexOutOfBoundsException){
      print("None1\n")
   }
   try{
      var matchresult2=Matcher(regex2,matchString).replace("11m",-1)
   }catch(e:IndexOutOfBoundsException){
      print("None2\n")
   }
   print("success\n")
   return 0
}