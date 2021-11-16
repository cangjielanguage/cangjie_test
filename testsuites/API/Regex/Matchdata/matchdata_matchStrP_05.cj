// EXEC-PIPE-1: %compiler %stdx_cmp_opt   %f -o %output 2>&1 | compare %f

from std import regex.*
func main()
{
   var regexString="((ab)+?)([0-9]){2}"
   var matchString3="ababab23"
   var regex1=Regex(regexString)
   var groupresult1=regex1.matcher(matchString3).fullMatch().getOrThrow().matchStr(9223372036854775808) //EXPECTED: regex error.*?the number '9223372036854775808' exceeds the value range of type 'Int64'
   var groupresult1=regex1.matcher(matchString3).fullMatch().getOrThrow().matchStr(-9223372036854775809) //EXPECTED: regex error.*?the number '-9223372036854775809' exceeds the value range of type 'Int64'
   print("success\n")
   return 0
}