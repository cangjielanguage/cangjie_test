// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Foo1 {
    var dt: Int32 = 2
}

open class Foo2 {
    var dt: Int32 = 3
}

class Bar1 <: Foo1 {}
class Bar2 <: Foo2 {}

enum TimeUnit<T, V>
    where T <: Foo1; V <: Foo2 {  // EXPECTED: regex expected '{' here
    Year(T, V)
}

func main(): Int64 {
    let bar1: Bar1 = Bar1()
    let bar2: Bar2 = Bar2()
    let time = TimeUnit<Bar1, Bar2>.Year(bar1, bar2)
    return 0
}
