// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace



func test<T>(i: T): Int64 {
    var a : List<List<T>> = [[i]]
    var b : List<List<T>> = List<List<T>>([[i]].toArray())
    var c : List<List<T>> = List<List<T>>(Array<List<>(1)
}