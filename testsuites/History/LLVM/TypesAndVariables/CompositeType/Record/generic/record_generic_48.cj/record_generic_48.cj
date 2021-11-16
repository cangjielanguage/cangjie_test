// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Foo {
    var dt: Int32 = 2
}

class Bar <: Foo {}

trait Reduce {
    func reduce(left: This, step: Int64): This
}

append Int64 with Reduce {
    func reduce(left: Int64, step: Int64): Int64{
        return left - step
    }
}

record Data<T1, T2>
    where T1 <: Foo, T2 <: Reduce {
    var x: T1
    var y: T2
    init(a: T1, b: T2){
        x = a
        y = b
    }
}

func main(): Int64 {
    var bar: Bar = Bar()
    var i2: Int64 = 4
    var data: Data<Bar, Int64> = Data<Bar, Int64>(bar, i2)
    let res1: Int32 = data.x.dt
    let res2: Int64 = reduce(data.y, 3)
    if ( res1 == 2 && res2 == 1) {
        return 0
    }
    return 1
}