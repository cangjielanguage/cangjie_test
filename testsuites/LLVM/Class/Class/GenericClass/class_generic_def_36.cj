// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T1, T2, T3> {
    let width: T1
    let height: T3
    init(x: T1, z: T3){
        width = x
        height = z
    }
    func area(length: T2): T3{
        return  height
    }
}

func run(): Int64 {
    var width: Int64 = 3
    var length: Float64 = 2.2
    var height: Int32 = 4
    var data: Data<Int64, Float64, Int32> = Data<Int64, Float64, Int32>(width, height)
    var res1: Int64 = data.width
    var res2: Int32 = data.area(length)
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

