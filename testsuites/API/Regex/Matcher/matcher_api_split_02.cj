// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

//DTS2021091411914
from std import regex.*
func main()
{
    var regexString="[0-9][a-z]"
    var matchString="ggggggggg"
    var regex1=Regex(regexString)
    var matchDatalist1=Matcher(regex1,matchString).split()
    var matchDatalist2=regex1.matcher(matchString).split()
    var result:Array<String>=Array<String>([matchString])
    if(matchDatalist1.size()!=1||matchDatalist2.size()!=1)
    {
         print("Part1\n")
         print("${matchDatalist1.size()}+${matchDatalist2.size()}\n")
         return 1
    }
    if(matchDatalist1[0]!=result[0])
    {
         print("Part2\n")
         print("${matchDatalist1[0]}\n")
         return 2
    }
    if(matchDatalist2[0]!=result[0])
    {
         print("Part3\n")
         print("${matchDatalist2[0]}\n")
         return 3
    }
   print("success\n")
   return 0
}