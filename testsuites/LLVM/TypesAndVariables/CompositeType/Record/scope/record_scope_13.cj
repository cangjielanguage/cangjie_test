// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

external record Data {
    var width: Int32 = 1
    var length: Int32 =2
    init(width1:Int32, length1: Int32){
        width = width1
        length = length1
    }
    func area(): Int32 {
        return width*length
    }
}

func run(): Int64 {
    var res: Int32
    var a: Int32 = 3
    var b: Int32 = 4
    let data: Data= Data(3, 4)
    res = data.area()
    if (res == 12){
        return 0
    }
    return 1
}
