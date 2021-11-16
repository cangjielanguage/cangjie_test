// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    var ipmask1=IPMask(255,128,0,0)
    var (bit_1,bit_all1)=ipmask1.size()
    if(bit_1!=9||bit_all1!=32)
    {
        print("buf1+${bit_1}+${bit_all1}\n")
        return 1
    }
    var ipmask2=IPMask(255,255,255,255)
    var (bit_2,bit_all2)=ipmask2.size()
    if(bit_2!=32||bit_all2!=32)
    {
        print("buf2+${bit_2}+${bit_all2}\n")
        return 2
    }
    print("success\n")
    return 0
}


