// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

external record Data<T> {
    let width: T
    let length: T
    init(width1:T, length1: T){
        width = width1
        length = length1
    }
    func area(): T {
        return width
    }
}

func run(): Int64 {
    var res: Int32
    var a: Int32 = 3
    var b: Int32 = 4
    let data: Data<Int32>= Data<Int32>(3, 4)
    res = data.area()
    if (res == 3){
        return 0
    }
    return 1
}
