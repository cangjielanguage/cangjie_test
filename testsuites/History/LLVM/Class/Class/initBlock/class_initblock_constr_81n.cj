// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


open class Base{
    init {
        var base: Int32 = 4
    }
}


class Data <: Base {
    init {
        var a: Int32 = super.base       // EXPECTED: regex xxx
    }
}

func run(): Int64 {
    var data : Data = Data()
    if (data.base == 4 && data.a == 1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
