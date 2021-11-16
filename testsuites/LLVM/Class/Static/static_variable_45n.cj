// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    static let a: Int32 = 2
    var b: Int32
    init(x: Int32) {
        init()
        b = this.a + x      // EXPECTED: regex object cannot access static member 'a'
    }
}

func run(): Int64 {
    var data: Data = Data(1)
    if (Data.a == 2 && data.b == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
