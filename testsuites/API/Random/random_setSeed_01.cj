// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import util.*

func main()
{
    var r=Random(UInt64(65))
    var r1=Random()
    var seed1:UInt64=18446744073709551615
    var seed2:UInt64=1
    r.setSeed(seed1)
    r.setSeed(seed2)
    r1.setSeed(seed1)
    r1.setSeed(seed2)
    print("success\n")
    return 0
}