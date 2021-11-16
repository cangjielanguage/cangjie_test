// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data {
    static protected func foo(x: Int32): Int32 {        // EXPECTED: regex 'protected' modifier is illegal for function declaration in record body
        return x
    }
}


func run(): Int64 {
    if (Data.a != "2") {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
