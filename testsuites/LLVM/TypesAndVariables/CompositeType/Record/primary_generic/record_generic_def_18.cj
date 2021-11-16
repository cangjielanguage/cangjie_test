// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo1 {
    var dt: Int32 = 2
}

class Bar1 <: Foo1 {}

record Data<T, V> where T <: Foo1 {
    let classBar1: T
    let i: V
    Data(x: T, y: V) {
        classBar1 = x
        i = y
    }
}

func run(): Int64 {
    let bar1: Bar1 = Bar1()
    let i: Int32 = 2
    let data: Data<Bar1, Int32> = Data<Bar1, Int32>(bar1, i)
    var res1: Int32 = data.classBar1.dt
    var res2: Int32 = data.i
    if (res1 == 2 && res2 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
