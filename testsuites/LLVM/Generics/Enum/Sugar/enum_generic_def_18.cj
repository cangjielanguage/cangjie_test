// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo1 {
    var dt: Int32 = 2
}

class Bar1 <: Foo1 {}

enum TimeUnit<T, V> where T <: Foo1 {
    Year(T, V)
}

func run(): Int64 {
    let bar1: Bar1 = Bar1()
    let i: Int32 = 2
    let time = TimeUnit.Year(bar1, i)
    var res1: Int32 = match (time) {
        case Year(x, y) => x.dt+y
        case _ => 0
    }
    if (res1 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
