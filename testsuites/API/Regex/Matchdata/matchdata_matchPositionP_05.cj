// EXEC-PIPE-1: %compiler %stdx_cmp_opt   %f -o %output 2>&1 | compare %f

from std import regex.*
func main()
{
   var regexString="((ab)+?)([0-9]{2})"
   var matchString="abab34"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var groupresult1=regex1.matches(matchString).getOrThrow().matchPosition(9223372036854775808)//EXPECTED: regex error.*?the number '9223372036854775808' exceeds the value range of type 'Int64'
   var groupresult2=regex2.matches(matchString).getOrThrow().matchPosition(-9223372036854775809)//EXPECTED: regex error.*?the number '-9223372036854775809' exceeds the value range of type 'Int64'


   return 0
}