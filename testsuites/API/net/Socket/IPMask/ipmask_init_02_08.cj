// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan bits can only be 32 or 128
// ASSERT: scan success

from std import net.*
func main()
{
    try{
        var ipmask1=IPMask(0,-1)
    }catch(e:IllegalArgumentException){
        print("bits can only be 32 or 128\n")
    }
    print("success")
    return 0
}

