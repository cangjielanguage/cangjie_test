// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    var ipmask1=IPMask(255,0,0,0)
    //SocketAddress:func mask(mask: IPMask): SocketAddressWithMask
    var socketAddress1=SocketAddress("127.0.0.1",20202)
    var socketAddressWithMask1=SocketAddressWithMask(socketAddress1,ipmask1)
    var socketAddressWithMaskString1=socketAddressWithMask1.mask().toString()
    if(socketAddressWithMaskString1!="127.0.0.0/8:20202")
    {
         print("${socketAddressWithMaskString1}\n")
         return 1
    }

    var ipmask2=IPMask(255,255,0,0)
    var socketAddress2=SocketAddress("127.0.0.1",20202)
    var socketAddressWithMask2=SocketAddressWithMask(socketAddress2,ipmask2)
    var socketAddressWithMaskString2=socketAddressWithMask2.mask().toString()
    if(socketAddressWithMaskString2!="127.0.0.0/16:20202")
    {
         print("${socketAddressWithMaskString2}\n")
         return 2
    }

    var ipmask3=IPMask(255,255,255,0)
    var socketAddress3=SocketAddress("127.0.0.1",20202)
    var socketAddressWithMask3=SocketAddressWithMask(socketAddress3,ipmask3)
    var socketAddressWithMaskString3=socketAddressWithMask3.mask().toString()
    if(socketAddressWithMaskString3!="127.0.0.0/24:20202")
    {
         print("${socketAddressWithMaskString3}\n")
         return 3
    }

    var ipmask4=IPMask(255,128,0,0)
    var socketAddress4=SocketAddress("127.0.0.1",20202)
    var socketAddressWithMask4=SocketAddressWithMask(socketAddress4,ipmask4)
    var socketAddressWithMaskString4=socketAddressWithMask4.mask().toString()
    if(socketAddressWithMaskString4!="127.0.0.0/9:20202")
    {
         print("${socketAddressWithMaskString4}\n")
         return 4
    }
    print("success\n")
    return 0
}


