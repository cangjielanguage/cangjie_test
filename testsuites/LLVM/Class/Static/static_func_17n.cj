// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    init(){
        static func foo(x: Int32): Int32 { return x+2 }         // EXPECTED: regex 'static' modifier is illegal for function declaration in function body
    }
}

func run(): Int64 {
    var data: Data = Data()
    if (data.foo(2) != 4) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
