// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    static var a: Int32
    a = 1   // EXPECTED: regex illegal class member in class block
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
