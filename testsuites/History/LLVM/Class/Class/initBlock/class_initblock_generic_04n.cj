// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


class Data<T> {
    init {
        var a: T
        var b: T = Data<T>.foo(a)       // EXPECTED: regex xxx
    }
    static func foo(x: T):T { return x }
}

func run(): Int64 {
    var data : Data<Int32> = Data<Int32>(4)
    if (data.b == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
