// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


record Data<T> {
    init {
        var b: Int64 = Data<String>.foo<Int64>("hello", 4)
    }
    static func foo<K>(x: T, y: K):K { return y }
}

func run(): Int64 {
    var data : Data<Int32> = Data<Int32>()
    if (data.b == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
