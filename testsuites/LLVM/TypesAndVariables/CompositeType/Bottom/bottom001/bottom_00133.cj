// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expression of Nothing type cannot appear here currently



func test() {
    var x : Range<Int64> // type here
    x = return // means bottom is Range<Int64> type`s child type.
}

func main(): Int64 {
    test()
    return 0
}
