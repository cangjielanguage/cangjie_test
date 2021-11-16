// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func main(): Int64 {
    var r1:Buffer<Int64> = Buffer<Int64>([])
    r1.add(1)
    if(r1[0]!=1){
        return 1
    }
    return 0
}
