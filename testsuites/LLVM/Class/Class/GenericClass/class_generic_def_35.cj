// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T1, T2, T3> {
    func area(width: T1, length: T2, height: T3): T1{
        return  width
    }
}

func run(): Int64 {
    var a: Int64 = 1
    var b: Float64 = 2.2
    var c: Int32 = 2
    var data: Data<Int64, Float64, Int32> = Data<Int64, Float64, Int32>()
    var res: Int64 = data.area(a, b, c)
    if (res == 1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

