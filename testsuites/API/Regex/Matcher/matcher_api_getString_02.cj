// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var regex1=Regex(regexString)
   var matcher1=Matcher(regex1,regexString)  // 1. Initialization
   var str1=matcher1.getString()//2.reset String to same String
    if(str1!=regexString)
    {
        print("${str1}\n")
        return 1
    }
   print("success\n")
   return 0
}