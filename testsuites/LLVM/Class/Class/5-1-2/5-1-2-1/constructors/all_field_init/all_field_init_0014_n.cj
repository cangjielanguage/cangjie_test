// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    var a : Int32
    var b : Int32
    init() {        // EXPECTED: regex the uninitialized member variable 'b' is not initialized in the constructor of class or record
        a = 100
        if (a > 200) {
            b = 200
        }
    }
}


func run(): Int64 {
    var value : Data = Data();
    return 1
}

func main(): Int64 {
    return run()
}

