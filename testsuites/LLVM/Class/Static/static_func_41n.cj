// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    static func foo(a: Int32): Int32     // EXPECTED: regex function 'foo' can not be abstract
}

func run(): Int64 {
    if (Data.foo(2) != 4) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
