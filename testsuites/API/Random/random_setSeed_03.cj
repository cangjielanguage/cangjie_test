// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import util.*

func main()
{
    var count:UInt64=0 //记录结果正确次数
    var n:UInt64=200  //定义循环次数
    var seed:UInt64=65
    var r1=Random()
    r1.setSeed(seed)
    var r2=Random()
    r2.setSeed(seed)
    for (i in 0..n)
    {
        if(r1.nextInt8()==r2.nextInt8())
        {
             count+=1
        }
    }
    if(count!=n)
    {
        return 1
    }
    print("success\n")
    return 0
}