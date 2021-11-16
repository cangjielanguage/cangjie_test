// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan-not 'return' is not allowed here
// ASSERT: regex-auto generics type arguments do not match the constraint


func test<T>() {
    var x : Map<T,T> // type here
    x = return // means bottom is Map<T,T> type`s child type.
}

func main(): Int64 {
    test<Unit>()
    return 0
}
