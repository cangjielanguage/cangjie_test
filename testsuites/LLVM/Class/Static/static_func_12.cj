// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface I {
    static func foo(x: Int32): Int32 {
        return x + 2
    }
}

func run(): Int64 {
    if (I.foo(2) != 4) {  // EXPECTED: regex function 'foo' cannot be accessed by interface name 'I'
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
