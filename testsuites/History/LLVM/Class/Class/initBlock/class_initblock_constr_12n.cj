// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


class Data {
    var i1: Int32 = 2
    init {
        var a: Int32
        var b: String = "string"
        var c: Float32 = 3.1415926
    }
}

func run(): Int64 {
    var data : Data = Data(b:"hello", c:2.59)    // EXPECTED: regex xxx
    if (data.i1 == 2 && data.a == 0 && data.b == "hello" && data.c == 2.59) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
