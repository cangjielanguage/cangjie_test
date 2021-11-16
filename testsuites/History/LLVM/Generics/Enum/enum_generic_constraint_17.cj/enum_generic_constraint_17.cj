// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Add<T> {
    func autoInc(left: This, step: T): This
}

trait Reduce<T> {
    func reduce(left: This, step: T): This
}

append Int32 with Add<Int32> {
    func autoInc(left: Int32, step: Int32): Int32{
        return left + step
    }
}

append Int64 with Reduce<Int64> {
    func reduce(left: Int64, step: Int64): Int64{
        return left - step
    }
}

enum Time<T1, T2>
    where T1 <: Add<T1>, T2 <: Reduce<T2> {
    Day(T1) | Hour(T2)
}

func run(): Int64 {
    var i0: Int64 = 1
    var i4: Int32 = 2
    var i1: Int32 = 4
    var i2: Int64 = 4
    var time1 = Time<Int32, Int64>.Day(i1)
    var time2 = Time<Int32, Int64>.Hour(i2)
    let res1: Int32 = match (time1) {
        case Day(x) => autoInc(x, i4)
        case Hour(x) => 12
    }
    let res2: Int64 = match (time2) {
        case Day(x) => 12
        case Hour(x) => reduce(x, i0)
    }
    if ( res1 == 6 && res2 == 3) {
        return 0
    }
    return 1
}


func main(): Int64 {
    return run()
}
