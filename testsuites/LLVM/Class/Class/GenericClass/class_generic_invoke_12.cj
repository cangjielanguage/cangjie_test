// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T> {
    let width: T
    let length: T
    init(x: T, y: T){
        width = x
        length = y
    }
}

func run(): Int64 {
    var i1: Int32 = 3
    var i2: Int32 = 2
    var data: Data<Int32>
    if (true){
        data = Data<Int32>(i1, i2)
    }else{
        data = Data<Int32>(i2, i1)
    }
    var width: Int32 = data.width
    var length: Int32 = data.length
    if (width == 3 && length == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
