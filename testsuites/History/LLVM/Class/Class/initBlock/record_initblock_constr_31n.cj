// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


record Data {
    var i1: Int32 = 2
    init {
        var a: Int32 = 1
        var b: String = "hi"
        var c:Int32 = 2
    }
    init() {}       // EXPECTED: regex xxx
}

func run(): Int64 {
    var data : Data = Data()
    if (data.i1 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
