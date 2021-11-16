// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var matchString="a6U8Sd8f7M9sd4j5Uu"
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var region1=Matcher(regex1,matchString).setRegion(0,0).region()
   var region2=Matcher(regex2,matchString).setRegion(3,4).region()
   var region3=regex1.matcher(matchString).setRegion(0,matchString.size()).region()
   var region4=regex2.matcher(matchString).setRegion(1,matchString.size()-1).region()

    if(region1.start!=0||region1.end!=0)
    {
        print("Part1\n")
        print("${region1.start}+${region1.end}\n")
        return 1
    }
    else if(region2.start!=3||region2.end!=4)
    {
        print("Part2\n")
        print("${region2.start}+${region2.end}\n")
        return 2
    }
    else if(region3.start!=0||region3.end!=matchString.size())
    {
        print("Part3\n")
        print("${region3.start}+${region3.end}\n")
        return 3
    }
    else if(region4.start!=1||region4.end!=matchString.size()-1)
    {
        print("Part4\n")
        print("${region4.start}+${region4.end}\n")
        return 4
    }
   print("success\n")
   return 0
}