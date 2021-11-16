// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(){
    var ipmask=IPMask(Array<UInt8>([127,0,0,1]))
    try{
        var socketAddressWithMask = SocketAddressWithMask("fffff:fffff:fffff:fffff:fffff:fffff:fffff:fffff",20202,ipmask)
    }catch(e:NoneValueException){
        return 0
    }
    return 1
}


