// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data  {
    static let a: Int32 = Data.b // EXPECTED: regex variable 'b' is used before initialization
    static let b: Int32 = Data.a
}

func run(): Int64 {
    if (Data.a != 1 || Data.b != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
