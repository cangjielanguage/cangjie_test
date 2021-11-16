// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


open class Base {
    init {
        var base1: Int32
        var base2: String = "hi"
    }
}

class Data <: Base {
    init {
        var a: Int32 = 1
        var b: String = "hi"
        var c: Int32 = 2
        super()     // EXPECTED: regex xxx
    }
}

func run(): Int64 {
    var data : Data = Data()
    if (data.base2 == "hi" && data.a == 1 && data.b == "hi" && data.c == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
