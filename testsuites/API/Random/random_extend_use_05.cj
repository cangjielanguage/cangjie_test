// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import util.*
from std import collection.*
func main()
{
    var n=Random()
    var n1=Random()
    var n2=Random()
    var tuple=(n,n1,n2)
    print("success\n")
    return 0
}
