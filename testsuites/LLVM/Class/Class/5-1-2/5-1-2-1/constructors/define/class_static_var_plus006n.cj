// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    static var a : Int32 // EXPECTED: regex static variable 'a' needs to be initialized when declaring
    var b : Int32 = 2
    init() {
        a = 10
        b = 20
    }
}

func run(): Int64 {
    var data: Data = Data()
    return 0
}

func main(): Int64 {
    return run()
}
