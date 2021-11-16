// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T1, T2, T3> {
    let a: T1
    let b: T2
    let c: T3
    Data(x: T1, y: T2, z: T3){
        a = x
        b = y
        c = z
    }
}

func run(): Int64 {
    var a: Int64 = 1
    var b: Float64 = 2.2
    var c: Int32 = 2
    var data: Data<Int64, Float64, Int32> = Data<Int64, Float64, Int32>(a, b, c)
    var res1: Int64 = data.a
    var res2: Float64 = data.b
    var res3: Int32 = data.c
    if (res1 == 1 && res2 == 2.2 && res3 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

