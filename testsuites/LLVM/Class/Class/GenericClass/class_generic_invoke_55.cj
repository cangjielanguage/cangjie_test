// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func getHeight(height: Int64): Int64{
    return  height*2
}

class Data<T> {
    let width: T

    init(x: T){
        width = x
    }
}

func run(): Int64 {
    let data: Data<(Int64)->Int64> = Data<(Int64)->Int64>(getHeight)
    var res = data.width(5)
    if (res == 10) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

