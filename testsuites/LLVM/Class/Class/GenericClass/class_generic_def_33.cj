// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T1, T2, T3> {
    let b: T2
    let c: T3
    init(y: T2, z: T3){
        b = y
        c = z
    }
}

func run(): Int64 {
    var b: Float64 = 2.2
    var c: Int32 = 2
    var data: Data<Int64, Float64, Int32> = Data<Int64, Float64, Int32>(b, c)
    var res1: Float64 = data.b
    var res2: Int32 = data.c
    if (res1 == 2.2 && res2 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

