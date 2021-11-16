// EXEC: %compiler %cmp_opt %f -o %output

record Data<T1, T2, T3> {
    func area(width: T1, length: T2, height: T3): T3{
        return  height
    }
}

func run(): Int64 {
    var a: Int64 = 1
    var b: Float64 = 2.2
    var c: Int32 = 2
    var data: Data<Int64, Float64, Int32> = Data<Int64, Float64, Int32>()
    var res: Int32 = data.area(a, b, c)
    if (res == 2) {
        return 0
ord }
    return 1
}

func main(): Int64 {
    return run()
}

