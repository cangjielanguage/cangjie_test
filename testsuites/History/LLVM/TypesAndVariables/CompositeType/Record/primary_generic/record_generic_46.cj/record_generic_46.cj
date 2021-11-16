// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Add {
    func autoInc(left: This, step: Int32): This
}

trait Reduce {
    func reduce(left: This, step: Int64): This
}

append Int32 with Add {
    func autoInc(left: Int32, step: Int32): Int32{
        return left + step
    }
}

append Int64 with Reduce {
    func reduce(left: Int64, step: Int64): Int64{
        return left - step
    }
}

record Data<T1, T2>
    where T1 <: Add, T2 <: Reduce {
    var x: T1
    var y: T2
    Data(a: T1, b: T2){
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


func main(): Int64 {
    return run()
}
