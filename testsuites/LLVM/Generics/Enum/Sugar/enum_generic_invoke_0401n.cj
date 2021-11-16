// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Foo{
    var dt: Int32 = 1
}

class Bar <: Foo {
    var dt: Int32 = 2
}


enum TimeUnit<T> {
    Year(T) | Month(T)
}

var foo: Foo = Foo()
var bar: Bar = Bar()

var time = TimeUnit<Bar>.Year(foo) // EXPECTED: regex no matching enum constructor 'Year' for given arguments
var res1: Int32 = match (time) {
    case Year(x) => x.dt
    case Month(x) => 9
}

func run(): Int64 {
    if (res1 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
