// EXEC: %compiler %stdx_cmp_opt %f -o %output
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

from std import collection.*
func main(): Int64 {
    var MyTuple = (HashSet<Int64>([1]),HashSet<Int64>())
    return 0
}
