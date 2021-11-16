// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo1 {
    var i1: Int32 = 2
}

open class Foo2 {
    var i2: Int32 = 3
}

class Bar1 <: Foo1 {
    var i: Int32 = 4
}
class Bar2 <: Foo2 {
    var i: Int32 = 5
}

enum TimeUnit<T, V> where T <: Foo1, V <: Foo2 {
    Year(T, V)
}

func run(): Int64 {
    let bar1: Bar1 = Bar1()
    let bar2: Bar2 = Bar2()
    let time = TimeUnit<Bar1, Bar2>.Year(bar1, bar2)
    var res: Int32 = match (time) {
        case Year(x, y) =>x.i+y.i
        case _ => 0
    }
    if (res == 9) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
