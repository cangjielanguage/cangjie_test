// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base{
    var a: Int32 = 4
}

class Data <: Base {
    static func coo(x: Int32): Int32{
        return super.a       // EXPECTED: regex non-static variable 'super' cannot be referenced from a static context
    }
}

func run(): Int64 {
    if (Data.coo(2) != 4) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
