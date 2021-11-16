// EXEC: %compiler %stdx_cmp_opt %f -o %output

from std import collection.*
func main(): Int64 {
    var MyTuple = (HashMap<Int64,String>([(1,"1")]),HashSet<Int64>())
    return 0
}