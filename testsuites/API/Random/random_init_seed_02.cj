// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import util.*
func main()
{
    var r=Random(UInt64(8))
    var temp:Int8=r.nextInt8()
    var n:UInt64=200
    var count:UInt64=0
    for (i in 0..n)
    {
        var new=r.nextInt8()
        if(temp!=new)
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