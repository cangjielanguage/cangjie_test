// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Foo {
    var dt: Int32 = 2
}

class Bar <: Foo {}

enum TimeUnit<T> where T < Foo {  // EXPECTED: regex expected '<:'
    Year(T)
}

func main(): Int64 {
    let bar: Bar= Bar()
    let time = TimeUnit.Year(bar)
    return 0
}
