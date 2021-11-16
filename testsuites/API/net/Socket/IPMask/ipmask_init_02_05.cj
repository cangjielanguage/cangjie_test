// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    var ipmask1=IPMask(127,128)
    var (bit_1,bit_all1)=ipmask1.size()
    if(bit_1!=127||bit_all1!=128)
    {
        print("buf1+${bit_1}+${bit_all1}\n")
        return 1
    }
    print("success\n")
    return 0
}


