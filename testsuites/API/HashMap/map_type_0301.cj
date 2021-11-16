// EXEC: %compiler %stdx_cmp_opt  %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
from std import collection.*
func main(): Int64 {
    var map02 =HashMap<Bool,Int64>([(true,2),(false,5)])
    var map04 :HashMap<Bool,Int64> = HashMap<Bool,Int64>(map02)
    if ( map04[false] != 5){
        return 1
    }
    print("${map04[false]}\n")
    return 0
}
