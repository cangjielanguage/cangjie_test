// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


open class Base {
    var base: Int32 = 3
    init(){
        init()  // EXPECTED: regex xxx
    }
}

class Data <: Base {
    init {
        a: Int32 = 1
        b: String = "hi"
        c: Int32 = 2
        super()
    }
}

func run(): Int64 {
    var data : Data = Data()
    if (data.base == 3 && data.a == 1 && data.b == "hi" && data.c == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
