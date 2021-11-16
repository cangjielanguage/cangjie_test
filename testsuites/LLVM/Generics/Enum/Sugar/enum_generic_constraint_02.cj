// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo {
    var dt: Int32 = 2
}

class Bar <: Foo {
    var dt1: Int32 = 4
}

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var foo: Foo= Foo()
    var time = Time.Day(foo)
    var res: Int32 = match (time) {
        case Day(x) => x.dt
    }
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
