// EXEC-PIPE-1:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface I {
    static func f<T>(): Unit    // EXPECTED: regex abstract generic function is not allowed in interface
}

abstract class Base{
    func foo<T>():Unit  // EXPECTED: regex abstract generic function is not allowed in abstract class
}

func main():Int64 {
    return 0
}
