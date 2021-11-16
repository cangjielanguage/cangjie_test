// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9][a-z]"
   var resetStr=""
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var resetStr1=Matcher(regex1,resetStr).getString()
   var resetStr2=Matcher(regex2,resetStr).getString()
   var resetStr3=regex1.matcher(resetStr).getString()
   var resetStr4=regex2.matcher(resetStr).getString()

    if(resetStr1!=resetStr)
    {
        print("${resetStr1}\n")
        return 1
    }
    else if(resetStr2!=resetStr)
    {
        print("${resetStr2}\n")
        return 2
    }
    else if(resetStr3!=resetStr)
    {
        print("${resetStr3}\n")
        return 3
    }
    else if(resetStr4!=resetStr)
    {
        print("${resetStr4}\n")
        return 4
    }
   print("success\n")
   return 0
}