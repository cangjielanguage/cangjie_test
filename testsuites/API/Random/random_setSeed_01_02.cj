// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import util.*

func main()
{
    var list:List<UInt64>=List<UInt64>([0,1,45,18446744073709551614,18446744073709551615])
    var r=Random(UInt64(65))
    var r1=Random()
    for (i in list)
    {
       r.setSeed(i)
       r1.setSeed(i)
    }
    print("success\n")
    return 0
}