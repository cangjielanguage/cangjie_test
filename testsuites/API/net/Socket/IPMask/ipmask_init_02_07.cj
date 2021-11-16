// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan ones can only be in [0, bits]
// ASSERT: scan success

from std import net.*
func main()
{
    try{
        var ipmask1=IPMask(-1,32)
    }catch(e:IllegalArgumentException){
        print("ones can only be in [0, bits]\n")
    }
    print("success\n")
    return 0
}


