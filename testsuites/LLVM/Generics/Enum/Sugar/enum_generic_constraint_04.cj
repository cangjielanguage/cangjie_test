// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo<T> {
    var dt1: T
    init(x: T){
        dt1 = x
    }
}

class Bar <: Foo<String> {
    var dt: Int32 = 23
    init(){super("abc")}
}

enum Time<T> {
    Day(T)
}

func run(): Int64 {
    let bar: Bar = Bar()
    var time = Time.Day(bar)
    var res: Int32 = match (time) {
        case Day(x) => x.dt
    }
    if (res == 23) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
