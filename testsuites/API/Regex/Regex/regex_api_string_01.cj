// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var matchresult1=regex1.string()
   var matchresult2=regex2.string()
   if(matchresult1!="[0-9][a-z]"||matchresult2!="[0-9][a-z]")
   {
       print("${matchresult1}+${matchresult2}\n")
       return 1
   }
   print("success\n")
   return 0
}