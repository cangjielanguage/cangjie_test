// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    //11111111 1111111 11111111 1111111
    var buf1=Array<UInt8>([255,255,255])
    var ipmask1=IPMask(buf1)
    var (bit_1,bit_all1)=ipmask1.size()
    if(bit_1!=24||bit_all1!=24)
    {
        print("buf1+${bit_1}+${bit_all1}\n")
        return 1
    }
    //10000000 10000000 1000000 1000000
    var buf2=Array<UInt8>([128,128,128])
    var ipmask2=IPMask(buf2)
    var (bit_2,bit_all2)=ipmask2.size()
    if(bit_2!=0||bit_all2!=0)
    {
        print("buf2+${bit_2}+${bit_all2}\n")
        return 2
    }
    //00000000 00000000 00000000 00000000
    var buf3=Array<UInt8>([0,0,0])
    var ipmask3=IPMask(buf3)
    var (bit_3,bit_all3)=ipmask3.size()
    if(bit_3!=0||bit_all3!=24)
    {
        print("buf3+${bit_3}+${bit_all3}\n")
        return 3
    }    
    print("success\n")
    return 0
}


