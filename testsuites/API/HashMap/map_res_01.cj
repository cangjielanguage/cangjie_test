// EXEC: %compiler %stdx_cmp_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
from std import collection.*
var r01 = HashMap<Int64,Int64>()
var r02:HashMap<Int64,Int64> = HashMap<Int64,Int64>([])
var r03 = HashMap<Int64,Int64>([(3,3)]) // <Int64,Int64>
var r04: HashMap<Int64,Int8> =HashMap<Int64,Int8>([(4,4)]) // <Int64,Int8>

func main(){
   return 0
}
