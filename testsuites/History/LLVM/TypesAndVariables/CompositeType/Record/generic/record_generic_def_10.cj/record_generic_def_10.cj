// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Add {
    func autoInc(left: This, step: Int64): This
}

append Int64 with Add {
    func autoInc(left: Int64, step: Int64): Int64{
        return left + step
    }
}

record Data<T>
    where T <: Add {
    var x: T
    init(a: T){
        x = a
    }
}

func run(): Int64 {
    var i1: Int64 = 4
    var data: Data<Int64> = Data<Int64>(i1)
    let res1: Int64 = autoInc(data.x, 3)
    let res2: Int64 = autoInc(data.x, 4)
    if ( res1 == 7 && res2 == 8) {
        return 0
    }
    return 1
}


func main(): Int64 {
    return run()
}
