// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface Base {
    static let a: Int32 = 1     // EXPECTED: regex 'static' modifier is illegal for variable declaration in interface body
}

func run(): Int64 {
    if (Base.a != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
