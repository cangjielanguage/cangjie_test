// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo {
    var dt1: Int32 = 2
}

class Bar <: Foo {
    var dt: Int32 = 4
}

enum Time<T>
    where T <: Foo{
    Day(T)
}

func run(): Int64 {
    var bar: Bar= Bar()
    var time  = Time.Day(bar)
    var res: Int32 = match (time) {
        case Day(x) => x.dt
    }
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
