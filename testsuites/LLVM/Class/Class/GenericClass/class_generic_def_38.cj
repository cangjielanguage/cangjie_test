// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

class Data<T>{
    let width: T
    init(widthin: T){
        width = widthin
    }
}

func run(): Int64 {
    var a: Int32 = 3
    let data: Data<Int32> = Data<Int32>(a)
    let res: Int32 = data.width
    if (res == 3){
        return 0
    }
    return 1
}
