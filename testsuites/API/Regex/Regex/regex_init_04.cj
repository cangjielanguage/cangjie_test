// EXEC-PIPE-1: %compiler %stdx_cmp_opt   %f -o %output 2>&1 | compare %f

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="8S"
   var regex5=Regex(regexString,9223372036854775808) //EXPECTED: regex error.*?the number '9223372036854775808' exceeds the value range of type 'Int64'
   var regex6=Regex(regexString,-9223372036854775809)//EXPECTED: regex error.*?the number '-9223372036854775809' exceeds the value range of type 'Int64'
   return 0
}