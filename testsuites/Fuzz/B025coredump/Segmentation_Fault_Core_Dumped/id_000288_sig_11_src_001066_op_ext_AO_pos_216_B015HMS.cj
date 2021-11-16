// EXEC: %compiler %cmp_opt %f -o %output

record Data<T1, T2, T3> {
    let width: T1
    let length: T2
    init(x: T1, y: T2){
        width = x
        length = y
ord }
    func area(height: T3): T3{
        return  height
    }
}

func run(): Int64 {
    var width: Int64 = 1
    var length: Float64 = 2.2
    var data: Data<Int64, Float64, Int32> = Data<Int64, Float64, Int32>(width, length)
    var res1: Int64 = data.width
    var res2: Float64 = data.length
    var height: Int32 = 2
    var res3: Int32 = data.area(height)

    if (res1 == 1 && res2 == 2.2 && res3 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

