// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    init {
        static var a: Int32 = 1  // EXPECTED: regex 'static' modifier is illegal for variable declaration in function body
    }
}

func run(): Int64 {
    if (Data.a == 1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
