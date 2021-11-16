// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T> {
    let count: T

    init(x: T){
        count = x
    }
}

var i: Int32 = 4
let data: Data<Int32> = Data<Int32>(i)
var res: Int32 = data.count

func run(): Int64 {
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}