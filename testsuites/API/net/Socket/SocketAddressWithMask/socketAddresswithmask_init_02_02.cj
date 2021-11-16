// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main(){
    var address=Array<String>(["www.baidu.com","dsdsfwfw"])
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
    var count:Int8=0
    for (i in 0..ipmask_all.size())
    {
        var ipmask=IPMask(ipmask_all[i])
        for (j in address){
            try{
                var socketAddressWithMask = SocketAddressWithMask(j,20202,ipmask)
            }catch(e:NoneValueException){
                 count+=1
            }
        }
    }
    if(count!=12)
    {
      return 1
    }
    print("success\n")
    return 0
}


