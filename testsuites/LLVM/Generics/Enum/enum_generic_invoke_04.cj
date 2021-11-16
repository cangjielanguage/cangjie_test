// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo{
    var dt1: Int32 = 1
}

class Bar <: Foo {
    var dt: Int32 = 2
}


enum TimeUnit<T> {
    Year(T) | Month(T)
}

var foo: Foo = Bar()

var time = TimeUnit<Foo>.Year(foo)
var res1: Int32 = match (time) {
    case Year(x) => x.dt1
    case Month(x) => 9
}

func run(): Int64 {
    if (res1 == 1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
