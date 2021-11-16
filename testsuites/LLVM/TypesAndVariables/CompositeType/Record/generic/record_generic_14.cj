// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T1, T2, T3> {
    let width: T2
    let length: T3
    init(x: T2, y: T3){
        width = x
        length = y
    }
    func area<V>(height: V): V{
        return  height
    }
}

func run(): Int64 {
    var width: Float64 = 2.2
    var length: Int32 = 2
    var data: Data<Int64, Float64, Int32> = Data<Int64, Float64, Int32>(width, length)
    var res1: Float64 = data.width
    var res2: Int32 = data.length
    var height: Float64 = 2.3
    var res3: Float64 = data.area<Float64>(height)
    if (res1 == 2.2 && res2 == 2 && res3 == 2.3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

