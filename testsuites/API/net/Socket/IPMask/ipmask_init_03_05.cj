// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main()
{
    var ipmask1=IPMask(255,127,0,0)
    var (bit_1,bit_all1)=ipmask1.size()
    if(bit_1!=0||bit_all1!=0)
    {
        print("buf1+${bit_1}+${bit_all1}\n")
        return 1
    }

    var ipmask2=IPMask(127,127,0,0)
    var (bit_2,bit_all2)=ipmask2.size()
    if(bit_2!=0||bit_all2!=0)
    {
        print("buf2+${bit_2}+${bit_all2}\n")
        return 2
    }

    var ipmask3=IPMask(0,0,0,0)
    var (bit_3,bit_all3)=ipmask3.size()
    if(bit_3!=0||bit_all3!=32)
    {
        print("buf3+${bit_3}+${bit_all3}\n")
        return 3
    }
    return 0
}


