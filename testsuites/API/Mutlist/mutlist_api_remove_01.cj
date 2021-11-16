// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:Buffer<String> = Buffer<String>(str)

func main(): Int64 {
    r1.remove(0)
    if ( r1[0]== "a" ){
        return 1
    }
    return 0
}
