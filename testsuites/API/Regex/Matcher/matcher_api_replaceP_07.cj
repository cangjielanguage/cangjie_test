// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan IndexOutOfBoundsException1
// ASSERT: scan IndexOutOfBoundsException2
// ASSERT: scan IndexOutOfBoundsException3
// ASSERT: scan IndexOutOfBoundsException4
// ASSERT: scan success

//DTS2021091319865
from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="fdsfdfgd"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   try{
      var result1=regex1.matcher(matchString).replace("10m",matchString.size())
   }catch(e:IndexOutOfBoundsException){
      print("IndexOutOfBoundsException1\n")
   }
   try{
      var result2=regex2.matcher(matchString).replace("10m",matchString.size())
   }catch(e:IndexOutOfBoundsException){
      print("IndexOutOfBoundsException2\n")
   }
   try{
      var result3=regex1.matcher(matchString).replace("10m",matchString.size()+1)
   }catch(e:IndexOutOfBoundsException){
      print("IndexOutOfBoundsException3\n")
   }
   try{
      var result4=regex2.matcher(matchString).replace("10m",matchString.size()+1)
   }catch(e:IndexOutOfBoundsException){
      print("IndexOutOfBoundsException4\n")
   }
   print("success\n")
   return 0
}