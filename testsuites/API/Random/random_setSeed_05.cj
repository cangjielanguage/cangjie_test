// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import util.*

func main()
{
    var n:UInt64=200  //定义循环次数
    var m:UInt64=201
    var seed:UInt64=65
    var r1=Random(356)
    r1.setSeed(seed)
    var r2=Random(32)
    r2.setSeed(seed)
    var nr:Int8=0
    var mr:Int8=0
    for (i in 0..n)
    {
        nr=r1.nextInt8()
    }
    for (i in 0..m)
    {
        mr=r2.nextInt8()
    }
    if(mr == nr)
    {
        return 1
    }
    print("success\n")
    return 0
}