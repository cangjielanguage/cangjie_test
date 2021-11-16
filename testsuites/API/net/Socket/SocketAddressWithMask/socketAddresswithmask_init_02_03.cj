// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan can't change uint8 array

from std import net.*
func main(){
    var ipmask=IPMask(Array<UInt8>([127,0,0,1]))
    try{
        var socketAddressWithMask = SocketAddressWithMask("192.-1.0.1",20202,ipmask)
    }catch(e:NoneValueException){
        print("can't change uint8 array\n")
    }
    return 0
}


