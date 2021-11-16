// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Data<T> {
    let width2: T
    let length2: T

    init(width:T, length: T){
        width2 = width
        length2 = length
    }

    func area(): T {
        return width2
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    let data: Data<Int32> = Data<Int32>(a, b)
    var res: Int32
    res = data.area()
    if (res == 3) {
        return 0
    }
    return 1
}
