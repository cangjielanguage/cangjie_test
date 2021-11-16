// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


open class Base{
    var base: Int32 = 4
}


class Data <: Base {
    init {
        var a: Int32 = 1
        var b: String = "hi"
        var c: Int32 = 2
        super()
        super()     // EXPECTED: regex xxx
    }
}

func run(): Int64 {
    var data : Data = Data()
    if (data.base == 4 && data.a == 1 && data.b == "hi" && data.c == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
