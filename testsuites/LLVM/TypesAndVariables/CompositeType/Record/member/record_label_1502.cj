// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record Test {
    let a: () -> Int32 = f    // EXPECTED: regex 'f' is not allowed to be accessed before all member variables are initialized
    func f(): Int32{
        return 1
    }
}

func run(): Int64 {
    let res = Test().a()
    if (res == 1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

