// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T1,T2,T3> {
    let width: Int32
    let length: Int32
    Data(x: Int32, y: Int32){
        width = x
        length = y
    }
    func area(height: Int32): Int32{
        return  width*length*height
    }
}

func run(): Int64 {
    var width: Int32 = 1
    var length: Int32 = 2
    var height: Int32 = 3
    var data: Data<Int64, Float64, Int32> = Data<Int64, Float64, Int32>(width, length)
    var res1: Int32 = data.width
    var res2: Int32 = data.length
    var res3: Int32 = data.area(height)
    if (res1 == 1 && res2 == 2 && res3 == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

