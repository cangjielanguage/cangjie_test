// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="ad879sd4j5Uu"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var casevalue=Regex.CASE_INSENSITIVE
   var multvalue=Regex.MULTILINE
   if(casevalue!=0x02||multvalue!=0x08)
   {
       print("${casevalue}+${multvalue}\n")
       return 1
   }
   print("success\n")
   return 0
}