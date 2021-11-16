// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan The value of one cannot exceed bits
// ASSERT: scan success

from std import net.*
func main()
{
    try{
        var ipmask1=IPMask(33,32)
    }catch(e:RuntimeException){
        print("The value of one cannot exceed bits.")
    }
    print("success\n")
    return 0
}


