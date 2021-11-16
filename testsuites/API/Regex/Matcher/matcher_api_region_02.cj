// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="a6U8Sd8f7M9sd4j5Uu"
   var resetString="rty"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var matcher1=Matcher(regex1,matchString)//1.Initialization
   var change1=matcher1.resetString(resetString)//2.reset String
   var region1=matcher1.region()//3.current region
    if(region1.start!=0||region1.end!=resetString.size())
    {
        print("Part1\n")
        print("${region1.start}+${region1.end}\n")
        return 1
    }
   print("success\n")
   return 0
}