// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

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

enum Time<T1, T2> {
    Day(T1) | Hour(T2)
}

func run(): Int64 {
    var i1: Int32 = 4
    var i2: Int64 = 4
    var time1 = Time.Day(i1) // EXPECTED: regex error.*?matching enum constructor 'Day' for given arguments
    var time2 = Time.Hour(i2) // EXPECTED: regex error.*?matching enum constructor 'Hour' for given arguments
    let res1: Int32 = match (time1) {
        case Day(x) => autoInc(x, 2)
        case Hour(x) => 12
    }
    let res2: Int64 = match (time2) {
        case Day(x) => 12
        case Hour(x) => reduce(x, 1)
    }
    if ( res1 == 6 && res2 == 3) {
        return 0
    }
    return 1
}


func main(): Int64 {
    return run()
}
