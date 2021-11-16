// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo {
    var dt: Int32 = 2
}

class Bar <: Foo {}

enum TimeUnit<T>
    where T <: Foo {
        Year(T)
}

func run(): Int64 {
    let bar: Bar= Bar()
    let time = TimeUnit<Bar>.Year(bar)
    var res: Int32 = match (time) {
        case Year(bar) => bar.dt
    }
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
