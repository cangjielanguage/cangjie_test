// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

class Data<T>{
    var width: T
    init(widthin: T){
        width = widthin
    }
    func area(x: T): T{
        width = x
        return width
    }
}

func run(): Int64 {
    var i1: Int32 = 3
    var i2: Int32 = 4
    let data: Data<Int32> = Data<Int32>(i1)
    let res1: Int32 = data.width
    let res2: Int32 = data.area(i2)
    if (res1 == 3 && res2 == 4){
        return 0
    }
    return 1
}
