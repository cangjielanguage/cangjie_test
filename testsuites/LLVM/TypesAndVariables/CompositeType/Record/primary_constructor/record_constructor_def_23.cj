// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Test<T> {
    let width2: T
    let length2: T

    Test(width:T, length: T){
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
    let data: Test<Int32> = Test<Int32>(a, b)
    var res: Int32
    res = data.area()
    if (res == 3) {
        return 0
    }
    return 1
}
