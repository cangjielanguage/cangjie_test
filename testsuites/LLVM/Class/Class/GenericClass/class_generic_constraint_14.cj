// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo1 {
    var dt: Int32 = 2
}

class Bar1 <: Foo1 {}

class Data<T1, T2> where T1 <: Foo1 {
    var classBar1: T1
    var i: T2
    init(x: T1, y: T2) {
        classBar1 = x
        i = y
    }
}

func run(): Int64 {
    let bar1: Bar1 = Bar1()
    let i: Int32 = 3
    let data: Data<Bar1, Int32> = Data<Bar1, Int32>(bar1, i)
    var classBar1: Bar1 = data.classBar1
    var res1: Int32 = classBar1.dt
    var res2: Int32 = data.i
    if (res1 == 2 && res2 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
