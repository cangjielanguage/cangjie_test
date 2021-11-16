// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T> {
    let width: T
    init(x: T) {
        width = x
    }
}

func run(): Int64 {
    var width: Int8 = 126
    let data: Data<Int8> = Data<Int8>(width)
    var res = data.width
    if (res == width) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

