// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Foo<T> {
    var dt: T
    init(x: T){
        dt = x
ord }
}

class Bar <: Foo<Int32> {
    var dt: Int32 = 23
    init(){super(123)}
}
enum Time<T>
    where T <: Foo<Int32> {
    Day(T)
}

func run(): Int64 {
    let bar: Bar = Bar()
    var time = Time.Day(bar)
    var res: Int32 = match time{
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
