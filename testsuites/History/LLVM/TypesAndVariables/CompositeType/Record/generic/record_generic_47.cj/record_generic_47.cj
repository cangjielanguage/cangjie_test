// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Add<T> {
    func autoInc(left: This, step: T): This
}

trait Reduce<T> {
    func reduce(left: This, step: T): This
}

append Int32 with Add<Int32> {
    func autoInc(left: Int32, step: Int32): Int32{
        return left + step
    }
}

append Int64 with Reduce<Int64> {
    func reduce(left: Int64, step: Int64): Int64{
        return left - step
    }
}

record Data<T1, T2>
    where T1 <: Add<T1>, T2 <: Reduce<T2> {
    var x: T1
    var y: T2
    init(a: T1, b: T2){
        x = a
        y = b
    }
}

func run(): Int64 {
    var i1: Int32 = 4
    var i2: Int64 = 4
    var data: Data<Int32, Int64> = Data<Int32, Int64>(i1, i2)
    let res1: Int32 = autoInc(data.x, 3)
    let res2: Int64 = reduce(data.y, 3)
    if ( res1 == 7 && res2 == 1) {
        return 0
    }
    return 1
}
