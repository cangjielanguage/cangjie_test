// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo1 {
    var dt: Int32 = 2
}

class Bar1 <: Foo1 {}

open class Foo2<T> {
    var dt: Int32 = 2
}

class Bar2 <: Foo2<Int32> {
    var dt: Int32 = 4
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

class Data<T1, T2, T3, T4>
    where T1 <: Foo1, T2 <: Foo2<T3>, T3 <: Add, T4 <: Reduce<T4> {
    var x: T1
    var y: T2
    var z: T3
    var w: T4
    init(a: T1, b: T2, c:T3, d: T4){
        x = a
        y = b
        z = c
        w = d
    }
}

func run(): Int64 {
    var bar1: Bar1 = Bar1()
    var bar2: Bar2 = Bar2()
    var i1: Int32 = 3
    var i2: Int64 = 4
    var data: Data<Bar1, Bar2, Int32, Int64> = Data<Bar1, Bar2, Int32, Int64>(bar1,bar2, i1, i2)
    let res1: Int32 = data.x.dt
    let res2: Int32 = data.y.dt
    let res3: Int64 = autoInc(data.z, 3)
    let res4: Int64 = reduce(data.w, 3)
    if ( res1 == 2 && res2 == 4 && res3 == 6 && res4 == 1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
