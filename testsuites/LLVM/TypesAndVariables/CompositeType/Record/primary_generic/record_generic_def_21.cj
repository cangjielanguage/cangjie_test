// EXEC: %compiler %cmp_opt %n.cj -o %output
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

record Data<T, V, K>
    where T <: Foo1, V <: Foo2, K <: Foo3 {
    let classBar1: T
    let classBar2: V
    let classBar3: K
    Data(x: T, y: V, z: K) {
        classBar1 = x
        classBar2 = y
        classBar3 = z
    }
}

func run(): Int64 {
    let bar1: Bar1 = Bar1()
    let bar2: Bar2 = Bar2()
    let bar3: Bar3 = Bar3()
    let data: Data<Bar1, Bar2, Bar3> = Data<Bar1, Bar2, Bar3>(bar1, bar2, bar3)
    var res1: Int32 = data.classBar1.dt
    var res2: Int32 = data.classBar2.dt
    var res3: Int32 = data.classBar3.dt
    if (res1 == 2 && res2 == 3 && res3 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
