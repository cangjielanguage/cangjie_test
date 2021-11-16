// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Foo {
    var dt: Int32 = 2
}

class Bar <: Foo {}

enum TimeUnit<T>
    where V <: Foo {  // EXPECTED: regex  undeclared type name 'V'
    Year(T)
}

func main(): Int64 {
    let bar: Bar= Bar()
    let time = TimeUnit<Foo>.Year(bar)
    return 0
}
