// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    //11111111 1111111 11111111 1111111
    var buf1=Array<UInt8>([255,255,255,255])
    var ipmask1=IPMask(buf1)
    var (bit_1,bit_all1)=ipmask1.size()
    if(bit_1!=32||bit_all1!=32)
    {
        print("buf1+${bit_1}+${bit_all1}\n")
        return 1
    }

    //00000000 00000000 00000000 00000000
    var buf3=Array<UInt8>([0,0,0,0])
    var ipmask3=IPMask(buf3)
    var (bit_3,bit_all3)=ipmask3.size()
    if(bit_3!=0||bit_all3!=32)
    {
        print("buf3+${bit_3}+${bit_all3}\n")
        return 3
    }

    var buf4=Array<Array<UInt8>>([Array<UInt8>([255,0,255,255]),Array<UInt8>([255,255,0,255]),Array<UInt8>([128,128,128,128])])
    for (i in buf4){
        var ipmask4=IPMask(i)
        var (bit_one,bit_all)=ipmask4.size()
        if(bit_one!=0||bit_all!=0)
        {
            print("${i}+${bit_one}+${bit_all}\n")
            return 4
        }
    }

    var buf5=Array<UInt8>([128,0,0,0])
    var ipmask5=IPMask(buf5)
    var (bit_5,bit_all5)=ipmask5.size()
    if(bit_5!=1||bit_all5!=32)
    {
        print("buf5+${bit_5}+${bit_all5}\n")
        return 5
    }
    print("success\n")
    return 0
}


