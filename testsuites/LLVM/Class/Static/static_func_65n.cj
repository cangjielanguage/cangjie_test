// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    static func foo(x: Int32){ return x }
    var b: Int32
    init(){
        b = this.foo(2)      // EXPECTED: regex object cannot access static member 'foo'
    }
}

func run(): Int64 {
    var data: Data = Data()
    if (data.b != 2) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
