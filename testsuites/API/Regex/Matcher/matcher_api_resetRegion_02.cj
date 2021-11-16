// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="a6U8Sd8f7M9sd4j5Uu"
   var regex1=Regex(regexString)
   var matcher1=Matcher(regex1,matchString)  // 1. Initialization
   var change1=matcher1.setRegion(3,7)//2.set region
   var region1=matcher1.resetRegion().region() //3.current region
    if(region1.start!=0||region1.end!=matchString.size())
    {
        print("${region1.start}+${region1.end}\n")
        return 1
    }
   print("success\n")
   return 0
}