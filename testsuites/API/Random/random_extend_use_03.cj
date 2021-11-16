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
    var buf:Buffer<Random>=Buffer<Random>([n,n1,n2])
    if(buf.size()!=3)
    {
         return 1
    }
    print("success\n")
    return 0

}
