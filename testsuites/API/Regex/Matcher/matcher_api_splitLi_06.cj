// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

//DTS2021091414345修改文档
from std import regex.*
func main()
{
    var regexString=""
    var matchString="ggggg7fgggg"
    var regex1=Regex(regexString)
    var matchDatalist1=Matcher(regex1,matchString).split(0)//limit=0
    var matchDatalist2=regex1.matcher(matchString).split(-1)//limit<0,Split into single characters
    var matchDatalist3=Matcher(regex1,matchString).split(2)//limit>0,Split into 2 strings

    if(matchDatalist1.size()!=11||matchDatalist2.size()!=11||matchDatalist3.size()!=2)
    {
        print("Part1\n")
        print("${matchDatalist1.size()}+${matchDatalist2.size()}+${matchDatalist3.size()}\n")
        return 1
    }

    for(i in 0..(matchString.size()-1))
    {
        if(matchDatalist1[i]!=matchString[i].toString())
        {
            print("Part2+${matchDatalist1[i]}\n")
            return 2
        }
    }

    for(i in 0..(matchString.size()-1))
    {
        if(matchDatalist2[i]!=matchString[i].toString())
        {
            print("Part3+${matchDatalist2[i]}\n")
            return 3
        }
    }
    if(matchDatalist3[0]!="g"||matchDatalist3[1]!="gggg7fgggg")
    {
            print("Part4+matchDatalist3[0]+${matchDatalist3[1]}\n")
            return 4
    }
    print("success\n")
   return 0
}