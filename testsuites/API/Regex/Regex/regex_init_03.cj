// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan NoneValueException1
// ASSERT: scan NoneValueException2
// ASSERT: scan NoneValueException3
// ASSERT: scan NoneValueException4
// ASSERT: scan NoneValueException5
// ASSERT: scan NoneValueException6
// ASSERT: scan success

//DTS2021090812793
from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="8S"
   var regex1=Regex(regexString,1)
   var regex2=Regex(regexString,-1)
   var regex3=Regex(regexString,78)
   var regex4=Regex(regexString,0)
   var regex5=Regex(regexString,9223372036854775807)
   var regex6=Regex(regexString,-9223372036854775808)

   try{
      var matchresult1=regex1.matches(matchString).getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("NoneValueException1\n")
   }
   try{
      var matchresult2=regex2.matches(matchString).getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("NoneValueException2\n")
   }
   try{
      var matchresult3=regex3.matches(matchString).getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("NoneValueException3\n")
   }
   try{
      var matchresult4=regex4.matches(matchString).getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("NoneValueException4\n")
   }
   try{
      var matchresult5=regex5.matches(matchString).getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("NoneValueException5\n")
   }
   try{
     var matchresult6=regex6.matches(matchString).getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("NoneValueException6\n")
   }

   print("success\n")
   return 0
}