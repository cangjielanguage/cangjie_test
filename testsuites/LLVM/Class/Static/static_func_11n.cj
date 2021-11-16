// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

record Data {
    static private func foo(x: Int32): Int32 {
        return x
    }
}

func run(): Int64 {
    if (Data.foo(2) != 2) { // EXPECTED: regex no matching function declaration for function call
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
