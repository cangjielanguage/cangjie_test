// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="((ab)+?)([0-9]{2})"
   var matchString1="dsdabab34234565323dsdabab34234565323"

   var regex1=Regex(regexString)
   var matcher1=regex1.matcher(matchString1)
   var find1=matcher1.find().getOrThrow().matchPosition(1)
   var find2=matcher1.find().getOrThrow().matchPosition(1)
    if((find1.start!=3)||(find1.end!=7))
    {
        print("part1\n")
        print("${find1.start}+${find1.end}\n")
        return 1
    }
    else if(find2.start!=21||find2.end!=25)
    {
        print("part2\n")
        print("${find2.start}+${find2.end}\n")
        return 2
    }
   print("success\n")
   return 0
}