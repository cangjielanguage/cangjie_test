// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
    static protected let a: Int32 = 1
}

class Data <: Base {
    static let b:Int32 = Base.a
}

func run(): Int64 {
    if (Base.a != 1) {    // EXPECTED: regex can not access field 'a'
        return 1
    }
    if (Data.a != 1) { // EXPECTED: regex can not access field 'a'
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
