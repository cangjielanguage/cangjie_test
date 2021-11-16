// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1 | compare %f

from std import util.*
func main()
{
   var r=Random()
   var m=r.nextBool(5) // EXPECTED: regex error.*?extra argument given for call with parameter list: ()
   return 0
}