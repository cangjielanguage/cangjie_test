// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data {
    // init { static func foo(x: Int32): Int32 { return x+1 } }
    init(){
        static func foo(x: Int32): Int32 { return x+1 }         // EXPECTED: regex  'static' modifier is illegal for function declaration in function body
    }
}

func run(): Int64 {
    if (I.foo(2) != 4) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
