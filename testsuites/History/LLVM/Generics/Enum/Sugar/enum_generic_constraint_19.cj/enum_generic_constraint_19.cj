// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

open class Foo1 {
    var dt: Int32 = 2
}

class Bar1 <: Foo1 {
}

open class Foo2<T> {
    var dt: T
    init(x: T){
        dt = x
    }
}

class Bar2 <: Foo2<Bar2> {
    var dt: Int32 = 4
    init(){super("abc")}
}

trait Add {
    func autoInc(left: This, step: This): This
}

trait Reduce<T> {
    func reduce(left: This, step: T): This
}

append Int32 with Add {
    func autoInc(left: Int32, step: Int32): Int32{
        return left + step
    }
}

append Int64 with Reduce<Int64> {
    func reduce(left: Int64, step: Int64): Int64{
        return left - step
    }
}

enum Time<T1, T2, T3, T4> {
    Year(T1) | Month(T2) | Day(T3) | Hour(T4)
}

func run(): Int64 {
    var bar1: Bar1 = Bar1()
    var bar2: Bar2 = Bar2()
    var i1: Int32 = 3
    var i2: Int64 = 4
    var time1 = Time.Year(bar1) // EXPECTED: regex error.*?no matching enum constructor 'Year' for given arguments
    var time2 = Time.Month(bar2) // EXPECTED: regex error.*?no matching enum constructor 'Month' for given arguments
    var time3 = Time.Day(i1) // EXPECTED: regex error.*?no matching enum constructor 'Day' for given arguments
    var time4 = Time.Hour(i2) // EXPECTED: regex error.*?no matching enum constructor 'Hour' for given arguments
    var res1: Int32 = match (time1) {
        case Year(x) => x.dt
        case Month(x) => 1
        case Day(x) => 2
        case Hour(x) => 3
    }
    var res2: Int32 = match (time2) {
        case Year(x) => 1
        case Month(x) => x.dt
        case Day(x) => 2
        case Hour(x) => 3
    }
    var res3: Int32 = match (time3) {
        case Year(x) => 1
        case Month(x) => 2
        case Day(x) => autoInc(x, 3)
        case Hour(x) => 3
    }
    var res4: Int64 = match (time4) {
        case Year(x) => 1
        case Month(x) => 2
        case Day(x) => 3
        case Hour(x) => reduce(x, 3)
    }

    if ( res1 == 2 && res2 == 4 && res3 == 6 && res4 == 1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
