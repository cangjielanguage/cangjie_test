// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import regex.*
func main()
{
    var regexString=""
    var matchString="ggggg7fgggg"
    var matchStrings="7ffr4h5gks0rjk3h"
    var regex1=Regex(regexString)
    var matchDatalist1=Matcher(regex1,matchString).split(0)//limit=0
    var matchDatalist2=regex1.matcher(matchString).split(0)
    var matchDatalist3=Matcher(regex1,matchStrings).split(0)
    var matchDatalist4=regex1.matcher(matchStrings).split(0)
    if(matchDatalist1.size()!=11||matchDatalist2.size()!=11||matchDatalist3.size()!=16||matchDatalist4.size()!=16)
    {
        return 1
    }
   return 0
}