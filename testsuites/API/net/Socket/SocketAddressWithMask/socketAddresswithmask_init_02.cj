// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(){
    var address=Array<String>(["127.0.0.1"])
    var ipmask_all=Array<Array<UInt8>>([Array<UInt8>([255,0,0,0]),
                                   Array<UInt8>([255,255,0,0]),
                                   Array<UInt8>([255,255,255,0]),
                                   Array<UInt8>([255,128,0,0]),
                                   Array<UInt8>([255,128,1,0]),
                                   Array<UInt8>([255,255,255,1])])
    var result_socketAddressWithMask=Array<String>(["127.0.0.0/8:20202",
                                                    "127.0.0.0/16:20202",
                                                    "127.0.0.0/24:20202",
                                                    "127.0.0.0/9:20202",
                                                    "127.0.0.0/FF800100:20202",
                                                    "127.0.0.1/FFFFFF01:20202"])
     for (i in 0..ipmask_all.size())
     {
        for(j in 0..address.size())
        {
            var ipmask=IPMask(ipmask_all[i])
            var socketAddressWithMask = SocketAddressWithMask(address[j],20202,ipmask)
            var mask_result=socketAddressWithMask.mask().toString()
            if(mask_result!=result_socketAddressWithMask[i])
            {
                 return 1
            }
        }
     }
    return 0
}


