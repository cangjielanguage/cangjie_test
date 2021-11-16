// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    func foo(x: Int32){ return x }
    static func coo(x: Int32): Int32{
        return foo(x)       // EXPECTED: regex 'foo' is non-static member, cannot be accessed by static function 'coo'
    }
}

func run(): Int64 {
    if (Data.coo(2) != 4) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
