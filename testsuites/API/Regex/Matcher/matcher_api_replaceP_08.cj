// EXEC-PIPE-1: %compiler %stdx_cmp_opt   %f -o %output 2>&1 | compare %f

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="a6Ud879sd4j5Uu"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var result1=regex1.matcher(matchString).replace("10m",-9223372036854775809)//EXPECTED: regex error.*?the number '-9223372036854775809' exceeds the value range of type 'Int64'
   var result2=regex2.matcher(matchString).replace("10m",9223372036854775808)//EXPECTED: regex error.*?the number '9223372036854775808' exceeds the value range of type 'Int64'

   print("success\n")
   return 0
}