// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan generics type arguments do not match the constraint



func test<T>() {
    var x : Range<T> // type here
    x = return // means bottom is Range<T> type`s child type.
}

func main(): Int64 {
    test<Unit>()
    return 0
}
