// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T> {
    let width: T

    init(x: T){
        width = x
    }
}

func run(): Int64 {
    var width: UInt64 = 18446744073709551615
    let data: Data<UInt64> = Data<UInt64>(width)
    var res = data.width
    if (res == width) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

