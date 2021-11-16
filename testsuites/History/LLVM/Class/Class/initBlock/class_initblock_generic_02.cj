// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


class Data<T> {
    init {
        var i: Int32 = Data<Int32>.foo(4)
    }
    static func foo(x: T):T { return x }
}

func run(): Int64 {
    var data : Data<Int32> = Data<Int32>()
    if (data.i == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
