// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo {
    var dt: Int32 = 2
}

class Bar <: Foo {}

trait Reduce {
    func reduce(left: This, step: Int64): This
}

append Int64 with Reduce {
    func reduce(left: Int64, step: Int64): Int64{
        return left - step
    }
}

enum Time<T1, T2> {
    Day(T1) | Hour(T2)
}

func run(): Int64 {
    var bar: Bar = Bar()
    var i2: Int64 = 4
    var time1 = Time<Bar, Unit>.Day(bar)
    var time2 = Time<Unit, Int64>.Hour(i2)
    let res1: Int32 = match (time1) {
        case Day(x) => x.dt
        case Hour(x) => 12
    }
    let res2: Int64 = match (time2) {
        case Day(x) => 12
        case Hour(x) => reduce(x, 1)
    }
    if ( res1 == 2 && res2 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
