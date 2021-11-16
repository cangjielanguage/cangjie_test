// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func main(): Int64 {
    var a : HashMap<Int32, Int32> = HashMap<Int32,Int32>([(1,1)])
    let myArray : Array<HashMap<Int32, Int32>> = @{a,HashMap<Int32,Int32>([(1,1)])}
    let youArray : Array<HashMap<Int32, Int32>> = @{a,HashMap<Int32,Int32>([(1,0)])}
    return 0
}
