// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo1 {
    var dt: Int32 = 2
}

open class Foo2 {
    var dt: Int32 = 3
}

open class Foo3 {
    var dt: Int32 = 4
}

class Bar1 <: Foo1 {}
class Bar2 <: Foo2 {}
class Bar3 <: Foo3 {}

enum TimeUnit<T, V, K>
    where T <: Foo1, V <: Foo2, K <: Foo3 {
    Year(T, V, K)
}

func run(): Int64 {
    let bar1: Bar1 = Bar1()
    let bar2: Bar2 = Bar2()
    let bar3: Bar3 = Bar3()
    let time = TimeUnit.Year(bar1, bar2, bar3)
    var res: Int32 = match (time) {
        case Year(x, y, z) => x.dt+y.dt+z.dt
        case _ => 9
    }
    if (res == 9) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
