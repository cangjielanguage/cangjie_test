// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    var a : Int32 = 1
    var b : Int32 = b // EXPECTED: regex  undeclared identifier 'b'
    init() {
        a = 10
        b = 20
        print("yes\n")
    }
}

func run(): Int64 {
    var data: Data = Data()
    return 0
}

func main(): Int64 {
    return run()
}



