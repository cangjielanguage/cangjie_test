// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo1<T> {
    var dt1: Int32 = 1
}

open class Foo2<T> {
    var dt2: Int32 = 2
}

class Bar1 <: Foo1<Int32> {
    var dt: Int32 = 3
}
class Bar2 <: Foo2<Int32> {
    var dt: Int32 = 4
}

record Data<T1, T2> where T1 <: Foo1<Int32>, T2 <: Foo2<Int32> {
    let classBar1: T1
    let classBar2: T2
    init(x: T1, y: T2) {
        classBar1 = x
        classBar2 = y
    }
}

func run(): Int64 {
    let bar1: Bar1 = Bar1()
    let bar2: Bar2 = Bar2()
    let data: Data<Bar1, Bar2> = Data<Bar1, Bar2>(bar1, bar2)
    var classBar1: Bar1 = data.classBar1
    var classBar2: Bar2 = data.classBar2
    var res1: Int32 = classBar1.dt
    var res2: Int32 = classBar2.dt
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
