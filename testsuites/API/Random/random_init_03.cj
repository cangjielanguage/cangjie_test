// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import util.*
func main()
{
    var r1=Random()
    var r2=Random()
    var n:UInt64=200
    var count:UInt64=0
    for (i in 0..n)
    {
        if(r1.nextInt8()!=r2.nextInt8())
        {
             count+=1
        }
    }
    if(count==0)
    {
        return 1
    }
    print("success\n")
    return 0
}