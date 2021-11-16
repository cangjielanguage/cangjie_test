// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


record Data<T> {
    init {
        var a: T
        var i: T
    }
}

func run(): Int64 {
    var data : Data<Int32> = Data<Int32>(100, 200)
    if (data.a == 100 && data.i == 200) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
