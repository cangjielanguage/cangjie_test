// EXEC-PIPE-1: %compiler %stdx_cmp_opt   %f -o %output 2>&1 | compare %f

from std import regex.*
func main()
{
   var matchString="sfdsfsf"
   var matchresult1=Matcher(matchString,matchString)  //EXPECTED: regex error.*?argument is mismatched with parameter type 'Class-Regex'
}