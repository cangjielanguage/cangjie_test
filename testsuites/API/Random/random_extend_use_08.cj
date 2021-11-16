// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import util.*
from std import collection.*
func main()
{
    var n=Random().nextInt8()
    if( n is Int8)
    {
         print("success\n")
         return 0
    }
    return 1
}

