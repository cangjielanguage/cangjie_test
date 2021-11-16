// ERRCHECK: %compiler %stdx_cmp_opt %f -o %output
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan-not 'return' is not allowed here
// ASSERT: regex-auto type argument's number does not match type parameter's number

from std import collection.*
func test() {
    var x : HashMap<Int64> // type here
    x = return // means bottom is HashMap<Int64> type`s child type.
}

func main(): Int64 {
    test()
    return 0
}
