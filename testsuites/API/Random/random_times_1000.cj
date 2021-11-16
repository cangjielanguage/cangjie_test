// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success
//brief:Random_调用次数1000
//detail:Random_验证重复调用次数
from std import util.*
func main()
{
    var r=Random()
    for (i in 0..1000)
    {
        r.nextBool()
        r.nextUInt8()
        r.nextUInt16()
        r.nextUInt32()
        r.nextUInt64()
        r.nextInt8()
        r.nextInt16()
        r.nextInt32()
        r.nextInt64()
        r.nextFloat16()
        r.nextFloat32()
        r.nextFloat64()
        r.nextGaussianFloat16()
        r.nextGaussianFloat32()
        r.nextGaussianFloat64()
    }
    print("success\n")
    return 0
}

