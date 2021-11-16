// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T> {
    let width: T

    Data(x: T){
        width = x
    }
}

func run(): Int64 {
    var width: UInt8 = 255
    let data: Data<UInt8> = Data<UInt8>(width)
    var res = data.width
    if (res == width) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

